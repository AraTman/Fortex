import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fortextm/providers/maindashboard/services/shared_preferences_util.dart';
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
  final _baseUrl = "https://localhost:44372/api/";
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
  Future<List<Departmans>> getHttpDepartmans(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    final response = await _getDioRequest(url);
    if (response is List) {
      return response.map((e) => Departmans.fromJson(e)).toList();
    } else {
      throw response;
    }
  }

  @override
  Future<List<SubsidiaryList>> getHttpSubsidiaryList(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"companyId": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    String urls = _baseUrl + url;
    final response =
        await dio.get(urls, queryParameters: {"companySubsidiaryId": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
  Future<List<WhLocalizationModelList>> getHttpWhLocalizationLists(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
  Future<List<WhLocalizationModelList>> getHttpWhLocalizationGets(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
  Future<List<WhLocalizationSizeModelList>> getHttpWhLocalizationSizeLists(String url) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
        if (data is List) {
          return data.map((e) => WhLocalizationSizeModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }

  @override
  Future<List<WhLocalizationSizeModelList>> getHttpWhLocalizationSizeGets(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
        if (data is List) {
          return data.map((e) => WhLocalizationSizeModelList.fromJson(e)).toList();
        } else {
          throw data;
        }
      default:
        return response.data;
    }
  }
   @override
  Future<List<WhSupplierCategoryModelList>> getHttpSupplierCategoryLists(String url) async {
      dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
        if (data is List) {
          return data.map((e) => WhSupplierCategoryModelList.fromJson(e)).toList();
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
    String urls = _baseUrl + url;
    final response = await dio.get(urls);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
  Future<List<SupplierModelList>> getHttpSupplierGets(String url, int id) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    String urls = _baseUrl + url;
    final response = await dio.get(urls, queryParameters: {"id": id});
    switch (response.statusCode) {
      case HttpStatus.ok:
        var data = response.data;
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
  dynamic postCompany(var data, String paths, var file) async {
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
      var datas = response.data;
      if (response.statusCode == 200) {
        // ignore: prefer_typing_uninitialized_variables
        var deger;
        datas.forEach((key, value) {
          deger = value;
        });

        final path = file!.map((e) => e.path).toList()[0].toString();
        var dger = File(path);
        String _fileName =
            file != null ? file!.map((e) => e.name).toString() : '...';
        FormData formData = FormData.fromMap({
          "CompanyId": deger,
          "Media": await MultipartFile.fromFile(dger.path,
              filename: _fileName.replaceAll('(', '').replaceAll(')', ''),
              contentType: MediaType('image', 'png')),
        });
        var urls = _baseUrl + "company/media/add";
        response = await dio.post(urls, data: formData);
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return e.error;
    }
  }

  dynamic postSubsidiry(var data, String paths, var file, int id) async {
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
      var datas = response.data;
      if (response.statusCode == 200) {
        // ignore: prefer_typing_uninitialized_variables
        var deger;
        datas.forEach((key, value) {
          deger = value;
        });
        if (file != null) {
          final path = file!.map((e) => e.path).toList()[0].toString();
          var dger = File(path);
          String _fileName =
              file != null ? file!.map((e) => e.name).toString() : '...';
          FormData formData = FormData.fromMap({
            "CompanyId": deger,
            "Media": await MultipartFile.fromFile(dger.path,
                filename: _fileName, contentType: MediaType('image', 'png')),
          });
          var urls = _baseUrl + "company/subsidiary/media/add";
          response = await dio.post(
            urls,
            data: formData,
          );
        }

        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return e.error;
    }
  }

  dynamic postEmployee(var data, String paths) async {
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
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return e.error;
    }
  }

  dynamic postImage(
      var file, int id, String url, int employeeId, String fileType) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      if (file != null) {
        final path = file!.map((e) => e.path).toList()[0].toString();
        var dger = File(path);
        String _fileName =
            file != null ? file!.map((e) => e.name).toString() : '...';
        String fileTyp = fileType.replaceAll('(', '').replaceAll(')', '');
        String filesfType;
        if (fileTyp == "pdf" ||
            fileTyp == "docx" ||
            fileTyp == "xlsx" ||
            fileTyp == "xls") {
          filesfType = "document";
        } else {
          filesfType = "image";
        }
        FormData formData = FormData.fromMap({
          "MediaTypeId": id,
          "EmployeeId": employeeId,
          "Media": await MultipartFile.fromFile(dger.path,
              filename: _fileName.replaceAll('(', '').replaceAll(')', ''),
              contentType: MediaType(filesfType, fileTyp)),
        });
        var urls = _baseUrl + url;
        await dio.post(
          urls,
          data: formData,
        );
      } else {
        return 'Error';
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return e.error;
    }
  }

  /* post Warehouse */
  dynamic postWhCategory(var data, String paths) async {
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
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } on DioError catch (e) {
      // ignore: avoid_print
      return e.error;
    }
  }
}
