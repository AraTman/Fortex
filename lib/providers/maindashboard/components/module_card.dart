// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/providers/maindashboard/services/future_service.dart';
import 'package:fortextm/providers/maindashboard/services/futures_service.dart';
import 'package:fortextm/screens/customer_agent/dashboard/components/info_card.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/departmans.dart';

class ModuleWidget extends StatefulWidget {
  const ModuleWidget({Key? key}) : super(key: key);

  @override
  _ModuleWidgetState createState() => _ModuleWidgetState();
}

class _ModuleWidgetState extends State<ModuleWidget>
    with AutomaticKeepAliveClientMixin {
  final welPath = "login/role";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<Departmans>> httpCompany;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpCompany = futureService.getHttpDepartmans(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpCompany.toBuild<List<Departmans>>(onSucces: (datas) {
      return Wrap(
        runSpacing: 15,
        spacing: 15,
        children: datas
            .map((item) => (() {
              int color = int.parse(item.department.color);
                  return SizedBox(width: SizeConfig.screenWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      onPressed: () {
                        Navigator.pushNamed(context, '/${item.department.routes}');
                      },
                      child: InfoCard(
                          border: Color(color),
                          icon: 'lib/assets/images/${item.department.image}',
                          label: item.department.name,
                          amount: ''),
                    ),
                  );
                }()))
            .toList()
            .cast<Widget>(),
      );
    });
  }

  Widget get buildTitleLaoding {
    return isLoading
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : const Text("Http");
  }

  @override
  bool get wantKeepAlive => true;
}
