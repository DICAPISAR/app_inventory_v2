import 'package:app_inventory/models/models.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class OptionHomeMenu extends StatelessWidget {
  final String pathImage;
  final String title;
  final String singularName;
  final String nameNextScreen;

  const OptionHomeMenu({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.singularName,
    required this.nameNextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: AppTheme.optionMenuDecoration,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image(
              image: AssetImage(pathImage),
              fit: BoxFit.contain,
              width: 110,
            ),
            const SizedBox(height: 5),
            Text(title, style: AppTheme.titleOptionHomeMenu)
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, nameNextScreen,
            arguments: ListScreenArguments(title, singularName));
      },
    );
  }
}