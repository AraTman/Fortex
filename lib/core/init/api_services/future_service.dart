// ignore_for_file: require_trailing_commas

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/init/cache/shared_preferences_util.dart';
import 'package:fortextm/providers/menu/models/permissonmodel.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_media_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/error_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/official_list.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/subsidiary_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/departmans.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/department_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/media_type_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_category_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_localization_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_localization_size_list.dart';
import 'package:fortextm/screens/warehouse/settings/models/wh_supplier_list.dart';
import 'package:fortextm/screens/warehouse/supplier/models/supplier_list.dart';
import 'package:http_parser/http_parser.dart';

import 'futures_service.dart';

class FutureService extends IFutureService {
  var token = StorageUtil.getString("token");
  final dio = Dio();
  final _baseUrl = "https://app.portalofarge.com/api/";
  dynamic _getDioRequest(String path) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await dio.get(_baseUrl + path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.data;
      default:
        return ErrorModel(response.statusMessage!);
    }
  }

  @override
  Future<List<modelCompanyTable>> getHttpTableModel(String path) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await _getDioRequest(path);
    if (response is List) {
      return response.map((e) => modelCompanyTable.fromJson(e)).toList();
    } else {
      throw response;
    }
  }

  @override
  Future<List<DepartmanModel>> getHttpDepartmans(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await _getDioRequest(url);
    if (response is List) {
      return response.map((e) => DepartmanModel.fromJson(e)).toList();
    } else {
      throw response;
    }
  }

  @override
  Future<List<permissionModel>> getHttpPermission(
      String url, String code) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"code": code});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => permissionModel.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<SubsidiaryList>> getHttpSubsidiaryList(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"companyId": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => SubsidiaryList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }
   @override
  Future<List<OfficialList>> getHttpOfficerGets(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => OfficialList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }
@override
  Future<List<modelMediaCompanyTable>> getHttpTableModelGets(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"companyId": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => modelMediaCompanyTable.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<EmployeeListModel>> getHttpEmployeeList(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await _getDioRequest(url);
    if (response is List) {
      return response.map((e) => EmployeeListModel.fromJson(e)).toList();
    } else {
      throw response;
    }
  }

  @override
  Future<List<EmployeeListModel>> getHttpEmployeeGets(
      String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => EmployeeListModel.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<DepartmentLists>> getHttpDepartmentLists(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await _getDioRequest(url);
    if (response is List) {
      return response.map((e) => DepartmentLists.fromJson(e)).toList();
    } else {
      throw response;
    }
  }

  @override
  Future<List<OfficialList>> getHttpOfficialList(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response =
        await dio.get(urls, queryParameters: {"companySubsidiaryId": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => OfficialList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<MediaTypeList>> getHttpMediaTypeLists(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => MediaTypeList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

//Warehouse
  @override
  Future<List<WhCategoryLists>> getHttpWhCategoryLists(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => WhCategoryLists.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhCategoryLists>> getHttpWhCategoryGets(
      String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => WhCategoryLists.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhModelList>> getHttpWhLists(String url) async {
    dio.options.headers["Authorization"] = 'Bearer $token';
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => WhModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhModelList>> getHttpWhGets(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => WhModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhLocalizationModelList>> getHttpWhLocalizationLists(
      String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => WhLocalizationModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }


  @override
  Future<List<WhLocalizationModelList>> getHttpWhLocalizationGets(
      String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => WhLocalizationModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhLocalizationSizeModelList>> getHttpWhLocalizationSizeLists(
      String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data
              .map((e) => WhLocalizationSizeModelList.fromJson(e))
              .toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhLocalizationSizeModelList>> getHttpWhLocalizationSizeGets(
      String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data
              .map((e) => WhLocalizationSizeModelList.fromJson(e))
              .toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhSupplierCategoryModelList>> getHttpSupplierCategoryLists(
      String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data
              .map((e) => WhSupplierCategoryModelList.fromJson(e))
              .toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<SupplierModelList>> getHttpSupplierLists(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => SupplierModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<SupplierModelList>> getHttpSupplierGets(
      String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return data.map((e) => SupplierModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  //Post
  dynamic postCompany(var data, String paths, var file, BuildContext context,
      String location, String code, String imgUrl, int postNum) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
     
     
      Response response = await dio.post(
        _baseUrl + paths,
        data: data,
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      final datas = response.data;
      if (response.statusCode == 200) {
        // ignore: prefer_typing_uninitialized_variables

        var deger;
        datas.forEach((key, value) {
          deger = value;
        });
      
          final path = file!.map((e) => e.path).toList()[0].toString();
          final _path = File(path);
          final String _fileName =
              file != null ? file!.map((e) => e.name).toString() : '...';
          final String _extension =
              file != null ? file!.map((e) => e.extension).toString() : '...';
          final String fileTyp =
              _extension.replaceAll('(', '').replaceAll(')', '');
          String filesfType;
          if (fileTyp == "pdf" ||
              fileTyp == "docx" ||
              fileTyp == "xlsx" ||
              fileTyp == "xls") {
            filesfType = "document";
          } else {
            filesfType = "image";
          }
          final FormData formData;
          if (postNum == 1) {
            formData = FormData.fromMap({
              "CompanyId": deger,
              "Media": await MultipartFile.fromFile(
                _path.path,
                filename: _fileName.replaceAll('(', '').replaceAll(')', ''),
                contentType: MediaType(filesfType, fileTyp),
              ),
            });
          } else {
            formData = FormData.fromMap({
              "CompanySubsidiaryId": deger,
              "Media": await MultipartFile.fromFile(
                _path.path,
                filename: _fileName.replaceAll('(', '').replaceAll(')', ''),
                contentType: MediaType(filesfType, fileTyp),
              ),
            });
          }

          final urls = "${_baseUrl + imgUrl}";
          response = await dio.post(urls, data: formData);
          return _succesMessage(context, location, code);
       
      } else {
        return response.statusCode;
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return _warningMessage(context, 'Hata${e.error}!');
    }
  }

  dynamic postImage(
      // ignore: type_annotate_public_apis
      var file,
      int id,
      String url,
      int employeeId,
      String fileType,BuildContext context,String code) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      if (file != null) {
        final path = file!.map((e) => e.path).toList()[0].toString();
        final dger = File(path);
        final String _fileName =
            file != null ? file!.map((e) => e.name).toString() : '...';
        final String fileTyp = fileType.replaceAll('(', '').replaceAll(')', '');
        String filesfType;
        if (fileTyp == "pdf" ||
            fileTyp == "docx" ||
            fileTyp == "xlsx" ||
            fileTyp == "xls") {
          filesfType = "document";
        } else {
          filesfType = "image";
        }
        final FormData formData = FormData.fromMap({
          "MediaTypeId": id,
          "EmployeeId": employeeId,
          "Media": await MultipartFile.fromFile(
            dger.path,
            filename: _fileName.replaceAll('(', '').replaceAll(')', ''),
            contentType: MediaType(filesfType, fileTyp),
          ),
        });
        final urls = _baseUrl + url;
        await dio.post(
          urls,
          data: formData,
        );
         return _succesMessage(context, "hr1", code);
      } else {
        return _errorMessage(context, "hr1", "Hata", code);
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return e.error;
    }
  }

  /* post Warehouse */
  dynamic postAll(
      // ignore: type_annotate_public_apis
      var data,
      String paths,
      BuildContext context,
      String location,
      String code) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";

      final Response response = await dio.post(
        _baseUrl + paths,
        data: data,
        options: Options(
          followRedirects: false,
        ),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        return _succesMessage(context, location, code);
      } else {
        // ignore: use_build_context_synchronously
        return _errorMessage(context, location, "", code);
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return _errorMessage(context, location, e.error as String, code);
    }
  }
  dynamic postAllUpdate(
      // ignore: type_annotate_public_apis
      var data,
      String paths,
      BuildContext context,
      String location,
      String code,int Id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      final Response response = await dio.post(
        _baseUrl + paths,
        data: data ,
        options: Options(
          followRedirects: false,
        ),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        return _succesMessage(context, location, code);
      } else {
        // ignore: use_build_context_synchronously
        return _errorMessage(context, location, "", code);
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return _errorMessage(context, location, e.error as String, code);
    }
  }

  AwesomeDialog _succesMessage(
      BuildContext context, String location, String code) {
    return AwesomeDialog(
      context: context,
      width: 300,
      animType: AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.SUCCES,
      showCloseIcon: true,
      title: 'Başarılı',
      desc: 'İşlem başarılı',
      btnOkOnPress: () {
        Navigator.pushNamed(context, location,
            arguments: <String, String>{'code': code});
      },
      btnOkIcon: Icons.check_circle,
      onDissmissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    )..show();
  }

  AwesomeDialog _errorMessage(
      BuildContext context, String location, String message, String code) {
    return AwesomeDialog(
      context: context,
      width: 300,
      animType: AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.ERROR,
      showCloseIcon: true,
      title: 'Hata',
      desc: 'İşlem Başarısız$message',
      btnOkOnPress: () {
        Navigator.pushNamed(context, location,
            arguments: <String, String>{'code': code});
      },
      btnOkColor: AppColors.mtred,
      btnOkIcon: Icons.check_circle,
      onDissmissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    )..show();
  }

  AwesomeDialog _warningMessage(BuildContext context, String message) {
    return AwesomeDialog(
      context: context,
      width: 300,
      animType: AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.WARNING,
      showCloseIcon: true,
      title: 'Hata',
      desc: 'İşlem Başarısız$message',
      btnCancelIcon: Icons.check_circle,btnCancelColor: AppColors.mtorange,
      onDissmissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    )..show();
  }
}
