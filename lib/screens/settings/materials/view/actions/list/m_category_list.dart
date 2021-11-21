import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/config/company_table_source.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/settings/materials/models/m_category_list.dart';
import 'package:fortextm/screens/settings/materials/view/profil/m_category_profile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';



class SetMaterialCategoryList extends StatefulWidget {
  const SetMaterialCategoryList({Key? key,required this.code}) : super(key: key);
final String code;
  @override
  _SetMaterialCategoryListState createState() => _SetMaterialCategoryListState();
}

class _SetMaterialCategoryListState extends State<SetMaterialCategoryList>
    with AutomaticKeepAliveClientMixin {
  final welPath = "materials/category/list";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<ModelSMaterialCategory>> httpEmployee;
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
    httpEmployee = futureService.listMaterialsCategory(welPath);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  httpEmployee.toBuild<List<ModelSMaterialCategory>>(onSucces: (datas) {
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
                  builder: (context) => SetMaterialCategoryProfile(
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
