import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/models/data.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
          child: SizedBox(
            width: Responsive.isDesktop(context) ? double.infinity : SizeConfig.screenWidth,
            child: Table(
        defaultVerticalAlignment:
              TableCellVerticalAlignment.middle,
        children: List.generate(
            transactionHistory.length,
            (index) => TableRow(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundImage: NetworkImage(transactionHistory[index]["avatar"].toString()),
                  ),
                ),
                PrimaryText(
                  text: transactionHistory[index]["MusteriBilgi"].toString(),
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]["UrunBilgi"].toString(),
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]["BaslangicTarihi"].toString(),
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]["status"].toString(),
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
              ],
            ),
        ),
      ),
          ),
    );
  }
}
