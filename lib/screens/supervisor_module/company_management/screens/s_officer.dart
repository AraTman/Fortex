import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'actions/s_officer_update.dart';
class SofficierProfile extends StatefulWidget {
  const SofficierProfile({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  SofficierProfileState createState() => SofficierProfileState();
}

class SofficierProfileState extends State<SofficierProfile>
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
        title: const Text('Personel Profili'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,  actions: [
              
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
                            SEmployeeUpdate(id: widget.id,code: widget.code,),
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
