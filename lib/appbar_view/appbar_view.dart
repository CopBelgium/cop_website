import 'package:cop_website/appbar_view/widgets/leading_logo.dart';
import 'package:cop_website/appbar_view/widgets/nav_button.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    Key? key,
    required this.navText,
  }) : super(key: key);

  final List<String> navText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDesktopPadding),
      height: kAppBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LeadingLogo(),
          const Spacer(),
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Center(
                child: NavButton(
                  text: navText[index],
                  onHover: (value) {},
                  onTap: () {},
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: kContentSpacing12,
            ),
            itemCount: navText.length,
          ),
        ],
      ),
    );
  }
}
