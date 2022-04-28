import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/appbar_view/widgets/leading_logo.dart';
import 'package:cop_website/model/nav_item.dart';
import 'package:cop_website/widgets/custom_inkwell.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDesktopPadding),
      height: kAppBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          LeadingLogo(),
          Spacer(),
          NavigationActions(),
        ],
      ),
    );
  }
}

class NavigationActions extends StatelessWidget {
  const NavigationActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile || screenInfo.isTablet) {
          return const _MobileView();
        }

        return const _DesktopView();
      },
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      child: const Icon(Icons.menu),
      onTap: () {
        Scaffold.of(context).openEndDrawer();
      },
      onHover: (value) {},
    );
  }
}

class _DesktopView extends StatefulWidget {
  const _DesktopView({Key? key}) : super(key: key);

  @override
  State<_DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<_DesktopView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Center(
          child: CustomInkwell(
            child: AutoSizeText(
              navItems[index].title,
            ),
            onHover: (value) {},
            onTap: () {},
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: kContentSpacing12,
      ),
      itemCount: navItems.length,
    );
  }
}
