import 'package:cop_website/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cop Belgium',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const Test(),
    );
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _menuKey = GlobalKey<PopupMenuButtonState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          child: CustomInkwell(
            child: PopupMenuButton<WhyFarther>(
              elevation: 3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              key: _menuKey,
              child: const Text('hey'),
              offset: const Offset(0, 44),
              onSelected: (WhyFarther result) {},
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<WhyFarther>>[
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.harder,
                  child: Text('Working a lot harder'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.smarter,
                  child: Text('Being a lot smarter'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.selfStarter,
                  child: Text('Being a self-starter'),
                ),
                const PopupMenuItem<WhyFarther>(
                  value: WhyFarther.tradingCharter,
                  child: Text('Placed in charge of trading charter'),
                ),
              ],
            ),
            onTap: () async {},
            onHover: null,
          ),
          onEnter: (details) {
            debugPrint('onEnter');
            final state = _menuKey.currentState;
            state?.showButtonMenu();
          },
          onExit: (details) {
            debugPrint('onExit');
          },
          onHover: null,
        ),
      ),
    );
  }
}
