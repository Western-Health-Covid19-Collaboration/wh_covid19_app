import 'package:flutter/material.dart';

class ReusableStepper extends StatefulWidget {
  @override
  _ReusableStepperState createState() => _ReusableStepperState();
}

class _ReusableStepperState extends State<ReusableStepper> {
  List<Step> steps = [
    const Step(
        title: Text('Hand Hygene'),
        isActive: true,
        state: StepState.indexed,
        content: Text('Clean your hands carefully...')),
    Step(
        title: const Text('Gown'),
        isActive: true,
        state: StepState.indexed,
        content: Image.asset(
          'assets/images/gown_on.jpg',
          fit: BoxFit.fill,
        )),
    Step(
        title: const Text('Mask'),
        isActive: true,
        state: StepState.indexed,
        content: Image.asset(
          'assets/images/mask_on.jpg',
          fit: BoxFit.fill,
        )),
    Step(
        title: const Text('Eye Protection'),
        isActive: true,
        state: StepState.indexed,
        content: Image.asset(
          'assets/images/eye_protection_on.jpg',
          fit: BoxFit.fill,
        )),
    const Step(
        title: Text('Hand Hygene'),
        isActive: true,
        state: StepState.indexed,
        content: Text('Clean your hands carefully...')),
    Step(
        title: const Text('Gloves'),
        isActive: true,
        state: StepState.indexed,
        content: Image.asset(
          'assets/images/gloves_on.jpg',
          fit: BoxFit.fill,
        )),
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

  void cancel() {
    if (currentStep > 0) {
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
