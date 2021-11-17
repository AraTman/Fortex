import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/providers/future_extension.dart';
import 'package:fortextm/core/services/future_service.dart';
import 'package:fortextm/core/services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';

// ignore: must_be_immutable
class EmployeeProfil extends StatefulWidget {
  EmployeeProfil({Key? key, required this.id}) : super(key: key);
  late int id;
  @override
  EmployeeProfilState createState() => EmployeeProfilState();
}

class EmployeeProfilState extends State<EmployeeProfil>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  TextEditingController ad = TextEditingController();
  TextEditingController unvan = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController tarih = TextEditingController();
  bool isLoading = false;
  late IFutureService futureService;
  late Future<List<EmployeeListModel>> httpEmployee;
  final welPath = "employee/get";
  bool _status = false;
  @override
  void initState() {
    super.initState();
    futureService = FutureService();
    httpEmployee = futureService.getHttpEmployeeGets(welPath, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return httpEmployee.toBuild<List<EmployeeListModel>>(onSucces: (datas) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          Center(
              child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
                ),
              ),
            ],
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
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
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.name,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), labelText: 'Ad'),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.surname,
                          enabled: _status,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Soyad'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.telephoneNumber.toString(),
                          enabled: _status,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Telefon Numarası',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue: datas.first.identityNumber.toString(),
                          enabled: _status,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'T.C Kimlik Numarası',
                          ),
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
