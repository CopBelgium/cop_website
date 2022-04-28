import 'package:cop_website/model/nav_item.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:cop_website/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';

class AppBarViewDrawer extends StatefulWidget {
  const AppBarViewDrawer({Key? key}) : super(key: key);

  @override
  State<AppBarViewDrawer> createState() => _AppBarViewDrawerState();
}

class _AppBarViewDrawerState extends State<AppBarViewDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: showTiles(),
      ),
    );
  }

  List<Widget> showTiles() {
    return navItems.map(
      (e) {
        if (e.subMenus.isEmpty) {
          return ListTile(
            title: Text(e.title),
            onTap: () {},
          );
        }
        return Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            textColor: kBlack,
            iconColor: kBlack,
            title: Text(e.title),
            children: e.subMenus.map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: kContentSpacing24, bottom: kContentSpacing8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomInkwell(
                      child: Text(e),
                      onTap: () {},
                      onHover: (value) {},
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    ).toList();
  }
}
