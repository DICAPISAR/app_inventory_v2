
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'item_list.dart';

class ListItem extends StatelessWidget {
  final List<ItemDetail> itemDetail;
  final String screenNameRoute;
  const ListItem({
    Key? key,
    required this.itemDetail,
    required this.screenNameRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool? isFormView =
        ModalRoute.of(context)?.settings.name!.contains("form");

    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: isFormView != null
          ? isFormView == true
              ? height * 0.56
              : height * 0.8
          : height,
      width: width * 0.9,
      child: ListView.builder(
        itemCount: itemDetail.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, int index) => ItemList(
          id: itemDetail[index].id,
          title: itemDetail[index].title,
          subTitle: itemDetail[index].subTitle,
          details: [
            itemDetail[index].details.elementAt(0),
            itemDetail[index].details.elementAt(1),
            itemDetail[index].details.elementAt(2),
          ],
          advise: itemDetail[index].advise,
          screenNameRoute: screenNameRoute,
        ),
      ),
    );
  }
}
