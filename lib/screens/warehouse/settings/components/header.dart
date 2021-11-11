import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/style.dart';
class HeaderWhSettings extends StatelessWidget {
  const HeaderWhSettings({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              PrimaryText(
                  text: 'Depo Genel Ayarlar', size: 30, fontWeight: FontWeight.w800),
            ]),
      ),
     
    ]);
  }
}
