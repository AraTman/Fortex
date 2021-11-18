import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/components/department_list.dart';

import '../sp_employee.dart';

class EmployeeInsert extends StatefulWidget {
  const EmployeeInsert({Key? key,required this.code}) : super(key: key);
final String code;
  @override
  EmployeeInsertState createState() => EmployeeInsertState();
}

class EmployeeInsertState extends State<EmployeeInsert>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;
  final url = "employee/add";
  // ignore: unused_field
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firma Ekle"),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        // ignore: prefer_const_constructors
                        Center(
                            child: const PrimaryText(
                                text: "Firma Bilgileri",
                                size: 30,
                                fontWeight: FontWeight.w800)),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Center(
                          child: SizedBox(
                            width: 600,
                            child: Column(
                              children: [
                                FormBuilder(
                                  key: _formKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: <Widget>[
                                      const DepartmentList(),
                                      FormBuilderTextField(
                                        name: 'Name',
                                        decoration: const InputDecoration(
                                          labelText: 'Adı',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                      FormBuilderTextField(
                                        name: 'Surname',
                                        decoration: const InputDecoration(
                                          labelText: 'Soyadı',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.max(
                                              context, 70),
                                        ]),
                                        keyboardType: TextInputType.text,
                                      ),
                                      FormBuilderTextField(
                                        name: 'IdentityNumber',
                                        decoration: const InputDecoration(
                                          labelText: 'T.C Kimlik',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.minLength(
                                              context, 11),
                                          FormBuilderValidators.maxLength(
                                              context, 11),
                                          FormBuilderValidators.numeric(context)
                                        ]),
                                        keyboardType: TextInputType.phone,
                                      ),
                                      FormBuilderTextField(
                                        name: 'TelephoneNumber',
                                        decoration: const InputDecoration(
                                          labelText: 'Telefon Numarası',
                                        ),
                                        // valueTransformer: (text) => num.tryParse(text),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                          FormBuilderValidators.minLength(
                                              context, 11),
                                          FormBuilderValidators.maxLength(
                                              context, 11),
                                          FormBuilderValidators.numeric(context)
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                _getActionButtons(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _getActionButtons() {
    return Column(
      children: [
        ElevatedButton(
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

            futureService.postAll(_formKey.currentState!.value, url,context,'/spemployee',widget.code);
            if (_formKey.currentState!.validate()) {
              _succesMessage();
            } else {
              // ignore: avoid_print
              print("validation failed");
            }
          },
        ),
      ],
    );
  }

  AwesomeDialog _succesMessage() {
    return AwesomeDialog(
      context: context,
      width: 300,
      animType: AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.SUCCES,
      showCloseIcon: true,
      title: 'Başarılı',
      desc: 'Kayıt başarılı',
      btnOkOnPress: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SpEmployee(),
          ),
        );
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }
}
