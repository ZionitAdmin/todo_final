import 'package:flutter/material.dart';

enum BorderVariant {
  all,
  top,
  bottom,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  end,
  start,
  none
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.color,
    this.width = double.infinity,
    this.height,
    this.child,
    this.borderRadius = 15,
    this.borderVariant = BorderVariant.none,
    this.border,
    this.margin,
  });

  final Color? color;
  final double width;
  final Widget? child;
  final double borderRadius;
  final BorderVariant borderVariant;
  final double? height;
  final BoxBorder? border;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
          color: color,
          borderRadius: _setBorderRadius(borderVariant, borderRadius),
          border: border),
      child: child,
    );
  }
}

BorderRadius? _setBorderRadius(BorderVariant variant,
    [double borderRadius = 15]) {
  switch (variant) {
    case BorderVariant.all:
      return BorderRadius.circular(borderRadius);
    case BorderVariant.none:
      return null;
    case BorderVariant.top:
      return BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius));
    case BorderVariant.bottom:
      return BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius));
    case BorderVariant.topLeft:
      return BorderRadius.only(topLeft: Radius.circular(borderRadius));
    case BorderVariant.topRight:
      return BorderRadius.only(topRight: Radius.circular(borderRadius));
    case BorderVariant.bottomLeft:
      return BorderRadius.only(bottomLeft: Radius.circular(borderRadius));
    case BorderVariant.bottomRight:
      return BorderRadius.only(bottomRight: Radius.circular(borderRadius));
    case BorderVariant.end:
      return BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius));
    default:
      return null;
  }
}
