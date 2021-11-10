import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortextm/core/config/size_config.dart';
import 'package:fortextm/core/constants/style.dart';
import 'package:fortextm/providers/maindashboard/services/future_service.dart';

// ignore: must_be_immutable
class ImagePicker extends StatefulWidget {
  ImagePicker({Key? key, required this.employeId, required this.id})
      : super(key: key);
  late int employeId, id;

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  // ignore: unused_field
  late String? _fileName;
  List<PlatformFile>? _paths;
// ignore: unused_field
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  final welPath = "employee/media/add";
// ignore: unused_field
  bool _userAborted = false;
  late FutureService futureService;
  @override
  void initState() {
    super.initState();
  }

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  void _pickFiles() async {
    _resetState();

    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.any,
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
      _extension =
          _paths != null ? _paths!.map((e) => e.extension).toString() : '...';
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
    return Center(
      child: Card(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const PrimaryText(
                    text: 'Görünüm Ekle',
                    size: 10,
                    fontWeight: FontWeight.w800),
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _pickFiles();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_sharp,
                        color: Colors.green,
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
                          width: MediaQuery.of(context).size.width * 0.50,
                          padding: const EdgeInsets.only(bottom: 30.0),
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Scrollbar(
                              child: ListView.separated(
                            itemCount: _paths != null && _paths!.isNotEmpty
                                ? _paths!.length
                                : 1,
                            itemBuilder: (BuildContext context, int index) {
                              final pathName = _paths!
                                  .map((e) => e.name)
                                  .toList()[index]
                                  .toString();

                              return ListTile(
                                  title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: SizeConfig.screenWidth! / 8,
                                        height: 140,
                                        child: AutoSizeText(
                                          pathName,
                                          style: const TextStyle(fontSize: 30),
                                          maxLines: 5,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => _clearCachedFiles(),
                                        icon: const Icon(
                                          Icons.cleaning_services,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      futureService = FutureService();

                                      futureService.postImage(
                                          _paths,
                                          widget.id,
                                          welPath,
                                          widget.employeId,
                                          _extension!);
                                    },
                                    icon: const Icon(
                                      Icons.upload_file,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          )),
                        )
                      : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
