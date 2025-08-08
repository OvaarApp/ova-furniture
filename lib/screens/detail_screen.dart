import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:ova_furniture_ui/models/furniture.dart';
import 'package:ova_furniture_ui/theme/app_color.dart';
import 'package:ova_furniture_ui/theme/app_text_style.dart';
import 'package:ova_furniture_ui/widgets/color_line_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailScreen extends StatefulWidget {
  final Furniture furniture;

  const DetailScreen({
    super.key,
    required this.furniture,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  int zoomIndex = 1;
  late int colorSelectedIndex;

  void colorChange(int value) {
    setState(() {
      colorSelectedIndex = value;
    });
  }

  void onTap(int value) {
    setState(() {
      zoomIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    colorSelectedIndex = widget.furniture.selectedColorIndex ?? 0;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 2.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void zoomIn() {
    _controller.reverse();
  }

  void zoomOut() {
    _controller.forward();
  }


  Widget buildImage() {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        final topPosition = 200 + (_scaleAnimation.value - 1) * 100;

        return Positioned(
          top: topPosition,
          left: 0,
          right: 0,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: ModelViewerWithLoader(
              key: ValueKey('$colorSelectedIndex'),
              src:
                  'assets/models/${widget.furniture.model3D![colorSelectedIndex]}',
              alt: 'A 3D model of ${widget.furniture.name}',
            ),
          ),
        );
      },
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white, padding: EdgeInsets.all(12)),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                CupertinoIcons.back,
                size: 30,
                color: Colors.black.withAlpha(150),
              )),
          Text(
            'Details',
            style: AppTextStyle.medium(fontWeight: FontWeight.bold),
          ),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white, padding: EdgeInsets.all(12)),
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_rounded,
                size: 30,
                color: Colors.black.withAlpha(150),
              )),
        ],
      )),
    );
  }

  Widget buildBackgroundBlur() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.grey.withAlpha(80),
          ),
        ),
      ),
    );
  }

  Widget buildColorSelector() {
    return Positioned(
      top: 250,
      right: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 7, sigmaX: 7),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(48)),
            child: Column(
              children: [
                ColorLineWidget(
                    selectedIndex: colorSelectedIndex,
                    onColorChange: colorChange,
                    borderWidth: 3,
                    dotMargin: 8,
                    radius: 50,
                    vertical: true,
                    colors: widget.furniture.colors),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailContent() {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 64.0, left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    border:
                        zoomIndex == 0 ? Border.all(color: Colors.red) : null,
                    color: AppColor.third,
                    borderRadius: BorderRadius.circular(20)),
                child:
                    Image.asset('assets/images/${widget.furniture.imageName}'),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    border:
                        zoomIndex == 1 ? Border.all(color: Colors.red) : null,
                    color: AppColor.third,
                    borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: -30,
                          right: -20,
                          child: Image.asset(
                            'assets/images/${widget.furniture.imageName}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  widget.furniture.name,
                  style: AppTextStyle.medium(
                    color: AppColor.fourth,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: zoomIndex == 0

                  ? Colors.white : Colors.grey.withAlpha(150),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onPressed: () {
                  onTap(0);
                  zoomOut();
                },
                child: Text('3x3', style: AppTextStyle.small()),
              ),
              const SizedBox(width: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: zoomIndex == 1

                  ? Colors.white : Colors.grey.withAlpha(150),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onPressed: () {
                  onTap(1);
                  zoomIn();
                },
                child: Text('3x5', style: AppTextStyle.small()),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.furniture.description,
            style: AppTextStyle.small(color: AppColor.fourth),
          ),
          const Spacer(),
          Row(
            children: [
              Text('\$${widget.furniture.price}',
                  style: AppTextStyle.large(
                      color: AppColor.fourth, fontWeight: FontWeight.bold)),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.first,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                onPressed: () {},
                child: Text('Buy Now',
                    style: AppTextStyle.medium(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          buildImage(),
          buildColorSelector(),
          Column(
            children: [
              buildAppBar(),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  height: 400,
                  child: Stack(
                    children: [buildBackgroundBlur(), buildDetailContent()],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ModelViewerWithLoader extends StatefulWidget {
  final String src;
  final String alt;

  const ModelViewerWithLoader({
    super.key,
    required this.src,
    required this.alt,
  });

  @override
  State<ModelViewerWithLoader> createState() => _ModelViewerWithLoaderState();
}

class _ModelViewerWithLoaderState extends State<ModelViewerWithLoader> {
  @override
  void initState() {
    super.initState();
  }

  Widget isLoad() {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: AppColor.third,
              size: 30,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        isLoad(),
        SizedBox(
          height: 300,
          child: ModelViewer(
            src: widget.src,
            alt: widget.alt,
            autoRotate: true,
            cameraControls: true,
            ar: true,
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
