import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ova_furniture_ui/screens/layout.dart';
import 'package:ova_furniture_ui/theme/app_text_style.dart';
import 'package:ova_furniture_ui/widgets/color_line_widget.dart';
import 'package:slider_button/slider_button.dart';
import 'dart:math';

import '../theme/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Widget buildGlassContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
            padding: EdgeInsets.all(16),
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Livingroom',
                    style: AppTextStyle.small(color: Colors.white)
                        .copyWith(fontSize: 12),
                  ),
                ),
                Text(
                  'Modern Luxe chair',
                  style: AppTextStyle.medium(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Available color:',
                  style: AppTextStyle.small(color: Colors.white),
                ),
                SizedBox(height: 4,),
                ColorLineWidget(
                    selectedIndex: 0,
                    radius: 24,
                    dotMargin: 8,
                    colors: [Colors.white, Colors.green, Colors.blue]),
                Row(
                  children: [
                    Text(
                      '\$120.86',
                      style: AppTextStyle.large(
                          color: Colors.white, fontWeight: FontWeight.bold).copyWith(fontSize: 24),
                    ),
                    Spacer(),
                    Transform.rotate(
                        angle: -pi / 4,
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white.withAlpha(100),
                              padding: EdgeInsets.all(14)),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/arrow.svg',
                            height: 22,
                            width: 22,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Stack(
              children: [
                Row(
                  children: [
                    SizedBox(width: 30),
                    SizedBox(
                      height: 150,
                      child: VerticalDivider(
                        color: Colors.white.withAlpha(100),
                        thickness: 1,
                        width: 40,
                      ),
                    ),
                    Text(
                      'Furniture\nin Your\nStyle',
                      style: AppTextStyle.large(
                              color: Colors.white, fontWeight: FontWeight.bold)
                          .copyWith(fontSize: 30),
                    ),
                  ],
                ),
                Positioned(
                  left: -50,
                  top: 60,
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: Text(
                      'Furniture shop',
                      style:
                          AppTextStyle.large(color: Colors.white.withAlpha(150))
                              .copyWith(fontSize: 22),
                    ),
                  ),
                ),
                Positioned(top: 250, left: 10, child: buildGlassContainer()),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SliderButton(
                      action: () {
                        // Navigate to next screen
                        return Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 700),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Layout(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      label: Stack(
                        children: [
                          Positioned(
                            top: 7,
                            right: 20,
                            child: Text(
                              '› › ›',
                              style: AppTextStyle.xl(color: Colors.white)
                                  .copyWith(fontSize: 35),
                            ),
                          ),
                        ],
                      ),
                      baseColor: Colors.white,
                      width: 160,
                      radius: 40,
                      buttonColor: AppColor.first,
                      backgroundColor: AppColor.first,
                      highlightedColor: AppColor.first,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 80,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: SvgPicture.asset(
                          'assets/icons/house.svg',
                          color: AppColor.first,
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
