import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> phoneNumbers = [
  '+32 484404354',
  '+32 487535881',
  '+32 488144869',
];

Future<void> openFacebookLink() async {
  await launchUrl(Uri.parse(
      'https://www.facebook.com/Church-of-Pentecost-Belgium-106370728720719'));
}

Future<void> openInstaLink() async {
  launchUrl(Uri.parse('https://www.instagram.com/copbelgium'));
}

Future<void> openYoutubeLink() async {
  launchUrl(Uri.parse(
      'https://www.youtube.com/channel/UC7fQxWqyHcxOHbe5o8w5ToA?sub_confirmation=1'));
}

Future<void> openMailLink() async {
  launchUrl(Uri.parse('mailto:info@copbelgium.com'));
}

Future<void> openPhoneLink({required String phoneNumber}) async {
  launchUrl(Uri.parse('tel:$phoneNumber'));
}

Future<void> openAddressLink() async {
  launchUrl(Uri.parse('https://rb.gy/p6icar'));
}

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

class FooterView extends StatefulWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile) {
          return const Text('Mobile');
        }
        return const DesktopView();
      },
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDesktopPadding),
      height: kAppBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Koning Abertlaan 195', style: kBody2),
                Text(
                  '1082 Sint Agartha Berchem, Belgium',
                  style: kBody2,
                ),
              ],
            ),
            onTap: openAddressLink,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: Text('info@copbelgium.com', style: kBody2),
                onTap: openMailLink,
              ),
              const SizedBox(height: kContentSpacing4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: phoneNumbers.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Text(e, style: kBody2),
                      onTap: () => openPhoneLink(phoneNumber: e),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FooterIconButton(
                icon: Icon(FontAwesomeIcons.facebook),
                onPressed: openFacebookLink,
              ),
              FooterIconButton(
                icon: Icon(FontAwesomeIcons.instagram),
                onPressed: openInstaLink,
              ),
              FooterIconButton(
                icon: Icon(FontAwesomeIcons.youtube),
                onPressed: openYoutubeLink,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
