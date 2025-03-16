import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fonts/home_task1/theme/colors.dart';

class Input extends StatefulWidget {
  final int? maxLength;
  final TextInputFormatter? textInputFormatter;
  final String text;
  final String errorText;
  final Icon? icon;
  final IconButton? suffixIcon;
  const Input({
    super.key,
    required this.text,
    required this.errorText,
    this.icon,
    this.suffixIcon,
    this.textInputFormatter,
    this.maxLength,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength == null ? 20 : 1,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
      inputFormatters:
          widget.textInputFormatter != null ? [widget.textInputFormatter!] : [],
      //  showCursor: true,
      cursorColor: AppColors.grey2,
      controller: controller,

      obscuringCharacter: "#",
      decoration: InputDecoration(
        counterText: "",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.iconColor, width: 2.0),
        ),
        focusColor: AppColors.iconColor,
        icon: widget.icon == null ? Text("") : widget.icon,
        hintText: widget.text,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
