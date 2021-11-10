

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:fortextm/core/config/size_config.dart';

class StepperSample extends StatefulWidget {
  const StepperSample({Key? key}) : super(key: key);

  @override
  State<StepperSample> createState() => _StepperSampleState();
}

class _StepperSampleState extends State<StepperSample> {
  int currentStep = 0;
  bool isCompleted = false;
  TextEditingController firstName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:isCompleted ? buildCompleted(): Theme(
            data: Theme.of(context).copyWith(
              colorScheme:const ColorScheme.light(primary: Colors.red),
            ),
            child: Stepper(
              type: StepperType.horizontal,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                 setState(()=>isCompleted = true);
                } else {
                  setState(() => currentStep += 1);
                }
              },
              onStepCancel: () {
                if (currentStep != 0) {
                  setState(() => currentStep -= 1);
                }
              },controlsBuilder: (BuildContext context, ControlsDetails details) {
                  final isLastStep = currentStep == getSteps().length - 1;
         return Row(
           children: <Widget>[
             SizedBox(height:SizeConfig.blockSizeHorizontal! * 10),
             SizedBox(width: SizeConfig.blockSizeHorizontal!*10,
               child: ElevatedButton(
                 onPressed: details.onStepContinue,
                 child: Text(isLastStep ?'Gönder' :'İleri'),
               ),
             ),
             const Spacer(),
             if(currentStep != 0)
            SizedBox(width: SizeConfig.blockSizeHorizontal!*10,
               child: ElevatedButton(
                 onPressed: details.onStepCancel,
                 child:const Text('Geri'),
               ),
             ),
           ],
         );
      },
            )));
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text('Müşteri Bilgi'),
            content: Column(children: <Widget>[
            SizedBox(
                  width: 600,
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: firstName,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Müşteri Adı'),
                            ),
                          ),
                          const SizedBox(width: 100,),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Ürün Adı'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),
                      Wrap(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Ürün Kodu',
                              ),
                            ),
                          ),
                          const SizedBox(width: 100,),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Numune Numarası'),
                            ),
                          ),
                        ],
                      ),
                   
                    ],
                  ),
                ),
            ],)),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Ürün Bilgi'),
            content: Container(
              child: const Text('Deneme2'),
            )),
        Step(
            isActive: currentStep >= 2,
            title: const Text('Açıklama'),
            content: Container(
              child: const Text('Deneme3'),
            ))
      ];

  buildCompleted() {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [ const Text('Gönderim Başarılı!'),
        const Icon(Icons.check,color: Colors.green,),
      ],
    ));
  }
}
