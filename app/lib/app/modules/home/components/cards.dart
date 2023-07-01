import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/responsive.dart';

class HealthModel {
  final String icon;
  final String value;
  final String title;
  const HealthModel(
      {required this.icon, required this.value, required this.title});
}

class DCards extends StatefulWidget {
  const DCards({super.key});

  @override
  State<DCards> createState() => _DCardsState();
}

class _DCardsState extends State<DCards> {
  final List<HealthModel> healthDetails = const [
    HealthModel(
        icon: 'assets/icons/burn.svg', value: "32.5", title: "Temperatura C"),
    HealthModel(icon: 'assets/icons/steps.svg', value: "7.23", title: "PH"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(healthDetails[i].icon),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 4),
              child: Text(
                healthDetails[i].value,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              healthDetails[i].title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        );
      },
    );
  }
}
