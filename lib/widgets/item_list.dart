import 'package:flutter/material.dart';

import '../models/models.dart';

class ItemList extends StatelessWidget {
  final int id;
  final String title;
  final String subTitle;
  final List<String>? details;
  final AdviseItemLIst? advise;
  final String screenNameRoute;

  const ItemList({
    Key? key,
    required this.id,
    required this.title,
    required this.subTitle,
    required this.screenNameRoute,
    this.details,
    this.advise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return InkWell(
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      _Advised(
                        adviseItemLIst: advise,
                      )
                    ],
                  )
                ],
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: (width - 100) / 3,
                  child: Text(
                    details![0],
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: (width - 100) / 3,
                  child: Text(
                    details![1],
                    style: const TextStyle(
                        fontSize: 15, overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                  width: (width - 100) / 3,
                  child: Text(
                    details![2],
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () => {
        Navigator.pushNamed(
          context,
          screenNameRoute,
          arguments: FormScreenArguments(
            title: title,
            isRead: true,
            resourceId: id,
          ),
        )
      },
    );
  }
}

class _Advised extends StatelessWidget {
  final AdviseItemLIst? adviseItemLIst;

  const _Advised({
    Key? key,
    this.adviseItemLIst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget advise = adviseItemLIst != null
        ? Container(
            margin: const EdgeInsets.only(left: 5),
            height: 20,
            decoration: BoxDecoration(
                color: adviseItemLIst!.color,
                borderRadius: BorderRadius.circular(10)),
            child: Align(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  adviseItemLIst!.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Container();

    return advise;

    /*Container(
      margin: const EdgeInsets.only(left: 5),
      height: 20,
      decoration: BoxDecoration(
          color: Colors.green[400], borderRadius: BorderRadius.circular(10)),
      child: Align(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: const Text(
            'Aviso',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    */
  }
}