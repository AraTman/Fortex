import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_category_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'profil_page.dart';

class WhCategoryList extends StatefulWidget {
  const WhCategoryList({Key? key,required this.code}) : super(key: key);
final String code;
  @override
  _WhCategoryListState createState() => _WhCategoryListState();
}

class _WhCategoryListState extends State<WhCategoryList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "warehouse/category/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<WhCategoryLists>> httpWhCategory;
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
    httpWhCategory = futureService.getHttpWhCategoryLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpWhCategory.toBuild<List<WhCategoryLists>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((whCategory) => _source1.add({
              'name': whCategory.name,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => WhCategoryProfilPage(
                    id: whCategory.id,
                    code:widget.code
                  ),
                ),
              )
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Depo Kategori Listesi'),
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
