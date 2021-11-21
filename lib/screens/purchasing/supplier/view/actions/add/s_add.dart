import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/base/widget/add_button.dart';
import 'package:fortextm/core/components/country_select.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';
import 'package:fortextm/screens/purchasing/supplier/view/actions/list/s_category_list.dart';

class PsSupplierAdd extends StatefulWidget {
  const PsSupplierAdd({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  PsSupplierAddState createState() => PsSupplierAddState();
}

class PsSupplierAddState extends State<PsSupplierAdd>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;
  final url = "supplier/add";
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
                        text: "Tedarikçi Bilgileri",
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
                            UserName: 'SupplierCategoryId',
                            UserId: 0,
                            apiUrl: url,
                            menuCode: widget.code,
                            returnLocation: '/ps1')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        title: 'Tedarikçi Ekle');
  }

  FormBuilder buildForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          PsCategoryList(),
          CountrySelect(county: 'Turkey (TR) [+90]'),
          FormBuilderTextField(
            name: 'Name',
            decoration: const InputDecoration(
              labelText: 'Firma Adı',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'Address',
            decoration: const InputDecoration(
              labelText: 'Adress',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
        
        ],
      ),
    );
  }
}
