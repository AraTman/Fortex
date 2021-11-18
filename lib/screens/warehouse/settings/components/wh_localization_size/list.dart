import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_localization_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'profil_page.dart';


class WhLocalizationSizeList extends StatefulWidget {
  const WhLocalizationSizeList({Key? key,required this.code}) : super(key: key);
final String code;
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
        .map((wh) => _source1.add({
              'name': wh.name,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => WhLocalizationSizeProfilPage(
                    id: wh.id,
                    code: widget.code
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
