import 'package:flutter/material.dart';
import 'package:flutter_app_demo_mvp/counter/counter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> implements CounterView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Demo MVP",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  )),
              const Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "+",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
