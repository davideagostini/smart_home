import 'package:flutter/material.dart';
import 'package:smart_home/model/temperature.dart';
import 'package:smart_home/screen/detail/detail_screen.dart';

class SpeedWidget extends StatelessWidget {
  const SpeedWidget({
    Key? key,
    @required this.temp,
    @required this.onPressed,
  }) : super(key: key);
  final Temperature? temp;
  final Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: getBackColor(temp!.value!),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width / 2 - 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Speed',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RawMaterialButton(
                onPressed: () {
                  onPressed!(1);
                },
                fillColor: temp!.speed == 1 ? Colors.white : Colors.transparent,
                elevation: 0,
                constraints:
                    const BoxConstraints(minWidth: 38.0, minHeight: 38.0),
                child: Text(
                  '1',
                  style: TextStyle(
                      color: temp!.speed == 1 ? Colors.black : Colors.white,
                      fontSize: 18),
                ),
                shape: CircleBorder(side: BorderSide(color: Colors.white)),
              ),
              RawMaterialButton(
                onPressed: () {
                  onPressed!(2);
                },
                fillColor: temp!.speed == 2 ? Colors.white : Colors.transparent,
                elevation: 0,
                constraints:
                    const BoxConstraints(minWidth: 38.0, minHeight: 38.0),
                child: Text(
                  '2',
                  style: TextStyle(
                      color: temp!.speed == 2 ? Colors.black : Colors.white,
                      fontSize: 18),
                ),
                shape: CircleBorder(side: BorderSide(color: Colors.white)),
              ),
              RawMaterialButton(
                onPressed: () {
                  onPressed!(3);
                },
                fillColor: temp!.speed == 3 ? Colors.white : Colors.transparent,
                elevation: 0,
                constraints:
                    const BoxConstraints(minWidth: 38.0, minHeight: 38.0),
                child: Text(
                  '3',
                  style: TextStyle(
                      color: temp!.speed == 3 ? Colors.black : Colors.white,
                      fontSize: 18),
                ),
                shape: CircleBorder(side: BorderSide(color: Colors.white)),
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
