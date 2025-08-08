import 'package:flutter/material.dart';

class ColorLineWidget extends StatelessWidget {
  final List<Color> colors;
  final void Function()? onTap;
  final int? selectedIndex;
  final void Function(int index)? onColorChange;
  final double radius;
  final double dotMargin;
  final double borderWidth;
  final bool vertical;

  const ColorLineWidget({
    super.key,
    required this.colors,
    this.onTap,
    this.radius = 28,
    this.dotMargin = 4,
    this.vertical = false,
    this.borderWidth = 1,
    this.selectedIndex,
    this.onColorChange,
  });

  @override
  Widget build(BuildContext context) {
    final dots = List.generate(colors.length, (index) {
      final isSelected = index == selectedIndex;
      return _buildColorDot(colors[index], index,isSelected);
    });

    return vertical
    ? Column(children: dots)
        : Row(children: dots);
  }

  Widget _buildColorDot(Color color, int index,bool isSelected) {
    return GestureDetector(
      onTap: () {
        onColorChange?.call(index);
        onTap?.call();
      },
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: Colors.white, width: borderWidth)
              : null,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: radius - dotMargin,
            height: radius - dotMargin,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
