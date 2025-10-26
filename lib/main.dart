import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:logger/logger.dart';

late Logger logger;

void main() async {
  SolidartConfig.autoDispose = false;
  WidgetsFlutterBinding.ensureInitialized();

  logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 0,
      ),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final counter = Signal<int>(0, name: 'counter');
  late final doubleCounter = Computed<int>(
    () => counter.value * 2,
    name: 'doubleCounter',
  );
  late final logCounter = Effect(() {}, name: 'logCounter');

  @override
  void initState() {
    super.initState();
    logCounter;
  }

  @override
  void dispose() {
    counter.dispose();
    doubleCounter.dispose();
    logCounter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Computed')),
      body: Center(
        child: SignalBuilder(
          builder: (context, child) {
            return Text(
              'Counter: ${counter.value}, DoubleCounter: ${doubleCounter.value}',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
