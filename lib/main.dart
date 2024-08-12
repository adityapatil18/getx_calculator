import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_calculator/calculator_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Creates and injects the controller
    final controller = Get.put(CalculationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX Example"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Card(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  child: _calcWidget(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _tapButton(
                            "+ NumOne",
                            Colors.grey.shade700,
                            () {
                              controller.increaseNumOne();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _tapButton(
                            "+ NumTwo",
                            Colors.blueGrey,
                            () {
                              controller.increaseNumTwo();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _tapButton(
                            "- NumOne",
                            Colors.grey,
                            () {
                              controller.decreaseNumOne();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _tapButton(
                            "- NumTwo",
                            Colors.blueGrey.shade300,
                            () {
                              controller.decreaseNumTwo();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Add",
                      Colors.green,
                      () {
                        controller.add();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Subtract",
                      Colors.blueAccent,
                      () {
                        controller.subtract();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Multiply",
                      Colors.amber,
                      () {
                        controller.multiply();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Divide",
                      Colors.red,
                      () {
                        controller.divide();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    _tapButton(
                      "Reset",
                      Colors.teal,
                      () {
                        controller.reset();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _tapButton(String title, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _calcWidget() {
    return Obx(() {
      final calcController = Get.find<CalculationController>();
      return Center(
        child: Text(
          "${calcController.numOne} ${calcController.currentSign} ${calcController.numTwo} = ${calcController.result}",
          style: const TextStyle(fontSize: 30, color: Colors.black),
        ),
      );
    });
  }
}
