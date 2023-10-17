import 'package:calculator_app_bloc/src/repositories/calculator_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerFirstNum = TextEditingController();
  final TextEditingController _controllerSecondNum = TextEditingController();
  num result = 0;

  @override
  Widget build(BuildContext context) {
    final CalculatorRepo calculatorRepo = CalculatorRepo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator with Bloc'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextField(
                  controller: _controllerFirstNum,
                  decoration: const InputDecoration(
                      labelText: 'First Number',
                      hintText: 'Enter First Number'),
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _controllerSecondNum,
                  decoration: const InputDecoration(
                      labelText: 'Second Number',
                      hintText: 'Enter Second Number'),
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_controllerFirstNum.text.isNotEmpty &&
                              _controllerSecondNum.text.isNotEmpty) {
                            num num1 = num.parse(_controllerFirstNum.text);
                            num num2 = num.parse(_controllerSecondNum.text);
                            setState(() {
                              result =
                                  calculatorRepo.add(num1: num1, num2: num2);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text(
                          '-',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_controllerFirstNum.text.isNotEmpty &&
                              _controllerSecondNum.text.isNotEmpty) {
                            num num1 = num.parse(_controllerFirstNum.text);
                            num num2 = num.parse(_controllerSecondNum.text);
                            setState(() {
                              result = calculatorRepo.subtract(
                                  num1: num1, num2: num2);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text(
                          'x',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_controllerFirstNum.text.isNotEmpty &&
                              _controllerSecondNum.text.isNotEmpty) {
                            num num1 = num.parse(_controllerFirstNum.text);
                            num num2 = num.parse(_controllerSecondNum.text);
                            setState(() {
                              result = calculatorRepo.multiply(
                                  num1: num1, num2: num2);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text(
                          '/',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_controllerFirstNum.text.isNotEmpty &&
                              _controllerSecondNum.text.isNotEmpty) {
                            num num1 = num.parse(_controllerFirstNum.text);
                            num num2 = num.parse(_controllerSecondNum.text);
                            setState(() {
                              result =
                                  calculatorRepo.divide(num1: num1, num2: num2);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Result: ${result.toStringAsPrecision(3)}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}
