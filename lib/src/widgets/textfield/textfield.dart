import 'package:flutter/material.dart';

//---------------------- This is custom textformfield -----------------------------//
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.color,
      this.hintText,
      this.keyboardType,
      this.maxlines,
      this.validator,
      this.controller,
      this.obscuretext = false,
      this.formKey,
      this.onChanged,
      this.sufixicon})
      : super(
          key: key,
        );

  final Color? color;
  final String? hintText;
  final dynamic keyboardType;
  final int? maxlines;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool obscuretext;
  final Widget? sufixicon;
  final Key? formKey;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      shadowColor: Colors.grey,
      child: TextFormField(
        key: formKey,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          suffixIcon: sufixicon,
          fillColor: Colors.white,
          filled: true,
        ),
        obscureText: obscuretext,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
