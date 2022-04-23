import 'package:flutter/material.dart';

class AppBarAtom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAtom({Key? key, required this.title,this.leading}) : super(key: key);
  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title:  Text(title),
      centerTitle: true,
      leading:leading,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}