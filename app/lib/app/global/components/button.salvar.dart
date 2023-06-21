import 'package:flutter/material.dart';
import 'package:mobile/app/global/components/button.dart';

class DwButtonSalvar extends StatelessWidget {
  final Function? funOnTap;

  const DwButtonSalvar({super.key, this.funOnTap});

  @override
  Widget build(BuildContext context) {
    return DwButton(
      funOnTap: funOnTap,
      cor: Colors.green,
      label: "Salvar",
      icon: Icons.save_alt_rounded,
    );
  }
}
