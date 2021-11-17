import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({Key? key}) : super(key: key);
Center get _centerLoading => Center(
      child: Lottie.network(
          "https://assets4.lottiefiles.com/private_files/lf30_r5i8efqc.json",
          width: 125));
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    _centerLoading);
  }
}