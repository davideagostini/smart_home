import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    @required this.item,
    @required this.onChanged,
  }) : super(key: key);
  final Item? item;
  final Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(20),
          color: item!.active! ? item!.color : Colors.transparent,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                item!.active! ? item!.iconOn : item!.iconOff,
                size: 45.0,
                color: item!.active! ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 80,
                child: Text(
                  item!.name!,
                  maxLines: 2,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 18.0,
                    color: item!.active! ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: CupertinoSwitch(
                  activeColor: item!.active! ? Colors.white54 : Colors.black,
                  trackColor: item!.active! ? Colors.white54 : Colors.black,
                  value: item!.active!,
                  onChanged: (value) => onChanged!(value),
                ),
              )
            ],
          ),
        ));
  }
}
