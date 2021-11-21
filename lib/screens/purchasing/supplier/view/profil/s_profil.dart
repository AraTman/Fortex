import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/screens/purchasing/supplier/view/actions/get/s_get.dart';

class PsSupplierProfile extends StatefulWidget {
  const PsSupplierProfile({Key? key, required this.id, required this.code})
      : super(key: key);
  final int id;
  final String code;
  @override
  PsSupplierProfileState createState() => PsSupplierProfileState();
}

class PsSupplierProfileState extends State<PsSupplierProfile>
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
         title: 'Tedarikçi Profil',
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
              PsSupplierGet(
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
