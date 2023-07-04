import 'package:flutter/material.dart';
import 'package:mobile/app/global/constants/responsive.dart';
import 'package:mobile/app/modules/home/components/drawer.dart';

class DScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DScaffold({super.key, required this.body, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: DDrawer(scaffoldKey: scaffoldKey))
          : DDrawer(scaffoldKey: scaffoldKey),
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: 300,
              child: SizedBox(
                  width: 250, child: DDrawer(scaffoldKey: scaffoldKey)))
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              SizedBox(
                width: 300,
                height: MediaQuery.of(context).size.height,
                child: DDrawer(scaffoldKey: scaffoldKey),
              ),
            Expanded(
              flex: 8,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? 15 : 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Responsive.isMobile(context) ? 5 : 18,
                        ),
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (!Responsive.isDesktop(context))
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () =>
                                        scaffoldKey.currentState!.openDrawer(),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.grey,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        body
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
