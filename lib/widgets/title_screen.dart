import 'package:app_inventory/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  final List<String> text;
  const TitleScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...text.map(
          (textLine) => Text(
            textLine,
            style: AppTheme.titleScreen,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
