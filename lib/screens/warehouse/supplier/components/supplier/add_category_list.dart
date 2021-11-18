// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_supplier_list.dart';

class SupplierCategoryAddList extends StatefulWidget {
  const SupplierCategoryAddList({Key? key}) : super(key: key);

  @override
  _SupplierCategoryAddListState createState() => _SupplierCategoryAddListState();
}

class _SupplierCategoryAddListState extends State<SupplierCategoryAddList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "supplier/category/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<WhSupplierCategoryModelList>> httpDepartmentsList;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpDepartmentsList = futureService.getHttpSupplierCategoryLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpDepartmentsList.toBuild<List<WhSupplierCategoryModelList>>(
        onSucces: (datas) {
      return FormBuilderField(
        name: "SupplierCategoryId",
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
