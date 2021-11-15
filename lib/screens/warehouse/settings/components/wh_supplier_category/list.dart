import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/providers/maindashboard/services/future_service.dart';
import 'package:fortextm/providers/maindashboard/services/futures_service.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_category/profil_page.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_supplier_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WhSupplierCategoryList extends StatefulWidget {
  const WhSupplierCategoryList({Key? key}) : super(key: key);

  @override
  _WhSupplierCategoryListState createState() => _WhSupplierCategoryListState();
}

class _WhSupplierCategoryListState extends State<WhSupplierCategoryList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "supplier/category/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<WhSupplierCategoryModelList>> httpWhCategory;
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
    httpWhCategory = futureService.getHttpSupplierCategoryLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpWhCategory.toBuild<List<WhSupplierCategoryModelList>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((whCategory) => _source1.add({
              'name': whCategory.name,
              'actions': IconButton(
                icon: const Icon(Icons.update,color: Colors.orangeAccent,),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => WhCategoryProfilPage(
                    id: whCategory.id
                ),
                ),
              )
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Tedarikçi Kategori Listesi'),
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
