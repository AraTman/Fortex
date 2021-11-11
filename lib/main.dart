import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fortextm/providers/maindashboard/moduledashboard.dart';
import 'package:fortextm/providers/maindashboard/services/shared_preferences_util.dart';
import 'package:fortextm/screens/authentication/login/login.dart';
import 'package:fortextm/screens/customer_agent/costumer/costumer.dart';
import 'package:fortextm/screens/customer_agent/dashboard/dashboard.dart';
import 'package:fortextm/screens/supervisor_module/company_management/screens/sp_company.dart';
import 'package:fortextm/screens/supervisor_module/dashboard/dashboard.dart';
import 'package:fortextm/screens/warehouse/dashboard/dashbaord.dart';

import 'core/config/constant.dart';
import 'core/constants/colors.dart';
import 'screens/customer_agent/production/production.dart';
import 'screens/supervisor_module/emloyee_module/screens/sp_employee.dart';
import 'screens/warehouse/settings/wh_settings.dart';

void main() async {
  await StorageUtil.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
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
        '/': (context) =>  const Login(),
        '/costumer': (context) => Costumer(),
        '/moduleDashboard': (context) => ModuleDashboard(),
        '/costumerDashboard': (context) => CostumerDashboard(),

        //Supervisor
        '/supervisorDashboard': (context) => SupervisorDashboard(),
        '/spcompany':(context)=>SpCompany(),
        '/spemployee':(context)=>SpEmployee(),
        '/productDash':(context)=>CostumerProduction(),

        //Warehouse,
        '/warehouseDashboard':(context)=>WarehouseDashboard(),
        '/whsettings':(context)=>WhSettings()
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg),
    );
  }
}
