import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/appbar_view/appbar_view.dart';
import 'package:cop_website/footer_view/footer_view.dart';
import 'package:cop_website/home_screen/widgets/appbar_drawer_view.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppBarViewDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              AppBarView(),
              _WelcomeVideoView(),
              FooterView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeVideoView extends StatefulWidget {
  const _WelcomeVideoView({Key? key}) : super(key: key);

  @override
  State<_WelcomeVideoView> createState() => _WelcomeVideoViewState();
}

class _WelcomeVideoViewState extends State<_WelcomeVideoView> {
  Timer? timer;

  int index = 0;
  List<String> images = [
    'assets/videos/music.gif',
    'assets/videos/praise.gif',
    'assets/videos/talking.gif'
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

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        TextStyle fontStyle = kH4;
        if (screenInfo.isMobile || screenInfo.screenSize.width < 450) {
          fontStyle = kBody;
        }

        return Stack(
          children: [
            Container(
              width: screenInfo.screenSize.width,
              height: kScreenViewHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images[index]),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'WELCOME',
                    style: fontStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    minFontSize: 16,
                  ),
                  AutoSizeText(
                    'CHURCH OF PENTECOST BELGIUM',
                    style: fontStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    minFontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
