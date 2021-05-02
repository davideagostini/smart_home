import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smart_home/model/temperature.dart';

class Item {
  Item({
    @required this.name,
    @required this.iconOn,
    @required this.iconOff,
    @required this.active,
    @required this.color,
    @required this.type,
  });

   String? name;
   IconData? iconOn;
   IconData? iconOff;
   bool? active;
   Color? color;
   ItemType? type;
}

enum ItemType { light, temperature, tv, sound }

 List<dynamic> itemList = [
  Item(
    name: 'Smart Light',
    iconOn: MdiIcons.lightbulbOnOutline,
    iconOff: MdiIcons.lightbulbOffOutline,
    active: false,
    color: Color(0xFFFD443C),
    type: ItemType.light,
  ),
  Temperature(
    name: 'Smart AC',
    iconOn: MdiIcons.airConditioner,
    iconOff: MdiIcons.airConditioner,
    active: false,
    color: Color(0xFF5D24FB),
    type: ItemType.temperature,
  ),
  Item(
    name: 'Smart TV',
    iconOn: Icons.tv_outlined,
    iconOff: Icons.tv_off_outlined,
    active: false,
    color: Color(0xFF00c853),
    type: ItemType.tv,
  ),
  Item(
    name: 'Smart Sound',
    iconOn: MdiIcons.musicNoteOutline,
    iconOff: MdiIcons.musicNoteOffOutline,
    active: false,
    color: Color(0xFFffab00),
    type: ItemType.sound,
  ),
];
