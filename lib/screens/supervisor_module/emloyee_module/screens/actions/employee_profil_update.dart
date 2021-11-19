import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/init/api_services/future_extension.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/core/init/api_services/futures_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';

// ignore: must_be_immutable
class EmployeeProfil extends StatefulWidget {
  EmployeeProfil({Key? key, required this.id,required this.code}) : super(key: key);
  late int id;
  final String code;
  @override
  EmployeeProfilState createState() => EmployeeProfilState();
}

class EmployeeProfilState extends State<EmployeeProfil>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  final _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  late IFutureService futureService;
  late FutureService futureServices;
  late Future<List<EmployeeListModel>> httpEmployee;
  final welPath = "employee/get";
  final url="employee/update";
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
                SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
                if (_status == false) _getEditIcon(),
            ],
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
            Center(child: buildForm(datas, context)),
                 SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  if (_status != false) _getActionButtons()
        ],
      );
    });
  }
FormBuilder buildForm(
      List<EmployeeListModel> datas, BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: SizeConfig.screenWidth! / 1.5,
        child: Wrap(
          children: [
           
            FormBuilderTextField(
              name: 'Id',

              enabled: false,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.id.toString(),
            ),
            FormBuilderTextField(
              name: 'Name',
              decoration: const InputDecoration(
                labelText: 'Firma Adı',
              ),
              enabled: _status,
              // valueTransformer: (text) => num.tryParse(text),
              initialValue: datas.first.name,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.max(context, 70),
              ]),
              keyboardType: TextInputType.text,
            ),
             FormBuilderTextField(
            name: 'Surname',
            decoration: const InputDecoration(
              labelText: 'Soyadı',
            ),
            initialValue: datas.first.surname,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'TelephoneNumber',
            decoration: const InputDecoration(
              labelText: 'TC Kimlik Numarası',
            ),
           initialValue: datas.first.identityNumber.toString().substring(0,10),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              
            ]),
            keyboardType: TextInputType.phone,
          ),
          FormBuilderTextField(
            name: 'TelephoneNumber',
            decoration: const InputDecoration(
              labelText: 'Telefon',
            ),
           initialValue: datas.first.telephoneNumber.toString().substring(0,10),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              
            ]),
            keyboardType: TextInputType.phone,
          ), 
          ],
        ),
      ),
    );
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
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate()) {
                    futureServices = FutureService();
                    futureServices.postAllUpdate(_formKey.currentState!.value,
                        url, context, '/sp1', widget.code, widget.id);
                    setState(() {
                      _status = false;
                      FocusScope.of(context).requestFocus(FocusNode());
                    });
                  } else {
                    print("validation failed");
                  }
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
