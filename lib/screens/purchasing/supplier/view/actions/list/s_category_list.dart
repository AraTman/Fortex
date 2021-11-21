// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/purchasing/supplier/model/s_category_model.dart';

class PsCategoryList extends StatefulWidget {
  const PsCategoryList({Key? key}) : super(key: key);

  @override
  _PsCategoryListState createState() => _PsCategoryListState();
}

class _PsCategoryListState extends State<PsCategoryList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "supplier/category/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<ModelPsCategory>> httpSupplierList;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpSupplierList = futureService.listSupplierCategory(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpSupplierList.toBuild<List<ModelPsCategory>>(
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
