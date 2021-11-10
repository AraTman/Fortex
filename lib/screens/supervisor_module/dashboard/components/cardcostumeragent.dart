
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/extensions/localekeys.dart';

import 'info_card.dart';

class CardCostumerAgent extends StatelessWidget {
  const CardCostumerAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.spaceBetween,
      children: [
        InfoCard(
            border: AppColors.mtorange,
            icon: 'lib/assets/images/mevcutSiparis.png',
            label: LocaleKeys.dashboard_card1.tr(),
            amount: '\$1200'),
        InfoCard(
            border: AppColors.mtred,
            icon: 'lib/assets/images/beklemedeSiparis.png',
            label: LocaleKeys.dashboard_card2.tr(),
            amount: '\$150'),
        InfoCard(
            border: AppColors.mtgreen,
            icon: 'lib/assets/images/hazirlananSiparis.png',
            label: LocaleKeys.dashboard_card3.tr(),
            amount: '\$1500'),
      ],
    );
  }
}
