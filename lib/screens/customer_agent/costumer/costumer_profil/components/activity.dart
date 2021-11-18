import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/providers/models/data.dart';
import 'package:fortextm/screens/customer_agent/dashboard/components/right_bar_tile.dart';

class CostumerAktiviteler extends StatelessWidget {
  const CostumerAktiviteler({
   final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
     /* Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 15.0,
            offset: const Offset(
              10.0,
              15.0,
            ),
          )
        ]),
        child: Image.asset('assets/card.png'),
      ),*/
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const PrimaryText(
              text: 'Aktif Siparişler', size: 18, fontWeight: FontWeight.w800),
          const PrimaryText(
            text: '02 Mar 2021',
            size: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.secondary,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      Column(
        children: List.generate(
          recentActivities.length,
          (index) => YaklasanBldrmTile(
              icon: recentActivities[index]["icon"]!,
              label: recentActivities[index]["label"]!,
              amount: recentActivities[index]["amount"]!),
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      
      
    ]);
  }
}
