import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:solid_annotations/extensions.dart';
import 'package:solid_annotations/provider.dart';

class Counter {
  final value = Signal<int>(0, name: 'value');

  final counter = Signal<int>(0, name: 'counter');

  late final doubleCounter = Computed<int>(
    () => counter.value * 2,
    name: 'doubleCounter',
  );

  late final logCounter = Effect(() {}, name: 'logCounter');

  void dispose() {
    value.dispose();
    counter.dispose();
    doubleCounter.dispose();
    logCounter.dispose();
  }
}

class EnvironmentInjectionExample extends StatefulWidget {
  const EnvironmentInjectionExample({super.key});

  @override
  State<EnvironmentInjectionExample> createState() =>
      _EnvironmentInjectionExampleState();
}

class _EnvironmentInjectionExampleState
    extends State<EnvironmentInjectionExample> {
  late final counter = context.read<Counter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Environment')),
      body: SignalBuilder(
        builder: (context, child) {
          return Center(child: Text(counter.value.value.toString()));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value.value++,
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
      child: const EnvironmentInjectionExample(),
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
