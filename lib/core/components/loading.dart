import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({Key? key}) : super(key: key);
Center get _centerLoading => Center(
      child: Lottie.network(
          "https://assets3.lottiefiles.com/datafiles/OisWNdtMtC7TR1b/data.json",
          width: 125,),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    _centerLoading,);
  }
}