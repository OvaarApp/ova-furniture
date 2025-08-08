import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ova_furniture_ui/theme/app_color.dart';
import '../models/furniture.dart';
import '../screens/detail_screen.dart';
import '../theme/app_text_style.dart';

class CardShape extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;

  const CardShape(
      {super.key, required this.height, required this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: MyCustomPainter(color: color),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final Color? color;

  MyCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color ?? Colors.blue;
    const borderRadius = 35.0;
    const liftHeight = 65.0;

    final path = Path();

    // Start top-left
    path.moveTo(0, borderRadius);
    // Top-left corner
    path.quadraticBezierTo(0, 0, borderRadius, 0);
    // Top side
    path.lineTo(size.width - borderRadius, 0);
    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);
    // Right side
    path.lineTo(size.width, size.height - liftHeight - borderRadius);
    // Bottom-right corner (raised)
    path.quadraticBezierTo(
      size.width,
      size.height - liftHeight,
      size.width - borderRadius,
      size.height - liftHeight,
    );

    // Go left until the lift starts (30% of width)
    double cutX = size.width * 0.6;
    path.lineTo(cutX + borderRadius, size.height - liftHeight);

    // Bottom-left corner of the lifted area (rounded down)
    path.quadraticBezierTo(
      cutX,
      size.height - liftHeight,
      cutX,
      size.height - liftHeight + borderRadius,
    );

    // Down to the full bottom
    path.lineTo(cutX, size.height - borderRadius);
    path.quadraticBezierTo(
      cutX,
      size.height,
      cutX - borderRadius,
      size.height,
    );

    // Continue to bottom-left corner
    path.lineTo(borderRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);

    // Close up the left side
    path.lineTo(0, borderRadius);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class FurnitureCard extends StatelessWidget {
  final Furniture furniture;
  final Color? color;

  const FurnitureCard({super.key, required this.furniture, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(furniture: furniture),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CardShape(
                  color: color,
                  height: 350,
                  width: 300,
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/${furniture.imageName}',
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 90,
                margin: EdgeInsets.only(left: 20, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      furniture.name,
                      style: AppTextStyle.medium(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'By ${furniture.auteur}',
                      style: AppTextStyle.small(color: Colors.white),
                    ),
                    Text(
                      '\$${furniture.price.toString()}',
                      style: AppTextStyle.medium(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColor.second,
                      padding: EdgeInsets.all(16)),
                  onPressed: () {},
                  child: SizedBox(
                    width: 85,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cart',
                          style: AppTextStyle.medium(color: Colors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          'assets/icons/shopping-cart.svg',
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
