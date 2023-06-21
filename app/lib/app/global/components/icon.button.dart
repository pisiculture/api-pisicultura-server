import 'package:flutter/material.dart';

class DwIconButton extends StatelessWidget {
  final IconData? icon;
  final Function? onPressed;
  final Color? corIcon;
  final double? sizeIcon;
  final Color? corBorda;

  const DwIconButton({
    super.key,
    this.icon,
    this.onPressed,
    this.corIcon,
    this.sizeIcon,
    this.corBorda,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: corIcon,
        size: sizeIcon,
      ),
      splashColor: corBorda,
      onPressed: () => onPressed,
    );
  }
}
