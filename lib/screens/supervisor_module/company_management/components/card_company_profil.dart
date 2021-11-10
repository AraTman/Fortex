// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/customer_agent/dashboard/components/info_card.dart';
import 'package:fortextm/screens/supervisor_module/company_management/screens/card_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class CompanyPCard extends StatelessWidget {
  const CompanyPCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
          onPressed: () => showCupertinoModalBottomSheet(
              isDismissible: false,
              context: context,
              builder: (context) => const CardPageList(deger: 1,)),
          child: InfoCard(
              border: AppColors.mtorange,
              icon: 'lib/assets/images/mevcutSiparis.png',
              label: 'Mevcut Siparişler',
              amount: ''),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.transparent,),
          onPressed: () => showCupertinoModalBottomSheet(
              isDismissible: false,
              context: context,
              builder: (context) => const CardPageList(deger: 2,)),
          child: InfoCard(
              border: AppColors.mtred,
              icon: 'lib/assets/images/beklemedeSiparis.png',
              label: 'Beklemedeki Siparişler',
              amount: ''),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
          onPressed: () => showCupertinoModalBottomSheet(
              isDismissible: false,
              context: context,
              builder: (context) => const CardPageList(deger: 3,)),
          child: InfoCard(
              border: AppColors.mtgreen,
              icon: 'lib/assets/images/hazirlananSiparis.png',
              label: 'Geçmiş Siparişler',
              amount: ''),
        ),
      ],
    );
  }
}
