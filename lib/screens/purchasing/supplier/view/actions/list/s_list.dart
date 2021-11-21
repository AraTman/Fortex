import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/purchasing/supplier/model/s_model.dart';
import 'package:fortextm/screens/purchasing/supplier/view/profil/s_profil.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/emloyee_table_row.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';



class SupplierList extends StatefulWidget {
  const SupplierList({Key? key,required this.code}) : super(key: key);
final String code;
  @override
  _SupplierListState createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "supplier/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<ModelSupplier>> httpEmployee;
  final EmployeeListTabSource _source1 = EmployeeListTabSource(
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
    httpEmployee = futureService.listSupplier(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpEmployee.toBuild<List<ModelSupplier>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((employee) => _source1.add({
              'name': employee.name ,
              'phone':employee.address,
              'actions':Row(children: [
                IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => PsSupplierProfile(
                    id: employee.id,code:widget.code
                  ),
                ),
              )
              ],) 
            }))
        .toList();
      });
      return BsCardContainer(
    child: BsDatatable(
      source: _source1,
      title: const Text('Datatables Data'),
      columns: EmployeeListTabSource.columns,
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
