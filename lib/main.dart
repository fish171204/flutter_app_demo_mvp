import 'package:flutter/material.dart';
import 'package:flutter_app_demo_mvp/counter/counter_presenter.dart';
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
  int count = 0;

  late CounterPresenter presenter;

  _CounterWidgetState() {
    presenter = CounterPresenter();
    presenter.attachView(this);
  }

  @override
  void dispose() {
    super.dispose();
    presenter.deAttachView();
  }

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
                  onPressed: () {
                    presenter.decrement();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  )),
              const Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              TextButton(
                  onPressed: () {
                    presenter.increment();
                  },
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

  // Lay du lieu tu ben Logic gui ve
  @override
  void onDecrement(int value) {
    setState(() {
      count = value;
    });
  }

  @override
  void onIncrement(int value) {
    setState(() {
      count = value;
    });
  }
}
