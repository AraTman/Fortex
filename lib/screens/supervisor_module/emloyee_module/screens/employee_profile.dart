import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/responsive.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/screens/actions/e_profil_update.dart';
import '../components/mediatype_list.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({Key? key, required this.id, required this.code})
      : super(key: key);
  final int id;
  final String code;
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
    return BaseView(
        id: widget.id,
        code: widget.code,
        context: context,
         title: 'Personel Profil',
        mainMobilPageBuilder: (context) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              MediaTypesLists(
                employeeId: widget.id,
                code: widget.code,
              )
            ],
          );
        },
        mainWebPageBuilder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmployeeProfil(
                id: widget.id,
                code: widget.code,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              if (!Responsive.isDesktop(context))
                MediaTypesLists(
                  employeeId: widget.id,
                  code: widget.code,
                )
            ],
          );
        });
  }
}
