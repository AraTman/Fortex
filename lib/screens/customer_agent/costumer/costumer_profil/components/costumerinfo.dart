import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
class CostumerInfo extends StatelessWidget {
  const CostumerInfo({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
          child: SizedBox(
            width: Responsive.isDesktop(context) ? double.infinity : SizeConfig.screenWidth,
            child: null
          ),
    );
  }
}
