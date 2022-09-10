import 'package:app_inventory/services/dto/request/login_request.dart';
import 'package:app_inventory/services/internal/session_service.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: const [
                TitleScreen(text: ['Bienvenid@ a', 'App Inventory']),
                SizedBox(
                  height: 20,
                ),
                ImageScreen(
                  pathImage: 'assets/images/logo.png',
                  percentageWidth: 0.6,
                ),
                SizedBox(
                  height: 30,
                ),
                _LoginForm(),
                SizedBox(
                  height: 30,
                ),
                _TextForgotPassword()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'userName': '',
      'password': '',
    };

    return Form(
      key: myFormKey,
      child: Column(
        children: [
          CustomInputField(
            labelText: 'Nombre de Usuario',
            hintText: 'Nombre de Usuario',
            keyboardType: TextInputType.text,
            prefixIcon: Icons.account_circle_outlined,
            formProperty: 'userName',
            formValues: formValues,
            validation: true,
            lengthValidation: 5,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomInputField(
            labelText: 'Contraseña',
            hintText: 'Contraseña',
            keyboardType: TextInputType.text,
            prefixIcon: Icons.password_outlined,
            formProperty: 'password',
            formValues: formValues,
            validation: true,
            obscureText: true,
            lengthValidation: 8,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            child: const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'Ingresar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            onPressed: () async {
              if (!myFormKey.currentState!.validate()) {
                return;
              }

              LoginRequest loginData = LoginRequest(
                  formValues['userName']!, formValues['password']!);

              bool isLoguin = await SessionService().login(loginData);

              if (!isLoguin) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Error en ingreso'),
                    content: const Text(
                      'Usuario y/o contraseña incorrectos',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, 'login', (route) => false),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                return;
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'home',
                  (route) => false,
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class _TextForgotPassword extends StatelessWidget {
  const _TextForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text(
        'Olvide mi contraseña',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppTheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'forgotPassword');
      },
    );
  }
}
