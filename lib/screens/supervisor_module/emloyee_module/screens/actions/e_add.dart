import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/base/widget/add_button.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/components/department_list.dart';

class EmployeeInsert extends StatefulWidget {
  const EmployeeInsert({Key? key, required this.code}) : super(key: key);
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
    return BaseView(
        id: 0,
        code: widget.code,
        context: context,
        mainMobilPageBuilder: (context) => Text(''),
        mainWebPageBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 4,
                ),
                // ignore: prefer_const_constructors
                Center(
                    child: const PrimaryText(
                        text: "Personel Bilgileri",
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
                        buildForm(context),
                        const SizedBox(
                          height: 25,
                        ),
                        AddButton(
                            formKey: _formKey,
                            isUser: false,
                            UserName: '',
                            UserId: 0,
                            apiUrl: url,
                            menuCode: widget.code,
                            returnLocation: '/hr1')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        title: 'Personel Ekle');
  }

  FormBuilder buildForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          const DepartmentList(),
          FormBuilderTextField(
            name: 'Name',
            decoration: const InputDecoration(
              labelText: 'Adı',
            ),
            // valueTransformer: (text) => num.tryParse(text),
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
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'IdentityNumber',
            decoration: const InputDecoration(
              labelText: 'T.C Kimlik',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 11),
              FormBuilderValidators.maxLength(context, 11),
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
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 11),
              FormBuilderValidators.maxLength(context, 11),
              FormBuilderValidators.numeric(context)
            ]),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
