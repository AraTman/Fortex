import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/subsidiary_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'actions/company_sub_insert.dart';

class CompanySubsidiaryProfile extends StatefulWidget {
  const CompanySubsidiaryProfile({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  CompanySubsidiaryProfileState createState() => CompanySubsidiaryProfileState();
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
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şirket Şube Listesi'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,  actions: [
                OutlinedButton(
                       child: const Text('Şube Ekle'),
                       style: OutlinedButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.black,
                         shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10))),
                       ),
                       onPressed: () => showCupertinoModalBottomSheet(
                         isDismissible: false,
                         context: context,
                         builder: (context) =>  CompanySubInsert(id: widget.id,code: widget.code,),
                       ),
                     )
              ],
        
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
                              height: SizeConfig.blockSizeVertical! * 4,
                            ),
                            const Text(
                              'Şubeler',
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 5,
                            ),
                            SubsidiaryLists(id: widget.id,code: widget.code,)
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



  
}
