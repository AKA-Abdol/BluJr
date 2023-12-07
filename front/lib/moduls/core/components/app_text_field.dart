// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.textController,
    this.maxLines,
    this.hintText,
    required this.labelText,
    this.inputType,
    this.align,
    this.suffix,
    this.prefix,
    this.enable = true,
    this.onChange,
    this.inputFormatters,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? textController;
  final String labelText;
  final String? hintText;
  final bool enable;
  final TextInputType? inputType;
  final TextAlign? align;
  final Widget? suffix;
  final Widget? prefix;
  int? maxLines;
  final void Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        maxLines: maxLines ?? 1,
        textAlign: align ?? TextAlign.right,
        cursorColor: Colors.black,
        inputFormatters: inputFormatters,
        keyboardType: inputType,
        controller: textController,
        enabled: enable,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFFCDCDCD),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFFCDCDCD),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Color(0xFFCDCDCD),
              ),
            ),
            fillColor: Colors.white,
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            suffix: suffix,
            prefix: prefix,
            hintText: hintText),
        onChanged: onChange,
        onTap: onTap,
      ),
    );
  }
}
