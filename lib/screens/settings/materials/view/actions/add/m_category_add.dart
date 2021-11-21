import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/base/view/base_widget.dart';
import 'package:fortextm/core/base/widget/add_button.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';

class SetMaterialCategoryAdd extends StatefulWidget {
  const SetMaterialCategoryAdd({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  SetMaterialCategoryAddState createState() => SetMaterialCategoryAddState();
}

class SetMaterialCategoryAddState extends State<SetMaterialCategoryAdd>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;
  final url = "materials/category/add";
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
                        text: "Kategori Bilgileri",
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
                            returnLocation: '/settings')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        title: 'Hammadde Kategori Ekle');
  }

  FormBuilder buildForm(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
       
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
            name: 'Code',
            decoration: const InputDecoration(
              labelText: 'Kodu',
            ),
            // valueTransformer: (text) => num.tryParse(text),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.max(context, 70),
            ]),
            keyboardType: TextInputType.text,
          ),
          FormBuilderTextField(
            name: 'Description',
            decoration: const InputDecoration(
              labelText: 'Açıklama',
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
