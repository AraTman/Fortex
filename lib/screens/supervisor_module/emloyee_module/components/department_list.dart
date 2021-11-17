// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/services/future_extension.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/department_list.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({Key? key}) : super(key: key);

  @override
  _DepartmentListState createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList>
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
      return FormBuilderField(
        name: "DepartmentId",
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
        ]),
        builder: (FormFieldState<dynamic> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: "Select option",
              contentPadding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
              border: InputBorder.none,
              errorText: field.errorText,
            ),
            child: SizedBox(
              height: 200,
              child: CupertinoPicker(
                itemExtent: 30,
                children: datas.map((c) => Text(c.name)).toList(),
                onSelectedItemChanged: (index) {
                  field.didChange(datas[index].id);
                },
              ),
            ),
          );
        },
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
