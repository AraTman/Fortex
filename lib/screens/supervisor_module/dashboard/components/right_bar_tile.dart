import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';

class YaklasanBldrmTile extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;

  // ignore: use_key_in_widget_constructors
  const YaklasanBldrmTile(
      {required this.icon, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 0, right: 20),
          visualDensity: VisualDensity.standard,
          leading: Container(
              width: 50,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                icon,
                width: 20,
              )),
          title:
              PrimaryText(text: label, size: 14, fontWeight: FontWeight.w500),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PrimaryText(
                text: '...',
                size: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              ),
              PrimaryText(text: amount, size: 16, fontWeight: FontWeight.w600),
            ],
          ),
          onTap: () {},
          selected: true,
        ),
      ],
    );
  }
}
