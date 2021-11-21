import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/subsidiary_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'actions/company_sub_insert.dart';

class CompanySubsidiaryProfile extends StatefulWidget {
  const CompanySubsidiaryProfile(
      {Key? key, required this.id, required this.code})
      : super(key: key);
  final int id;
  final String code;
  @override
  CompanySubsidiaryProfileState createState() =>
      CompanySubsidiaryProfileState();
}

class CompanySubsidiaryProfileState extends State<CompanySubsidiaryProfile>
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
        mainMobilPageBuilder: (context) => Text(''),
        mainWebPageBuilder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 4,
                    ),
                    OutlinedButton(
                      child: const Text('Şube Ekle'),
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
                        builder: (context) => CompanySubInsert(
                          id: widget.id,
                          code: widget.code,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 4,
                    ),
                    const Text(
                      'Şubeler',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 5,
                    ),
                    SubsidiaryLists(
                      id: widget.id,
                      code: widget.code,
                    )
                  ],
                )),
              ],
            ),
        title: 'Şirket Şube Listesi');
  }
}
