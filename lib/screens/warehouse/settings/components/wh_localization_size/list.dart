import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_source.dart';
import 'package:fortextm/providers/maindashboard/services/future_service.dart';
import 'package:fortextm/providers/maindashboard/services/futures_service.dart';
import 'package:fortextm/screens/warehouse/settings/components/wh_localization/add.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_category_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_localization_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'profil_page.dart';


class WhLocalizationSizeList extends StatefulWidget {
  const WhLocalizationSizeList({Key? key}) : super(key: key);

  @override
  _WhLocalizationSizeListState createState() => _WhLocalizationSizeListState();
}

class _WhLocalizationSizeListState extends State<WhLocalizationSizeList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "warehouse/localization/size/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<WhLocalizationModelList>> httpWh;
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
    httpWh = futureService.getHttpWhLocalizationLists(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpWh.toBuild<List<WhLocalizationModelList>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((Wh) => _source1.add({
              'name': Wh.name,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => WhLocalizationSizeProfilPage(
                    id: Wh.id
                  ),
                ),
              )
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Datatables Data'),
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
