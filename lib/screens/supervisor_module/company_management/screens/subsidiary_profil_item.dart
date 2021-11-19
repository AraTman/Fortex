import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/card_company_profil.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/official_table.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'actions/s_officer_add.dart';

class SubsidiaryProfileItem extends StatefulWidget {
  const SubsidiaryProfileItem({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  SubsidiaryProfileItemState createState() => SubsidiaryProfileItemState();
}

class SubsidiaryProfileItemState extends State<SubsidiaryProfileItem>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  // ignore: unused_field
  bool _status = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şirket Şube Profil'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 5,
                            ),
                            const Center(child: CompanyPCard()),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 5,
                            ),
                              OutlinedButton(
                       child: const Text('Personel Ekle'),
                       style: OutlinedButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.black,
                         shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10))),
                       ),
                       onPressed: () => showCupertinoModalBottomSheet(
                         isDismissible: false,
                         context: context,
                         builder: (context) =>  SubsidiaryEmployeeAdd(id: widget.id,code: widget.code,),
                       ),
                     ),
                            OfficerList(
                              id: widget.id,code: widget.code,
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  // ignore: unused_element
  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Kaydet",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: () {
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Çık",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = true;
        });
      },
    );
  }
}
