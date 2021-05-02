import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/model/item.dart';
import 'package:smart_home/screen/detail/detail_screen.dart';
import 'package:smart_home/screen/home/component/item_card.dart';
import 'package:smart_home/view_model.dart';

class GridList extends StatefulWidget {
  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              switch (itemList[index].type) {
                case ItemType.light:
                  break;
                case ItemType.temperature:
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                      ),
                    );
                  }
                  break;
                case ItemType.tv:
                  break;
                case ItemType.sound:
                  break;
              }
            },
            child: Consumer<ViewModel>(builder: (_, item, __) {
              return ItemCard(
                item: item.myList[index],
                onChanged: (value) {
                  setState(() {
                    item.activateStatus(index, value);
                  });
                },
              );
            }),
          );
        });
  }
}
