import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';

import 'actions/list/w_category_list.dart';

class WarehouseSettings extends StatefulWidget {
  const WarehouseSettings({Key? key,  required this.code})
      : super(key: key);
  final String code;
  @override
  WarehouseSettingsState createState() => WarehouseSettingsState();
}

class WarehouseSettingsState extends State<WarehouseSettings>
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
         title: 'Depo Ayarları',
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
              SetWarehouseCategoryList(code: widget.code,)
             // if (!Responsive.isDesktop(context))
               
            ],
          );
        });
  }
}
