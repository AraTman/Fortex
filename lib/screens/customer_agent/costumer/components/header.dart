import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'costumer_insert.dart';

class HeaderCostumer extends StatelessWidget {
  const HeaderCostumer({
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
                  text: 'Müşteriler', size: 30, fontWeight: FontWeight.w800),
            ]),
      ),
      const Spacer(
        flex: 5,
      ),
      
      Expanded(
        flex: Responsive.isDesktop(context) ? 1 : 3,
        child: Row(
          children:<Widget> [
            OutlinedButton(
              child: const Text('Müşteri Ekle'),
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: ()=> showCupertinoModalBottomSheet(
                isDismissible: false,
                              context: context,
                              builder: (context) =>const CostumerInsert(),
                            ),
            ),
          ],
          
        ),
        
      ),
      
      
    ]);
  }
}
