import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/official_list.dart';

class OfficerList extends StatefulWidget {
  const OfficerList({Key? key,required this.id}) : super(key: key);
final int id;
  @override
  _OfficerListState createState() => _OfficerListState();
}

class _OfficerListState extends State<OfficerList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "company/official/filter";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<OfficialList>> httpOfficial;
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
    httpOfficial = futureService.getHttpOfficialList(welPath,widget.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpOfficial.toBuild<List<OfficialList>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((official) => _source1.add({
              'name': official.name,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: (){}
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
