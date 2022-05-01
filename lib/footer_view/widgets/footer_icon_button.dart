import 'package:flutter/material.dart';

class FooterIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const FooterIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
