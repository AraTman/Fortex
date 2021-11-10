// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/card/past.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/card/supply.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/card/wait.dart';

class CardPageList extends StatefulWidget {
  const CardPageList({Key? key, required this.deger}) : super(key: key);
  final int deger;
  @override
  CardPageListState createState() => CardPageListState();
}

class CardPageListState extends State<CardPageList>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilgi"),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        // ignore: prefer_const_constructors
                        Center(
                            child: const PrimaryText(
                                text: "Sipariş Bilgi",
                                size: 30,
                                fontWeight: FontWeight.w800)),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                       _list()
                       
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
  StatefulWidget _list(){
    if (widget.deger == 1) {
      return   const CardSupplyTable();
    } else if (widget.deger==2) {
       return   const CardWaitTable();
    }
    else{
      return const CardPastTable();
    }
  }
}
