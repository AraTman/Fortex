// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/department_list.dart';

class DepartmentListCheck extends StatefulWidget {
  const DepartmentListCheck({Key? key}) : super(key: key);

  @override
  _DepartmentListCheckState createState() => _DepartmentListCheckState();
}

class _DepartmentListCheckState extends State<DepartmentListCheck>
    with AutomaticKeepAliveClientMixin {
  final welPath = "employee/department/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<DepartmentLists>> httpDepartmentsList;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpDepartmentsList = futureService.getHttpDepartmentLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpDepartmentsList.toBuild<List<DepartmentLists>>(
        onSucces: (datas) {
          var list=datas.map((c) => c ).toList();
          // ignore: unused_local_variable
          var ids=datas.map((c) => c.id ).toList();
      return  FormBuilderFilterChip(
              name: 'AccessDepartmentId',
              decoration: InputDecoration(
                labelText: 'Departmanlar',
              ),
              options: list
            .map((lists) => FormBuilderFieldOption(
                    value: lists.id, child: Text(lists.name)),)
            .toList(growable: false)
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
