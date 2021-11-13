import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/constants/style.dart';

class HeaderStock extends StatelessWidget {
  const HeaderStock({
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
              PrimaryText(text: 'Stok', size: 30, fontWeight: FontWeight.w800),
            ]),
      ),
      const Spacer(
        flex: 5,
      ),
      Expanded(
        flex: Responsive.isDesktop(context) ? 1 : 3,
        child: Wrap(
          runSpacing: 15,
          spacing: 15,
          children: <Widget>[],
        ),
      ),
    ]);
  }
}
