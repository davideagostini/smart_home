import 'package:flutter/material.dart';

class ButtonTemperatureType extends StatelessWidget {
  const ButtonTemperatureType({
    Key? key,
    @required this.iconData,
    @required this.status,
  }) : super(key: key);
  final IconData? iconData;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: status! ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.5),
      ),
      child: Icon(
        iconData,
        size: 35.0,
        color: status! ? Colors.black : Colors.grey[500]!.withAlpha(150),
      ),
    );
  }
}
