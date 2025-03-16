import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatefulWidget {

  final Icon icon;
  final Color color;

  const AppIconButton({super.key, required this.icon, required this.color});

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: widget.icon, color: widget.color);
  }
}
