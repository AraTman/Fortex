import 'package:flutter/material.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'actions/s_officer_update.dart';

class SofficierProfile extends StatefulWidget {
  const SofficierProfile({Key? key, required this.id, required this.code})
      : super(key: key);
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
                      height: SizeConfig.blockSizeVertical! * 5,
                    ),
                    SEmployeeUpdate(
                      id: widget.id,
                      code: widget.code,
                    ),
                  ],
                )),
              ],
            ),
        title: 'Yetkili Profili');
  }
}
