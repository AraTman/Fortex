import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/settings/materials/models/m_group_list.dart';
import 'package:fortextm/screens/settings/materials/view/profil/m_group_profile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// ignore: must_be_immutable
class SetMaterialGroupList extends StatefulWidget {
  SetMaterialGroupList({Key? key, required this.id, required this.code})
      : super(key: key);
  late int id;
  final String code;
  @override
  SetMaterialGroupListState createState() => SetMaterialGroupListState();
}

class SetMaterialGroupListState extends State<SetMaterialGroupList>
    with SingleTickerProviderStateMixin {
      final welPath = "materials/group/list";
  final url = "materials/group/update";
  late IFutureService futureService;
  late Future<List<ModelSMaterialsGroup>> httpEmployee;
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
    httpEmployee = futureService.listMaterialsGroup(welPath,widget.id);
  }

   @override
  Widget build(BuildContext context) {
    return  httpEmployee.toBuild<List<ModelSMaterialsGroup>>(onSucces: (datas) {
      Future.delayed(Duration.zero, () async {
    _source1.clear();
    datas
        .map((employee) => _source1.add({
              'name': employee.name ,
              'actions':Row(children: [
                IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => showCupertinoModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) => SetMaterialGroupProfile(
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
      title: const Text('Ürün Grup Tablosu'),
      columns: ExampleSource.columns,
    ),
      );
    });
  }

 
}
