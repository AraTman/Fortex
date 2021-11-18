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

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key, required this.code}) : super(key: key);
final String code;
  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList>
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
              'name': companys.name ,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => CompanyProfile(
                    id: companys.id,code: widget.code,
                  ), 
                ),
              )
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Firma Listesi'),
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
