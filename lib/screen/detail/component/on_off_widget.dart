import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/model/temperature.dart';
import 'package:smart_home/screen/detail/detail_screen.dart';

class OnOffWidget extends StatefulWidget {
  const OnOffWidget({
    Key? key,
    @required this.temperature,
    @required this.onChanged,
  }) : super(key: key);
  final Temperature? temperature;
  final Function(bool)? onChanged;

  @override
  _OnOffWidgetState createState() => _OnOffWidgetState();
}

class _OnOffWidgetState extends State<OnOffWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: getBackColor(widget.temperature!.value!),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width / 2 - 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Power',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'OFF',
                    style: TextStyle(
                        fontSize: 16,
                        color: !widget.temperature!.active!
                            ? Colors.white
                            : Colors.white.withOpacity(0.3)),
                  ),
                  Text('/',
                      style: TextStyle(
                          fontSize: 16, color: Colors.white.withOpacity(0.3))),
                  Text('ON',
                      style: TextStyle(
                          fontSize: 16,
                          color: widget.temperature!.active!
                              ? Colors.white
                              : Colors.white.withOpacity(0.3))),
                ],
              ),
              CupertinoSwitch(
                activeColor: widget.temperature!.active!
                    ? Colors.white54
                    : Colors.white.withOpacity(0.2),
                trackColor: widget.temperature!.active!
                    ? Colors.white54
                    : Colors.white.withOpacity(0.1),
                value: widget.temperature!.active!,
                onChanged: (value) {
                  setState(() {
                    widget.onChanged!(value);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Color? getBackColor(double value) {
    int newValue = value.toInt();
    Color? newColor;
    if (newValue >= 16 && newValue < 19) {
      newColor = colorGreen;
    } else if (newValue >= 19 && newValue < 22) {
      newColor = colorTeal;
    } else if (newValue >= 22 && newValue < 25) {
      newColor = colorBlue;
    } else if (newValue >= 25 && newValue < 28) {
      newColor = colorViolet;
    } else if (newValue >= 28) {
      newColor = colorRed;
    }

    return newColor!.withOpacity(0.7);
  }
}
