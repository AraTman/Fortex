// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/customer_agent/dashboard/components/info_card.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/departmans.dart';

class ModuleList extends StatefulWidget {
  const ModuleList({Key? key}) : super(key: key);

  @override
  _ModuleListState createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "login/role";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<DepartmanModel>> httpCompany;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpCompany = futureService.getHttpDepartmans(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpCompany.toBuild<List<DepartmanModel>>(onSucces: (datas) {
      return Wrap(
        runSpacing: 15,
        spacing: 15,
        children: datas
            .map((item) => () {
                  final int color = int.parse(item.department.color);
                  return SizedBox(
                    width: SizeConfig.screenWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,),
                      onPressed: () {
                        
                        Navigator.pushNamed(
                          context,
                          '/${item.department.routes}',
                          arguments: <String, String>{
                            'code': item.department.code
                          },
                        );
                       
                      },
                      child: InfoCard(
                          border: Color(color),
                          icon: 'lib/assets/images/${item.department.image}',
                          label: item.department.name,
                          amount: '',),
                    ),
                  );
                }(),)
            .toList()
            .cast<Widget>(),
      );
    },);
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
