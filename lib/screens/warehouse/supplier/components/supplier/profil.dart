import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/services/future_extension.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/warehouse/supplier/models/supplier_list.dart';

// ignore: must_be_immutable
class SupplierProfile extends StatefulWidget {
  SupplierProfile({Key? key, required this.id}) : super(key: key);
  late int id;
  @override
  SupplierProfileState createState() => SupplierProfileState();
}

class SupplierProfileState extends State<SupplierProfile>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  bool isLoading = false;
  late IFutureService futureService;
  late Future<List<SupplierModelList>> httpWhCategory;
  final welPath = "supplier/get";
  bool _status = false;
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpWhCategory = futureService.getHttpSupplierGets(welPath, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return httpWhCategory.toBuild<List<SupplierModelList>>(onSucces: (datas) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          Center(
            child: SizedBox(
              width: 600,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[if (_status == false) _getEditIcon()],
                  ),
                  Wrap(runSpacing: 15,spacing: 25,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.supplierCategory.name,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Tedarikçi Türü'),
                        ),
                      ),
                     SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.country,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Ülke'),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.name,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Adı'),
                        ),
                      ),
                       SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.address,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Adress'),
                        ),
                      ),
                        SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.code,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Kodu'),
                        ),
                      ),
                    ],
                  ),
                  if (_status != false) _getActionButtons()
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  // ignore: unused_element
  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Kaydet",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: () {
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              // ignore: avoid_unnecessary_containers
              child: Container(
                  child: ElevatedButton(
                child: const Text(
                  "Çık",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = true;
        });
      },
    );
  }

  Widget get buildTitleLaoding {
    return isLoading
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : const Text("Http");
  }

  bool get wantKeepAlive => true;
}
