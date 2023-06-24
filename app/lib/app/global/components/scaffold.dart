import 'package:flutter/material.dart';
import 'package:mobile/app/global/components/text.dart';

class DwScaffold extends StatelessWidget {
  final String? title;
  final GlobalKey? chave;
  final Widget? body;
  final Widget? floatingActionButton;

  const DwScaffold({
    super.key,
    this.title,
    this.chave,
    this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().appBarTheme.backgroundColor,
        title: DwText(lbl: (title ?? '') + '        '),
        key: chave,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
