// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fortextm/core/components/country_select.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/core/init/api_services/future_service.dart';

class CompanyInsert extends StatefulWidget {
  const CompanyInsert({Key? key,required this.code}) : super(key: key);
 final String code;
  @override
  CompanyInsertState createState() => CompanyInsertState();
}

class CompanyInsertState extends State<CompanyInsert>
    with SingleTickerProviderStateMixin {
  TextEditingController countrys = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  late FutureService futureService;

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final url = "company/add";
  final imgUrl="company/media/add";
  // ignore: unused_field
  String? _fileName;
  List<PlatformFile>? _paths;
  // ignore: unused_field
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  // ignore: unused_field
  bool _userAborted = false;
  @override
  void initState() {
    super.initState();
  }

  void _pickFiles() async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        // ignore: avoid_print
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  void _clearCachedFiles() async {
    _resetState();
    try {
      bool? result = await FilePicker.platform.clearTemporaryFiles();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result! ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _logException(String message) {
    // ignore: avoid_print
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _userAborted = false;
    });
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
                                    CountrySelect(county: '',),
                                      FormBuilderTextField(
                                        name: 'Name',
                                        decoration: const InputDecoration(
                                          labelText: 'Firma Ad??',
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
                                        name: 'Code',
                                        decoration: const InputDecoration(
                                          labelText: 'Firma Kodu',
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
                                      const SizedBox(
                                        height: 25,
                                      ),
                                   
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const PrimaryText(
                                              text: 'G??r??n??m Ekle',
                                              size: 10,
                                              fontWeight: FontWeight.w800),
                                          Wrap(
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () => _pickFiles(),
                                                icon: const Icon(
                                                  Icons.add_a_photo_sharp,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              IconButton(
                                                onPressed: () =>
                                                    _clearCachedFiles(),
                                                icon: const Icon(
                                                  Icons.cleaning_services,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Builder(
                                        builder: (BuildContext context) =>
                                            _isLoading
                                                ? const Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.0),
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : _paths != null
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 30.0),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.50,
                                                        child: Scrollbar(
                                                            child: ListView
                                                                .separated(
                                                          itemCount: _paths !=
                                                                      null &&
                                                                  _paths!
                                                                      .isNotEmpty
                                                              ? _paths!.length
                                                              : 1,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            final path = _paths!
                                                                .map((e) =>
                                                                    e.path)
                                                                .toList()[index]
                                                                .toString();

                                                            return ListTile(
                                                                title: Center(
                                                              child: SizedBox(
                                                                width: 350,
                                                                height: 350,
                                                                child: Card(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                20.0)),
                                                                    child: Image
                                                                        .file(
                                                                      File(
                                                                          path),
                                                                      width:
                                                                          340,
                                                                      height:
                                                                          340,
                                                                    )),
                                                              ),
                                                            ));
                                                          },
                                                          separatorBuilder:
                                                              (BuildContext
                                                                          context,
                                                                      int index) =>
                                                                  const Divider(),
                                                        )),
                                                      )
                                                    : const SizedBox(),
                                      ),
                                    ],
                                  ),
                                ),
                                _getActionButtons(widget.code),
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
  Widget _getActionButtons(String code) {
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
            futureService = FutureService();
            if (_formKey.currentState!.validate()) {
             futureService.postCompany(
                _formKey.currentState!.value, url, _paths,context,'/sp1',code,imgUrl,1);
            } else {
              print("validation failed");
            }
          },
        ),
      ],
    );
  }
}
