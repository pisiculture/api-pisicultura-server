import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/app/global/singleton/system.dart';
import 'package:mobile/responsive.dart';

class MenuModel {
  String icon;
  String title;
  MenuModel({required this.icon, required this.title});
}

class DDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DDrawer({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<DDrawer> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/icons/home.svg', title: "Inicio"),
    MenuModel(icon: 'assets/icons/profile.svg', title: "Perfil"),
    MenuModel(icon: 'assets/icons/setting.svg', title: "Configurações"),
    MenuModel(icon: 'assets/icons/history.svg', title: "Agendamentos"),
    MenuModel(icon: 'assets/icons/signout.svg', title: "Sair"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color(0xFF171821),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: SizedBox(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture:
                    const Icon(Icons.account_circle, size: 80),
                accountName: Text(
                  System.getInstance().getUser().getName(),
                  style: const TextStyle(fontSize: 17),
                ),
                accountEmail: Text(
                  System.getInstance().getUser().getEmail(),
                  style: const TextStyle(fontSize: 14),
                ),
                decoration: BoxDecoration(
                  color: ThemeData().drawerTheme.backgroundColor,
                ),
              ),
              SizedBox(
                height: Responsive.isMobile(context) ? 40 : 80,
              ),
              for (var i = 0; i < menu.length; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: selected == i
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = i;
                      });
                      widget.scaffoldKey.currentState!.closeDrawer();
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 7),
                          child: SvgPicture.asset(
                            menu[i].icon,
                            color: selected == i ? Colors.black : Colors.grey,
                          ),
                        ),
                        Text(
                          menu[i].title,
                          style: TextStyle(
                              fontSize: 16,
                              color: selected == i ? Colors.black : Colors.grey,
                              fontWeight: selected == i
                                  ? FontWeight.w600
                                  : FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
