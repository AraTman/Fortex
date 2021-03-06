import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/screens/settings/materials/view/actions/add/m_group_add.dart';
import 'package:fortextm/screens/settings/materials/view/actions/get/m_category_get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../actions/list/m_group_list.dart';

class SetMaterialCategoryProfile extends StatefulWidget {
  const SetMaterialCategoryProfile(
      {Key? key, required this.id, required this.code})
      : super(key: key);
  final int id;
  final String code;
  @override
  SetMaterialCategoryProfileState createState() =>
      SetMaterialCategoryProfileState();
}

class SetMaterialCategoryProfileState extends State<SetMaterialCategoryProfile>
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
        title: 'Ürün Profil',
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
              SetMaterialCategoryGet(
                id: widget.id,
                code: widget.code,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
               Center(
                  child: OutlinedButton(
                            child: const Text('Grup Ekle'),
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
                              builder: (context) => SetMaterialGroupAdd(
                                code: widget.code,id: widget.id,
                              ),
                            ),
                          ),
                ),
              // if (!Responsive.isDesktop(context))
              SetMaterialGroupList(
                id: widget.id,
                code: widget.code,
              )
            ],
          );
        });
  }
}
