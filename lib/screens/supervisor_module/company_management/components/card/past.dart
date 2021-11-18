import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_model.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/company_management/screens/subsidiary_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CardPastTable extends StatefulWidget {
  const CardPastTable({Key? key}) : super(key: key);

  @override
  _CardPastTableState createState() => _CardPastTableState();
}

class _CardPastTableState extends State<CardPastTable>
    with AutomaticKeepAliveClientMixin {
  final welPath = "company/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<modelCompanyTable>> httpCompany;
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
    httpCompany = futureService.getHttpTableModel(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpCompany.toBuild<List<modelCompanyTable>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((companys) => _source1.add({
              'name': companys.name,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) =>const CompanyProfile(
                    id:2,
                  ),
                ),
              )
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Geçmiş Siparişler'),
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
