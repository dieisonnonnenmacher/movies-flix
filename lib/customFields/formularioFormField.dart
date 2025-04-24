import 'package:flutter/material.dart';
import 'package:movies_flix/customFields/FormularioFormFieldState.dart';

class FormularioFormField extends StatefulWidget {
  final String labelText;
  final String? helperText;
  final TextEditingController controller;
  final Widget? prefixIcon;

  const FormularioFormField({
    super.key,
    required this.labelText,
    this.helperText,
    required this.controller,
    this.prefixIcon,
  });

  @override
  State<FormularioFormField> createState() => FormularioFormFieldState();
}
