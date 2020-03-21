import 'package:flutter/material.dart';

class ReusableStepper extends StatefulWidget {
  @override
  _ReusableStepperState createState() => _ReusableStepperState();
}

class _ReusableStepperState extends State<ReusableStepper> {
  List<Step> steps = [
    Step(
        title: const Text('Step 1'),
        isActive: true,
        state: StepState.indexed,
        content: Text('Step 1 content')),
    Step(
        title: const Text('Step 2'),
        isActive: true,
        state: StepState.indexed,
        content: Text('Step 2 content')),
    Step(
        title: const Text('Step 3'),
        isActive: true,
        state: StepState.indexed,
        content: Text('Step 3 content')),
  ];

  int currentStep = 0;
  bool complete = false;

  void goToStep(int step) {
    setState(() {
      currentStep = step;
    });
  }

  void nextStep() {
    currentStep + 1 != steps.length
        ? goToStep(currentStep + 1)
        : setState(() => complete = true);
  }

  void cancel(){
    if(currentStep > 0) {
      goToStep(currentStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepContinue: nextStep,
      onStepTapped: (step) => goToStep(step),
      onStepCancel: cancel,
    );
  }
}
