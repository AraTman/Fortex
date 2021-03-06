import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fortextm/core/constants/colors.dart';
import 'package:fortextm/core/components/loading.dart';
import 'package:fortextm/core/init/cache/shared_preferences_util.dart';
import 'package:fortextm/screens/maindashboard/moduledashboard.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  String token = StorageUtil.getString('token');
  late bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    if (token != "") {
      setState(() {
        _isLoading = true;
      });
      String username = StorageUtil.getString('username');
      String password = StorageUtil.getString('password');
      _autoauthUser(username, password);
    } else {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return _isLoading
        ? const LoadingLottie()
        : FlutterLogin(
            onLogin: _authUser,
            logo: 'lib/assets/images/fortex_logo.png',
            footer: 'BRC Tekstil - Forbigs Ortaklığı',
            onSignup: (_) => Future(() => null),
            hideForgotPasswordButton: true,
            hideSignUpButton: true,
            userValidator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
            onSubmitAnimationCompleted: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => ModuleDashboard()),
                  (route) => false);
            },
            onRecoverPassword: (_) => Future(() => null),
            messages: message(),
            theme: theme(inputBorder),
          );
  }

  LoginMessages message() {
    return LoginMessages(
      userHint: 'Kullanıcı Adı',
      passwordHint: 'Şifre',
      confirmPasswordHint: 'Confirm',
      loginButton: 'Giriş Yap',
    );
  }

  LoginTheme theme(BorderRadius inputBorder) {
    return LoginTheme(
      primaryColor: AppColors.autbg,
      accentColor: Colors.green,
      errorColor: Colors.green,
      bodyStyle: const TextStyle(
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
      textFieldStyle: const TextStyle(
        color: Colors.black,
        shadows: [Shadow(color: Colors.white, blurRadius: 2)],
      ),
      logoWidth: 0.60,
      buttonStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      cardTheme: CardTheme(
        color: AppColors.lgbacg,
        elevation: 5,
        margin: const EdgeInsets.only(top: 15),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(100.0)),
      ),
      inputTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.autbg,
        contentPadding: EdgeInsets.zero,
        errorStyle: const TextStyle(
          backgroundColor: Colors.green,
          color: Colors.white,
        ),
        labelStyle: const TextStyle(fontSize: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lgunder, width: 4),
          borderRadius: inputBorder,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lgunder, width: 5),
          borderRadius: inputBorder,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade700, width: 7),
          borderRadius: inputBorder,
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade400, width: 8),
          borderRadius: inputBorder,
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 5),
          borderRadius: inputBorder,
        ),
      ),
      buttonTheme: LoginButtonTheme(
        splashColor: Colors.green,
        backgroundColor: Colors.green,
        highlightColor: Colors.green,
        elevation: 9.0,
        highlightElevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        // shape: CircleBorder(side: BorderSide(color: Colors.green)),
        // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
      ),
      footerBackgroundColor: Colors.black,
      footerTextStyle: const TextStyle(fontSize: 15),
    );
  }

  Future<String> _authUser(LoginData data) async {
    Map datas = {
      'grant_type': 'password',
      'username': data.name,
      'password': data.password
    };
    // ignore: prefer_typing_uninitialized_variables
    var jsonResponse;
    var url = 'http://localhost:44372/api/login';
    var response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: datas);

    return Future.delayed(loginTime).then((_) {
      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        StorageUtil.putString("token", jsonResponse['access_token']);
        StorageUtil.putString("username", data.name);
        StorageUtil.putString("password", data.password);
      } else {
        return 'User not exists';
      }

      return '';
    });
    // ignore: avoid_print
  }

  // ignore: non_constant_identifier_names
  Future<String> _autoauthUser(String username, password) async {
    Map datas = {
      'grant_type': 'password',
      'username': username,
      'password': password
    };
     var jsonResponse;
    // ignore: prefer_typing_uninitialized_variables
    var url = 'http://localhost:44372/api/login';
    var response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: datas);

    return Future.delayed(loginTime).then((_) {
      if (response.statusCode == 200) {
          jsonResponse = json.decode(response.body);
        StorageUtil.getClear();
        StorageUtil.putString("token", jsonResponse['access_token']);
        StorageUtil.putString("username", username);
        StorageUtil.putString("password", password);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => ModuleDashboard()),
            (route) => false);
      } else {
        return 'User not exists';
      }

      return '';
    });
    // ignore: avoid_print
  }
}
