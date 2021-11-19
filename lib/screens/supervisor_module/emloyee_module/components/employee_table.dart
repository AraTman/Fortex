import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/company_management/components/emloyee_table_row.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/screens/actions/e_permissions_add.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/screens/actions/employee_user_add.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../screens/employee_profile.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key,required this.code}) : super(key: key);
final String code;
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
              'actions':Row(children: [
                IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => EmployeeProfile(
                    id: employee.id,code:widget.code
                  ),
                ),
              ),IconButton(
                icon: const Icon(Icons.security_outlined,color: AppColors.mtred,),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) =>  EmployeeUserAdd(
                    id: employee.id,code:widget.code
                  ),
                ),
              ),IconButton(
                icon: const Icon(Icons.dashboard,color: AppColors.mtorange,),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => EmployeePermissionsAdd(
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
