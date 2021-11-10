// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/providers/app_bar_actions_items.dart';

class ModuleHeader extends StatelessWidget {
  const ModuleHeader({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(verticalDirection: VerticalDirection.up, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              PrimaryText(
                  text: 'Hoşgeldin Ahmet',
                  size: 30,
                  fontWeight: FontWeight.w800),
            ]),
      ),
      const SizedBox(child: AppBarActionItems()),
    ]);
  }
}
