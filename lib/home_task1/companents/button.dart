import 'package:flutter/material.dart';
///custom button
class AppButton extends StatefulWidget {
  final ShapeBorder shape;
  final Color color;
  final Color colorText;
  final String msg;
  final double height;
  const AppButton({
    super.key,
    required this.shape,
    required this.color,
    required this.msg,
    required this.height,
    required this.colorText,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: widget.width,
      height: widget.height,
      child: MaterialButton(
        onPressed: () {},
        shape: widget.shape,
        color: widget.color,
        child: Center(
          child: Text(widget.msg, style: TextStyle(color: widget.colorText)),
        ),
      ),
    );
  }
}
