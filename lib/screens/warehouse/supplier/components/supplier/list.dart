import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/warehouse/supplier/models/supplier_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'profil_page.dart';

class SupplierList extends StatefulWidget {
  const SupplierList({Key? key}) : super(key: key);

  @override
  _SupplierListState createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "supplier/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<SupplierModelList>> httpsupplierList;
  final ExampleSource _source1 = ExampleSource(
      data: [],
      editListener: (value, index, sources, source) {
        final data = source.get(index);
        value['typenm'] = 'Edited';

        source.put(index, data);
      });
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpsupplierList = futureService.getHttpSupplierLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpsupplierList.toBuild<List<SupplierModelList>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((supplierList) => _source1.add({
              'name': supplierList.name,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => SupplierProfilPage(
                    id: supplierList.id
                ),
                ),
              )
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Tedarikçi Listesi'),
      columns: ExampleSource.columns,
    ),
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
