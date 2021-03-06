import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tech_titans/components/custom_app_bar.dart';
import 'package:tech_titans/providers/theme_provider.dart';

class AccountPage extends StatelessWidget {
  static const route = "/account-page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Account",
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            SwitchItem(
              value: Provider.of<ThemeProvider>(context, listen: false)
                  .isDarkTheme // change provider value
              ,
              title: "dark mode",
              onchange: (bool val) {
                Provider.of<ThemeProvider>(context,
                        listen: false) // change provider value
                    .setDarkMode(val);
              },
            ),
            Divider(),
            SwitchItem(
              value: true,
              disabled: true,
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper({required this.sizeRate, required this.offset});
  final double sizeRate;
  final Offset offset;

  @override
  Path getClip(Size size) {
    var path = Path()
      ..addOval(
        Rect.fromCircle(center: offset, radius: size.height * sizeRate),
      );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class SwitchItem extends StatelessWidget {
  void Function(bool)? onchange;
  bool disabled;
  bool value;
  final String title;
  SwitchItem(
      {Key? key,
      required this.value,
      this.disabled = false,
      this.title = "NaN",
      this.onchange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !disabled
        ? buildSwitch(context)
        : IgnorePointer(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).accentColor.withOpacity(0.2),
                  BlendMode.xor),
              child: buildSwitch(context),
            ),
          );
  }

  Widget buildSwitch(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 8), child: Text(title))),
            SizedBox(
              width: 10,
            ),
            CupertinoSwitch(
              value: this.value,
              onChanged: this.onchange ?? (bool val) {},
              activeColor: Theme.of(context).canvasColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPickerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text("Theme Color"))),
            SizedBox(
              width: 10,
            ),
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
