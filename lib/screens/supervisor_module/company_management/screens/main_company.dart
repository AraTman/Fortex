import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'company_profile.dart';
import 'subsidiary_list.dart';

class CompanyMainProfile extends StatefulWidget {
  const CompanyMainProfile({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  CompanyMainProfileState createState() => CompanyMainProfileState();
}

class CompanyMainProfileState extends State<CompanyMainProfile>
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
        title: const Text('Firma Profili'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,  actions: [
                OutlinedButton(
                       child: const Text('Şube Listesi'),
                       style: OutlinedButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.black,
                         shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10))),
                       ),
                       onPressed: () => showCupertinoModalBottomSheet(
                         isDismissible: false,
                         context: context,
                         builder: (context) =>  CompanySubsidiaryProfile(id: widget.id,code: widget.code,),
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
                     
                        Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 5,
                            ),
                            CompanyProfil(id: widget.id,code:widget.code),
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
