import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/appbar_view/widgets/leading_logo.dart';
import 'package:cop_website/appbar_view/widgets/navigation_items.dart';
import 'package:cop_website/districts_view/district_view.dart';
import 'package:cop_website/model/nav_item.dart';
import 'package:cop_website/widgets/custom_inkwell.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppBarView extends StatefulWidget {
  const AppBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarView> createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal:
                !screenInfo.isDesktop ? kMobilePadding : kDesktopPadding,
          ),
          height: kAppBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              LeadingLogo(),
              Spacer(),
              NavigationItems(),
            ],
          ),
        );
      },
    );
  }
}
