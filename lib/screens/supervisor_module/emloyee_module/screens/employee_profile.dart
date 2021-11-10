import 'package:flutter/material.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/components/employee_profil.dart';
import '../components/mediatype_list.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  EmployeeProfileState createState() => EmployeeProfileState();
}

class EmployeeProfileState extends State<EmployeeProfile>
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
                          EmployeeProfil(
                            id: widget.id,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                          if (!Responsive.isDesktop(context))
                            MediaTypesLists(
                              employeeId: widget.id,
                            )
                        ],
                      ),
                    ),
                  )),
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 4,
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.screenHeight,
                      decoration:
                          const BoxDecoration(color: AppColors.secondaryBg),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            MediaTypesLists(
                              employeeId: widget.id,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
