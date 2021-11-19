// ignore: implementation_imports, unused_import
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/subsidiary_list.dart';
import 'package:fortextm/screens/supervisor_module/company_management/screens/subsidiary_profil_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SubsidiaryLists extends StatefulWidget {
  const SubsidiaryLists({Key? key, required this.id,required this.code}) : super(key: key);
  final int id;
  final String code;
  @override
  _SubsidiaryListsState createState() => _SubsidiaryListsState();
}

class _SubsidiaryListsState extends State<SubsidiaryLists>
    with AutomaticKeepAliveClientMixin {
  late String welPath = "company/subsidiary/filter";
  bool isLoading = false;

  late IFutureService futureService;
  late Future<List<SubsidiaryList>> httpSubsidiary;

  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpSubsidiary = futureService.getHttpSubsidiaryList(welPath,widget.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return httpSubsidiary.toBuild<List<SubsidiaryList>>(onSucces: (datas) {
      return Wrap(
        spacing: 45,
        runSpacing: 15,
        children: datas
            .map((item) => (() {
                  return ElevatedButton(
                    onPressed: () => showCupertinoModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (context) =>  SubsidiaryProfileItem(
                        id: item.id,code: widget.code,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          'https://medyafirma.com/wp-content/uploads/2017/06/defacto-logo.jpg',
                          height: 50,
                        ),
                        Text(item.name)
                      ],
                    ),
                  );
                }()))
            .toList()
            .cast<Widget>(),
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
