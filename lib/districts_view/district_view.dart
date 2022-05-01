import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/appbar_view/appbar_view.dart';
import 'package:cop_website/footer_view/footer_view.dart';
import 'package:cop_website/home_screen/widgets/appbar_drawer_view.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DistrictView extends StatefulWidget {
  const DistrictView({Key? key}) : super(key: key);

  @override
  State<DistrictView> createState() => _DistrictViewState();
}

class _DistrictViewState extends State<DistrictView> {
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
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        return SizedBox(
          width: screenInfo.screenSize.width,
          height: kScreenViewHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'WELCOME',
                style: kH4.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
                minFontSize: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
