import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/components/icon.button.dart';
import 'package:mobile/app/global/components/text.dart';

class DwListTileConfirmm extends StatelessWidget {
  final String? title;
  final String? leading;
  final String? subtitle;
  final Function? onDelete;
  final bool? visualizado;

  const DwListTileConfirmm({
    super.key,
    this.title,
    this.leading,
    this.subtitle,
    this.onDelete,
    this.visualizado,
  });

  @override
  Widget build(BuildContext context) {
    updateList() {
      Navigator.of(context).pop();
      Get.reload();
    }

    selected() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            clipBehavior: Clip.none,
            title: const Text("Detalhes"),
            content:
                Text('Confirmar a exclusão do registro "${title.toString()}"'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton.icon(
                    onPressed: updateList(),
                    icon: const Icon(Icons.coronavirus_rounded),
                    label: const DwText(lbl: 'Confirmar'),
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeData().cardTheme.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          title: Text(
            title!,
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            subtitle!,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: DwIconButton(
            icon: Icons.contact_support_outlined,
            sizeIcon: 25,
            corIcon: ThemeData().bottomAppBarColor,
            onPressed: () => selected(),
          ),
        ),
      ),
    );
  }
}
