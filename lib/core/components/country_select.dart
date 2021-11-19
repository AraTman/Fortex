import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/config/size_config.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({Key? key, required this.county}) : super(key: key);
  final String county;
  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  TextEditingController countrys = TextEditingController();
@override
  void initState() {
    super.initState();
    countrys.text= widget.county;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: FormBuilderTextField(
        name: 'Country', controller: countrys,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: 'Ülke',
        ),
        maxLength: 150,onTap: ()=> showCounryPicker(context),
        // valueTransformer: (text) => num.tryParse(text),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(context),
          FormBuilderValidators.max(context, 70),
        ]),
        keyboardType: TextInputType.text,
      ),
    );
  }

  void showCounryPicker(BuildContext context) {
    return showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: 25,
                backgroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 16, color: Colors.blueGrey),
                //Optional. Sets the border radius for the bottomsheet.
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                //Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              onSelect: (Country country) => {
                    print('Select country: ${country.countryCode}'),
                    setState(() {
                      countrys.text = country.displayName.toString();
                    })
                  });
  }
}
