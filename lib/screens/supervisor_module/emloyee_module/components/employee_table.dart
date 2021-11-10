import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_source.dart';
import 'package:fortextm/providers/maindashboard/services/future_service.dart';
import 'package:fortextm/providers/maindashboard/services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../screens/employee_profile.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "employee/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<EmployeeListModel>> httpEmployee;
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
    httpEmployee = futureService.getHttpEmployeeList(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpEmployee.toBuild<List<EmployeeListModel>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((employee) => _source1.add({
              'name': employee.name+" "+employee.surname.toString() ,
              'phone':employee.telephoneNumber,
              'actions': IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => EmployeeProfile(
                    id: employee.id
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
