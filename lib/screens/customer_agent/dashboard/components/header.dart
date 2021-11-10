// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/extensions/localekeys.dart';
import 'package:fortextm/screens/customer_agent/order_form/order_product.dart';
import 'package:fortextm/screens/customer_agent/order_form/order_sample_form.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Header extends StatelessWidget {
  const Header({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 5.0,
            spacing: 10.0,crossAxisAlignment: WrapCrossAlignment.center, children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            PrimaryText(
                text: LocaleKeys.dashboard_dshboard.tr(),
                size: 30,
                fontWeight: FontWeight.w800),
          ]),
     SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 37,
                      ),
      SizedBox(
          width: 155,
          height: 55,
          child: OutlinedButton(
              child: Row(
                children: [
                  Text(LocaleKeys.dashboard_sample.tr()),
                  Image.asset(
                    'lib/assets/images/siparisFormu.png',
                    width: 30,
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: () {
                AlertDialog alert = AlertDialog(
                  content: Wrap(
                    children: [
                      OutlinedButton(
                        onPressed: () => showCupertinoModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            builder: (context) => const OrderSampleForm()),
                        child: Row(
                          children: [
                            const Text('Numune Departmanı Formu'),
                            const Spacer(),
                            Image.asset(
                              'lib/assets/images/numuneTalep.png',
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 4,
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      OutlinedButton(
                        onPressed: () => showCupertinoModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            builder: (context) => const StepperSample()),
                        child: Row(
                          children: [
                            const Text('Üretim Planlama Formu'),
                            const Spacer(),
                            Image.asset(
                              'lib/assets/images/uretimTalep.png',
                              height: 120,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              })),
    ]);
  }
}
