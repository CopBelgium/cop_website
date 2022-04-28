import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:cop_website/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeadingLogo extends StatelessWidget {
  const LeadingLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      backgroundColor: Colors.transparent,
      onTap: () {},
      onHover: (value) {},
      child: SizedBox(
        height: 42,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/cop_logo_white_back.jpg',
              width: 42,
              height: 42,
            ),
            const SizedBox(width: kContentSpacing8),
            const _ChurchName(),
          ],
        ),
      ),
    );
  }
}

class _ChurchName extends StatelessWidget {
  const _ChurchName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        String churchName = 'Church of Pentecost Belgium';
        if (screenInfo.isMobile || screenInfo.screenSize.width < 320) {
          churchName = 'COP Belgium';
        }

        // Show only the logo when the screen is smaller then mobile.
        if (screenInfo.screenSize.width < 320) {
          churchName = '';
        }

        return AutoSizeText(
          churchName,
          style: kBody.copyWith(fontWeight: FontWeight.normal, color: kBlue),
        );
      },
    );
  }
}
