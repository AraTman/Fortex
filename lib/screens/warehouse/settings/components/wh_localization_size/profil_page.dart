import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_localization_size/add.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_localization_size/list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'profile.dart';



class WhLocalizationSizeProfilPage extends StatefulWidget {
  const WhLocalizationSizeProfilPage({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  WhLocalizationSizeProfilPageState createState() => WhLocalizationSizeProfilPageState();
}

class WhLocalizationSizeProfilPageState extends State<WhLocalizationSizeProfilPage>
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
                          WhLocalizationSizeProfile(
                            id: widget.id,
                          ),
                          const SizedBox(height:25,),
                          Center(
                            child: OutlinedButton(
                              child: const Text('Lokasyon Özelliklerini Ekle'),
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
                                builder: (context) =>  WhLocalizationSizeAdd(id: widget.id,code: widget.code),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                           WhLocalizationSizeList(code: widget.code,)
                        ],
                        
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
