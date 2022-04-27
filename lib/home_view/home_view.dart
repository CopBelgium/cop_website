import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/appbar_view/appbar_view.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Timer? timer;

  int index = 0;
  List<String> images = [
    'assets/videos/music.gif',
    'assets/videos/praise.gif',
    'assets/videos/talking.gif'
  ];
  List<String> navText = [
    'Home',
    'Districts',
    'Ministries',
    'About us',
    'Contact us',
  ];

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < images.length - 1) {
        index++;
      } else {
        index = 0;
      }
      setState(() {});
    });

    setState(() {});

    super.initState();
  }

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

  List<String> phoneNumbers = [
    '+32 484404354',
    '+32 487535881',
    '+32 488144869',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AppBarView(navText: navText),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: kScreenViewHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(images[index]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'WELCOME',
                          style: kH4.copyWith(color: Colors.white),
                        ),
                        AutoSizeText(
                          'CHURCH OF PENTECOST BELGIUM',
                          style: kH4.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDesktopPadding),
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
                          Text('Koning Abertlaan 195', style: kBody),
                          Text(
                            '1082 Sint Agartha Berchem, Belgium',
                            style: kBody,
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
                          child: Text('info@copbelgium.com', style: kBody),
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
                                child: Text(e, style: kBody),
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
                      children: [
                        FooterIconButton(
                          icon: const Icon(FontAwesomeIcons.facebook),
                          onPressed: openFacebookLink,
                        ),
                        FooterIconButton(
                          icon: const Icon(FontAwesomeIcons.instagram),
                          onPressed: openInstaLink,
                        ),
                        FooterIconButton(
                          icon: const Icon(FontAwesomeIcons.youtube),
                          onPressed: openYoutubeLink,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
