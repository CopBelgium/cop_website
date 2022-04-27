import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';

class LeadingLogo extends StatelessWidget {
  const LeadingLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {},
      child: SizedBox(
        height: 42,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/cop_logo.png',
              width: 45,
              height: 45,
            ),
            const SizedBox(width: kContentSpacing18),
            AutoSizeText(
              'Church of Pentecost Belgium',
              style: kH5.copyWith(fontWeight: FontWeight.normal, color: kBlue),
            ),
          ],
        ),
      ),
    );
  }
}