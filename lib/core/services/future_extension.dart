
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

extension FutureExtension<T> on Future {
  // ignore: avoid_shadowing_type_parameters
  Widget toBuild<T>({Widget Function(T data)? onSucces, Widget? onError}) {
    return FutureBuilder<T>(
      future: this as Future<T>?,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return _centerLoading;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return onSucces!(snapshot.data!);
            } else {
              if (onError != null) return onError;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('Hata'), _networkNotFound],
              );
            }

          default:
            return _networkNotFound;
        }
      },
    );
  }

  Center get _networkNotFound => Center(
    child: Lottie.network(
        "https://assets10.lottiefiles.com/packages/lf20_ed9D2z.json",
        width: 125),
  );

  Center get _centerLoading => Center(
      child: Lottie.network(
          "https://assets4.lottiefiles.com/private_files/lf30_r5i8efqc.json",
          width: 125));
}
