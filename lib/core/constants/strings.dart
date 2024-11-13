import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final validateEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
String domainUrl = ".gleamhrm.com/api/v1/hiring/verify-domain";
String domainName = "";
DateFormat formatter = DateFormat('dd-MM-yyyy');

class DrawerData {
  String? title, imagepath;
  var onTap;
  Widget trailing;
  DrawerData({
    required this.title,
    this.trailing = const SizedBox(),
    required this.imagepath,
    required this.onTap,
  });
}

List<DrawerData> drawerDataList = [
  // DrawerData(title: "Openings", imagepath: Iconss.openingicon, onTap: () {}),
  // DrawerData(
  //     title: "Applicants", imagepath: Iconss.applicantsicon, onTap: () {}),
  // DrawerData(title: "Search", imagepath: Iconss.searchicon, onTap: () {}),
  // DrawerData(title: "Dark Mode", imagepath: Iconss.darkmodeicon, onTap: () {},trailing: SizedBox(
  //   height: 30,
  //   width: 30,
  //   child: Transform.scale(
  //           scale: .6,
  //           child: Switch(
  //             onChanged: (val){},
  //             value: false,
  //             activeColor: Colors.white,
  //             activeTrackColor: Colors.black,
  //             inactiveThumbColor: Colors.black,
  //             inactiveTrackColor: Colors.white,
  //           )
  //         ),
  // )),
  // DrawerData(title: "Language", imagepath: Iconss.languageicon, onTap: () {}),
  // DrawerData(title: "Settings", imagepath: Iconss.settingsicon, onTap: () {}),
];
