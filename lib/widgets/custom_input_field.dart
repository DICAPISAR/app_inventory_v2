import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? validation;
  final int? lengthValidation;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool? readOnly;
  final String? initialValue;
  final bool? autoFocus;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.validation = false,
    this.readOnly,
    this.initialValue,
    this.autoFocus,
    required this.formProperty,
    required this.formValues,
    this.lengthValidation = 3,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      autofocus: widget.autoFocus ?? false,
      initialValue: widget.initialValue ?? '',
      obscureText: widget.obscureText,
      readOnly: widget.readOnly ?? false,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) {
        widget.formValues[widget.formProperty] = value;
      },
      validator: (value) {
        if (value == null) {
          return widget.validation == true ? 'Este campo es requerido' : null;
        }
        var messageValidation = 'Mínimo ${widget.lengthValidation} letras';
        return value.length < widget.lengthValidation! &&
                widget.validation == true
            ? messageValidation
            : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: widget.suffixIcon == null ? null : Icon(widget.suffixIcon),
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        icon: widget.icon == null ? null : Icon(widget.icon),
      ),
    );
  }
}
