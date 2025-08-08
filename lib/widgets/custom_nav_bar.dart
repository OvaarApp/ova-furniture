import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ova_furniture_ui/theme/app_color.dart';
import 'package:ova_furniture_ui/theme/app_text_style.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<NavBarItem> tabs;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 85,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColor.second,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (index) {
          return Flexible(
            flex: index == currentIndex ? 2 : 1,
            child: NavBarItemWidget(
              svgPath: tabs[index].svgPath,
              label: tabs[index].label,
              isSelected: index == currentIndex,
              onTap: () => onTap(index),
            ),
          );
        }),
      ),
    );
  }
}

class NavBarItem {
  final String svgPath;
  final String label;

  NavBarItem({required this.svgPath, required this.label});
}

class NavBarItemWidget extends StatelessWidget {
  final bool isSelected;
  final String svgPath;
  final String label;
  final VoidCallback onTap;

  const NavBarItemWidget({
    super.key,
    this.isSelected = false,
    required this.svgPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      height: 70,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.first : Colors.grey.withAlpha(100),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/$svgPath', // exemple : 'assets/icons/home.svg'
                width: 26,
                height: 26,
                color: Colors.white,
              ),
            ),
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                label,
                style: AppTextStyle.small(color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
