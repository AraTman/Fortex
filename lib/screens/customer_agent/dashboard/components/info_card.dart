import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';

class InfoCard extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;
  final Color border;

  // ignore: prefer_const_constructors_in_immutables
  InfoCard(
      {Key? key,
      required this.border,
      required this.icon,
      required this.label,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minWidth: Responsive.isDesktop(context)
              ? 200
              : SizeConfig.screenWidth! / 2 - 40),
      padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: Responsive.isMobile(context) ? 20 : 40),
      decoration: BoxDecoration(
        border: Border.all(color: border, width: 3),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Wrap(
        children: [
          Image.asset(icon, width: 55),
          SizedBox(width: SizeConfig.blockSizeHorizontal!*2,),
          Column(
            children: [
               SizedBox(
                height: SizeConfig.blockSizeVertical!*2,
              ),
              PrimaryText(text: label, color: AppColors.black, size: 18),
             
             
            ],
          ),
        ],
      ),
    );
  }
}
