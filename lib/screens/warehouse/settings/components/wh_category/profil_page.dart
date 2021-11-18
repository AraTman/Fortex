import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh/add.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh/list.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_category/profile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WhCategoryProfilPage extends StatefulWidget {
  const WhCategoryProfilPage({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  WhCategoryProfilPageState createState() => WhCategoryProfilPageState();
}

class WhCategoryProfilPageState extends State<WhCategoryProfilPage>
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
          title: const Text('Kategori Profili'),
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
                          WhCategoryProfile(
                            id: widget.id,
                          ),
                          const SizedBox(height:25,),
                          Center(
                            child: OutlinedButton(
                              child: const Text('Depo Ekle'),
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
                                builder: (context) =>  WhAdd(id: widget.id,code: widget.code,),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                          WhList(code:  widget.code,)
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
