

  import 'package:covid_19_dashboard/utils/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0,
      leading:IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: (){
          print("menu");
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          color: Colors.white,
          onPressed: (){
            print("menu");
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}