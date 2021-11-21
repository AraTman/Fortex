
import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'actions/add/m_category_add.dart';
import 'actions/list/m_category_list.dart';

class MaterialsSettings extends StatefulWidget {
  const MaterialsSettings({Key? key,  required this.code})
      : super(key: key);
  final String code;
  @override
  MaterialsSettingsState createState() => MaterialsSettingsState();
}

class MaterialsSettingsState extends State<MaterialsSettings>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        id: 0,
        code: widget.code,
        context: context,
         title: 'Hammadde Ayarları',
        mainMobilPageBuilder: (context) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
            
            ],
          );
        },
        mainWebPageBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
                Center(
                  child: OutlinedButton(
                            child: const Text('Hammadde Ekle'),
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
                              builder: (context) => SetMaterialCategoryAdd(
                                code: widget.code,
                              ),
                            ),
                          ),
                ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              SetMaterialCategoryList(code: widget.code,),
              
             // if (!Responsive.isDesktop(context))
               
            ],
          );
        });
  }
}
