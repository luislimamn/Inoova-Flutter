import 'package:flutter/material.dart';

class InoovaStepper extends StatefulWidget {
  const InoovaStepper({super.key});

  @override
  State<InoovaStepper> createState() => _InoovaStepperState();
}

class _InoovaStepperState extends State<InoovaStepper> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Stepper",
      home: Scaffold(
        body: Center(
          child: Stepper(
            steps: const[
              Step(
                title: Text("Step 1"),
                  content: Text("Informação do Step 1"),
              ),
              Step(
                title: Text("Step 2"),
                content: Text("Informação do Step 2"),
              ),
              Step(
                title: Text("Step 3"),
                content: Text("Informação do Step 3"),
              ),
            ],
            onStepTapped: (int newIndex){
              setState(() {
                _currentStep = newIndex;
              });
            },
            currentStep: _currentStep,
            onStepContinue: (){
              if(_currentStep != 2){
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: (){
              if(_currentStep != 0){
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
