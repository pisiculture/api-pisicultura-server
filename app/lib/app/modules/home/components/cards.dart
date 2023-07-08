import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/global/constants/constants.dart';
import 'package:mobile/app/global/constants/responsive.dart';
import 'package:mobile/app/modules/home/components/analytic_info_card.dart';
import 'package:mobile/app/modules/home/home.controller.dart';

class AnalyticInfo {
  final String? svgSrc, title;
  final RxString value;
  final Color? color;

  AnalyticInfo({
    required this.svgSrc,
    required this.title,
    required this.value,
    required this.color,
  });
}

class AnalyticCards extends StatefulWidget {
  final HomeController controller;

  AnalyticCards({Key? key, required this.controller}) : super(key: key);

  @override
  State<AnalyticCards> createState() => _AnalyticCardsState();
}

class _AnalyticCardsState extends State<AnalyticCards> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: AnalyticInfoCardGridView(
        controller: widget.controller,
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: AnalyticInfoCardGridView(controller: widget.controller),
      desktop: AnalyticInfoCardGridView(
        childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
        controller: widget.controller,
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatefulWidget {
  HomeController controller;
  List<AnalyticInfo> analyticData = [];
  AnalyticInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
    required this.controller,
  }) : super(key: key) {
    analyticData.add(AnalyticInfo(
      title: "Temperatura",
      value: controller.temperature,
      svgSrc: "assets/icons/bar-chart.svg",
      color: primaryColor,
    ));

    analyticData.add(AnalyticInfo(
      title: "PH",
      value: controller.ph,
      svgSrc: "assets/icons/Post.svg",
      color: purple,
    ));

    analyticData.add(AnalyticInfo(
      title: "Alertas",
      value: controller.temperature,
      svgSrc: "assets/icons/info.svg",
      color: orange,
    ));

    analyticData.add(AnalyticInfo(
      title: "Pendências",
      value: controller.temperature,
      svgSrc: "assets/icons/Comments.svg",
      color: green,
    ));
  }

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<AnalyticInfoCardGridView> createState() =>
      _AnalyticInfoCardGridViewState();
}

class _AnalyticInfoCardGridViewState extends State<AnalyticInfoCardGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: appPadding,
        mainAxisSpacing: appPadding,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemBuilder: (context, index) => AnalyticInfoCard(
        info: widget.analyticData[index],
      ),
    );
  }
}
