import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh/add.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_category/profile.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_localization/add.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_localization/list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'profile.dart';

class WhProfilPage extends StatefulWidget {
  const WhProfilPage({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  WhProfilPageState createState() => WhProfilPageState();
}

class WhProfilPageState extends State<WhProfilPage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Depo Profili'),
          backgroundColor: AppColors.primaryBg,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 10,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WhProfile(
                            id: widget.id,
                          ),
                          const SizedBox(height:25,),
                        Center(
                            child: OutlinedButton(
                              child: const Text('Lokasyon Ekle'),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () => showCupertinoModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                builder: (context) =>  WhLocalizationAdd(id: widget.id,),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                          const WhLocalizationList()
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
