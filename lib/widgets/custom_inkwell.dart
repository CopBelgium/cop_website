import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Function(bool)? onHover;
  const CustomInkwell({
    Key? key,
    this.backgroundColor,
    required this.child,
    this.onTap,
    this.onHover,
    this.padding,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(backgroundColor ?? kGreyMedium),
        highlightColor: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(kContentSpacing12),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: child,
        ),
        onTap: onTap,
        onHover: onHover,
      ),
    );
  }
}
