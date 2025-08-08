import 'package:flutter/material.dart';

List<Widget> applyPadding(List<Widget> widgets) {
  return widgets
      .map((widget) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: widget,
          ))
      .toList();
}
