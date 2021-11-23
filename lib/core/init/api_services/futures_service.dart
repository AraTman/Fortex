import 'package:fortextm/providers/menu/models/permissonmodel.dart';
import 'package:fortextm/screens/purchasing/supplier/model/s_category_model.dart';
import 'package:fortextm/screens/purchasing/supplier/model/s_model.dart';
import 'package:fortextm/screens/settings/materials/models/m_category_list.dart';
import 'package:fortextm/screens/settings/materials/models/m_group_list.dart';
import 'package:fortextm/screens/settings/materials/models/m_material_list.dart';
import 'package:fortextm/screens/settings/warehouse/models/w_category_list.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_media_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/company_table_model.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/official_list.dart';
import 'package:fortextm/screens/supervisor_module/company_management/models/subsidiary_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/departmans.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/department_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/employee_list.dart';
import 'package:fortextm/screens/supervisor_module/emloyee_module/models/media_type_list.dart';

abstract class IFutureService {
  Future<List<modelCompanyTable>> getHttpTableModel(String path);
  Future<List<modelMediaCompanyTable>> getHttpTableModelGets(
      String path, int id);
  Future<List<DepartmanModel>> getHttpDepartmans(String url);
  Future<List<SubsidiaryList>> getHttpSubsidiaryList(String url, int id);
  Future<List<EmployeeListModel>> getHttpEmployeeList(String url);
  Future<List<EmployeeListModel>> getHttpEmployeeGets(String url, int id);
  Future<List<OfficialList>> getHttpOfficialList(String url, int id);
  Future<List<OfficialList>> getHttpOfficerGets(String url, int id);
  Future<List<DepartmentLists>> getHttpDepartmentLists(String url);
  Future<List<MediaTypeList>> getHttpMediaTypeLists(String url);
  Future<List<permissionModel>> getHttpPermission(String url, String code);

  //Warehouse

  //Supplier
  Future<List<ModelSupplier>> listSupplier(String url);
  Future<List<ModelSupplier>> getSupplier(String url, int id);
  Future<List<ModelPsCategory>> listSupplierCategory(String url);

  //Settings
  //Materials
  Future<List<ModelSMaterialCategory>> listMaterialsCategory(String url);
  Future<List<ModelSMaterialCategory>> getMaterialsCategory(String url,int id);
  Future<List<ModelSMaterialsGroup>> listMaterialsGroup(String url,int id);
  Future<List<ModelSMaterialsGroup>> getMaterialsGroup(String url,int id);
  Future<List<ModelSMaterialsMaterial>> listMaterialsMaterial(String url,int id);
  Future<List<ModelSMaterialsMaterial>> getMaterialsMaterial(String url,int id);
  //Warehouse
  Future<List<ModelSWarehouseCategory>> listWarehouseCategory(String url);
  Future<List<ModelSWarehouseCategory>> getWarehouseCategory(String url,int id);
}
