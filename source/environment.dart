import 'package:flutter/material.dart';
import 'package:solid_annotations/provider.dart';
import 'package:solid_annotations/solid_annotations.dart';

class Counter {
  @SolidState()
  int value = 0;

  @SolidState()
  int counter = 0;

  @SolidState()
  int get doubleCounter => counter * 2;

  @SolidEffect()
  void logCounter() {
    // logger.i('yuck!');
  }
}

class EnvironmentInjectionExample extends StatelessWidget {
  EnvironmentInjectionExample({super.key});

  @SolidEnvironment()
  late Counter counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Environment')),
      body: Center(child: Text(counter.value.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EnvironmentExample extends StatelessWidget {
  const EnvironmentExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SolidProvider(
      create: (context) => Counter(),
      child: EnvironmentInjectionExample(),
    );
  }
}

// or

// class EnvironmentExample2 extends StatelessWidget {
//   const EnvironmentExample2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // TODO (Trey) - Not working for me
//     return EnvironmentInjectionExample.environment((context) => Counter());
//   }
// }
