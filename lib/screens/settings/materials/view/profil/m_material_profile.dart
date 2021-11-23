import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/screens/settings/materials/view/actions/get/m_category_get.dart';
import 'package:fortextm/screens/settings/materials/view/actions/get/m_group_get.dart';
import 'package:fortextm/screens/settings/materials/view/actions/get/m_material_get.dart';
import 'package:fortextm/screens/settings/materials/view/actions/list/m_material_list.dart';

import '../actions/list/m_group_list.dart';

class SetMaterialMaterialProfile extends StatefulWidget {
  const SetMaterialMaterialProfile(
      {Key? key, required this.id, required this.code})
      : super(key: key);
  final int id;
  final String code;
  @override
  SetMaterialMaterialProfileState createState() =>
      SetMaterialMaterialProfileState();
}

class SetMaterialMaterialProfileState extends State<SetMaterialMaterialProfile>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        id: widget.id,
        code: widget.code,
        context: context,
        title: 'Hammadde Profil',
        mainMobilPageBuilder: (context) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [],
          );
        },
        mainWebPageBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetMaterialMaterialGet(
                id: widget.id,
                code: widget.code,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              // if (!Responsive.isDesktop(context))
            
            ],
          );
        });
  }
}
