// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/extensions/localekeys.dart';
import 'package:fortextm/screens/customer_agent/order_form/order_product.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'order_sample_form.dart';

class OrderChoose extends StatefulWidget {
  const OrderChoose({Key? key}) : super(key: key);

  @override
  OrderChooseState createState() => OrderChooseState();
}

class OrderChooseState extends State<OrderChoose>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String text = LocaleKeys.dashboard_sample.tr();
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                  flex: 10,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 4,
                          ),
                          Center(
                              child: Column(
                            children: [
                              PrimaryText(
                                  text: text,
                                  size: 30,
                                  fontWeight: FontWeight.w800),
                                  
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 4,
                              ),
                              Wrap(
                                children: [
                                  ElevatedButton(
                                      onPressed: () =>
                                          showCupertinoModalBottomSheet(
                                              context: context,
                                              isDismissible: false,
                                              builder: (context) =>
                                                  const OrderSampleForm()),
                                      child: const Text(
                                          "Numune Üretim Departmanı")),
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal! * 2,
                                  ),
                                  ElevatedButton(
                                      onPressed: () =>
                                          showCupertinoModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  const StepperSample()),
                                      child: const Text("Üretim Planlama.")),
                                ],
                              )
                            ],
                          )),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                        ],
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

 
}
