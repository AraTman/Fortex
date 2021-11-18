import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/core/init/cache/shared_preferences_util.dart';
import 'package:fortextm/screens/authentication/login/login.dart';
import 'package:fortextm/screens/customer_agent/costumer/costumer.dart';
import 'package:fortextm/screens/customer_agent/dashboard/dashboard.dart';
import 'package:fortextm/screens/supervisor_module/company_management/screens/sp_company.dart';
import 'package:fortextm/screens/supervisor_module/dashboard/dashboard.dart';
import 'package:fortextm/screens/warehouse/dashboard/dashbaord.dart';
import 'package:fortextm/screens/warehouse/locations/locations.dart';

import 'core/config/constant.dart';
import 'core/constants/colors.dart';
import 'screens/customer_agent/production/production.dart';
import 'screens/maindashboard/moduledashboard.dart';
import 'screens/supervisor_module/emloyee_module/screens/sp_employee.dart';
import 'screens/warehouse/settings/wh_settings.dart';
import 'screens/warehouse/stock/stock.dart';
import 'screens/warehouse/supplier/wh_supplier.dart';
import 'screens/warehouse/undocumented/undocumented.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppConstant.SUPPORTED_LOCALE,
      path: AppConstant.LANG_PATH,
      fallbackLocale: const Locale('tr', 'TR'),
      child: MyApp(),
    ),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      
      routes: {
        '/': (context) => const Login(),
        '/moduleDashboard': (context) => ModuleDashboard(),

        //Supervisor
        '/sp0': (context) => const SupervisorDashboard(),
        '/sp1': (context) => SpCompany(),
        //Personele yetki ekleme

        //Warehouse,
        '/wh0': (context) => WarehouseDashboard(),
        '/whsettings': (context) => WhSettings(),
        '/wh03': (context) => INVStock(), //Stock
        '/wh09': (context) => INVLocation(),
        '/wh01': (context) => INVUndocumented(),

        //TestSupplier
        '/testsupplier': (context) => TestSupplier(),

        //HumanResources
        '/hr1': (context) => SpEmployee(),

        '/productDash': (context) => CostumerProduction(),
        '/costumer': (context) => Costumer(),
      
        '/cd0': (context) => CostumerDashboard(),

      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg),
    );
  }
}
