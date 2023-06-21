import 'package:flutter/material.dart';
import 'package:mobile/app/global/components/scaffold.dart';

class DwScaffoldList extends StatelessWidget {
  final String? title;
  final GlobalKey? chave;
  final Widget? body;
  final Widget? floatingActionButton;

  const DwScaffoldList({
    super.key,
    this.title,
    this.chave,
    this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return DwScaffold(
      key: chave,
      title: title,
      body: Center(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
