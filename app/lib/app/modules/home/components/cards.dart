import 'package:flutter/material.dart';
import 'package:mobile/app/global/constants/constants.dart';
import 'package:mobile/app/global/constants/responsive.dart';
import 'package:mobile/app/modules/home/components/analytic_info_card.dart';

class AnalyticInfo {
  final String? svgSrc, title;
  final double? count;
  final Color? color;

  AnalyticInfo({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
  });
}

List analyticData = [
  AnalyticInfo(
    title: "Temperatura",
    count: 720,
    svgSrc: "assets/icons/bar-chart.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "PH",
    count: 6.7,
    svgSrc: "assets/icons/Post.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "Alertas",
    count: 2,
    svgSrc: "assets/icons/info.svg",
    color: orange,
  ),
  AnalyticInfo(
    title: "Pendências",
    count: 3,
    svgSrc: "assets/icons/Comments.svg",
    color: green,
  ),
];

class AnalyticCards extends StatefulWidget {
  const AnalyticCards({Key? key}) : super(key: key);

  @override
  State<AnalyticCards> createState() => _AnalyticCardsState();
}

class _AnalyticCardsState extends State<AnalyticCards> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: AnalyticInfoCardGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: const AnalyticInfoCardGridView(),
      desktop: AnalyticInfoCardGridView(
        childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatelessWidget {
  const AnalyticInfoCardGridView(
      {Key? key, this.crossAxisCount = 4, this.childAspectRatio = 1.4})
      : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: analyticData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: appPadding,
        mainAxisSpacing: appPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => AnalyticInfoCard(
        info: analyticData[index],
      ),
    );
  }
}
