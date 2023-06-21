import 'package:flutter/material.dart';

class DwText extends StatelessWidget {
  final String? lbl;
  final double? fontSize;
  final Color? cor;
  final FontStyle? fontStyle;

  const DwText({super.key, this.lbl, this.fontSize, this.cor, this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: Text(
          lbl!,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: cor,
            fontStyle: fontStyle,
          ),
        ),
      ),
    );
  }
}
