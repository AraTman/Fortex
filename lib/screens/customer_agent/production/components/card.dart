
// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/customer_agent/dashboard/components/info_card.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../finishedorders.dart';


class CostumerProductionCard extends StatelessWidget {
  const CostumerProductionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.spaceBetween,
      children: [
       ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                     onPressed: () => showCupertinoModalBottomSheet(
            expand: true,
            isDismissible: true,
            context: context,
            builder: (context) => const ProductFinishedOrders(),
          ),
                    child: InfoCard(
                        border: AppColors.black,
                        icon: 'lib/assets/images/beklemedeSiparis.png',
                        label: 'Üretilen Siparişler',
                        amount: ''),
                  ),
                  
        InfoCard(
            border: AppColors.mtred,
            icon: 'lib/assets/images/beklemedeSiparis.png',
            label: 'Bekleyen Siparişler',
            amount: ''),
        InfoCard(
            border: AppColors.mtgreen,
            icon: 'lib/assets/images/hazirlananSiparis.png',
            label: 'Üretimdeki Siparişler',
            amount: ''),
             InfoCard(
            border: AppColors.black,
            icon: 'lib/assets/images/hazirlananSiparis.png',
            label: 'İptal Edilen Siparişler',
            amount: ''),
      ],
    );
  }
}
