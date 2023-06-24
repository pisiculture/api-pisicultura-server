import 'package:flutter/material.dart';

class DTextButton extends TextButton {
  const DTextButton({
    super.key,
    required super.onPressed,
    required super.child,
  }){
    this.style = const ButtonStyle(
      backgroundColor: Colors.green
    );
  }


}
