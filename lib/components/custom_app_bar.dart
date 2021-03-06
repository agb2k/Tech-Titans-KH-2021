import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final String? title;
  final bool showLeading;
  const CustomAppBar(
      {Key? key,
      this.leading,
      this.actions,
      this.title,
      this.showLeading = true})
      : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 45,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,

      leading: showLeading
          ? leading ??
              IconButton(
                iconSize: 30,
                splashRadius: 25,
                padding: const EdgeInsets.all(10),
                splashColor: Colors.white.withOpacity(0.3),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColorDark,
                ),
              )
          : null,
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            )
          : null,
      actions: actions,
    );
  }
}
