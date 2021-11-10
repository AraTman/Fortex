// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/style.dart';

class SupervisorHeader extends StatelessWidget {
  const SupervisorHeader({
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
              Wrap(
                children: const [
                  PrimaryText(
                      text: 'Dashboard', size: 30, fontWeight: FontWeight.w800),
                ],
              ),
                
            ]),
      ),
     
    ]);
  }
}
