import 'package:flutter/material.dart';

import 'formularioFormField.dart';

class FormularioFormFieldState extends State<FormularioFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixIconColor: Colors.green,
        helperText: _isFocused ? null : widget.helperText,
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }
}
