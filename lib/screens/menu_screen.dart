import 'package:app_inventory/services/internal/session_service.dart';
import 'package:app_inventory/widgets/options_menu.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nameUser = SessionService().getInfoUser("name");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              '!Hola $nameUser!',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const OptionsMenu()
        ],
      ),
    );
  }
}
