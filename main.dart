import 'package:flutter/material.dart';
import 'package:untitled7/Temperature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override


  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var message = 'Resultat';
  var keyForm = GlobalKey<FormState>();
  var tempController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My exam application"),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Convertisseur de Temperature",
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              Form(
                key: keyForm,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) return "Veuillez saisir une temperature";
                      },
                      controller: tempController,
                      decoration: const InputDecoration(
                        labelText: "Saisir une temperature",
                        icon: Icon(Icons.sunny),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {
                        var t1 = Temperature(
                            temp: double.parse(tempController.text),
                            res: 0);
                        double celsiusResult = t1.CalculCelcius(t1.temp);

                        setState(() {
                          message = "Celsius: $celsiusResult";
                        });
                      }
                    },
                    child: const Text("TO CELCIUS"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {
                        var t1 = Temperature(
                          temp: double.parse(tempController.text),
                          res: 0,
                        );
                        double fahrnResult = t1.CalculFahrn(t1.temp);

                        setState(() {
                          message = "Fahrenheit: $fahrnResult";
                        });
                      }
                    },
                    child: const Text("TO FAHRNHEIT"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.lightGreen, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}