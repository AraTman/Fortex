import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/constants/style.dart';

class OrderSampleForm extends StatefulWidget {
  const OrderSampleForm({Key? key}) : super(key: key);

  @override
  OrderSampleFormState createState() => OrderSampleFormState();
}

class OrderSampleFormState extends State<OrderSampleForm>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  TextEditingController ad = TextEditingController();
  TextEditingController unvan = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController tarih = TextEditingController();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  // ignore: unused_field
  String? _fileName;
  File? gpath;
  List<PlatformFile>? _paths;
  // ignore: unused_field
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  // ignore: unused_field
  bool _userAborted = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
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
        title: const Text('Numune Formu Oluştur'),
        backgroundColor: AppColors.primaryBg,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(
                child: SizedBox(
                  width: 600,
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: ad,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Müşteri Adı'),
                            ),
                          ),
                          const SizedBox(width: 100,),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: unvan,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Ürün Adı'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),
                      Wrap(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: tel,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Ürün Kodu',
                              ),
                            ),
                          ),
                          const SizedBox(width: 100,),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: tarih,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Numune Numarası'),
                            ),
                          ),
                        ],
                      ),
                   
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical!*4,),
              Center(
                  child: Column(
                children: [
                  const PrimaryText(
                      text: 'Numune Formu',
                      size: 30,
                      fontWeight: FontWeight.w800),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const PrimaryText(
                          text: 'Görünüm Ekle',
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
                    builder: (BuildContext context) => _isLoading
                        ? const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: CircularProgressIndicator(),
                          )
                        : _paths != null
                            ? Container(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0),
                                height: MediaQuery.of(context)
                                        .size
                                        .height *
                                    0.50,
                                child: Scrollbar(
                                    child: ListView.separated(
                                  itemCount: _paths != null &&
                                          _paths!.isNotEmpty
                                      ? _paths!.length
                                      : 1,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    final path = _paths!
                                        .map((e) => e.path)
                                        .toList()[index]
                                        .toString();

                                    return ListTile(
                                        title: Center(
                                      child: SizedBox(
                                        width: 350,
                                        height: 350,
                                        child: Card(
                                            shape:
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                                20.0)),
                                            child: Image.file(
                                              File(path),
                                              width: 340,
                                              height: 340,
                                            )),
                                      ),
                                    ));
                                  },
                                  separatorBuilder:
                                      (BuildContext context,
                                              int index) =>
                                          const Divider(),
                                )),
                              )
                            : const SizedBox(),
                  ),
                ],
              )),
            
            ],
          ),
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
                onPressed: (){}
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
