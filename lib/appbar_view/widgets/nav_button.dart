import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final String text;
  final VoidCallback? onTap;
  final Function(bool)? onHover;
  const NavButton({
    Key? key,
    this.backgroundColor,
    required this.text,
    this.onTap,
    this.onHover,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: InkWell(
        overlayColor:
            MaterialStateProperty.all(widget.backgroundColor ?? kGreyMedium),
        borderRadius: const BorderRadius.all(
          Radius.circular(kContentSpacing12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: AutoSizeText(
            widget.text,
            style: kH5.copyWith(color: isHovered ? kBlue : kBlack),
          ),
        ),
        onTap: widget.onTap,
        onHover: (value) {
          isHovered = value;
          widget.onHover!(value);
          setState(() {});
        },
      ),
    );
  }
}
