import 'package:flutter/material.dart';

void main() {
  runApp(Mass());
}

class Mass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frequency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AreaConverterScreen(),
    );
  }
}

class AreaConverterScreen extends StatefulWidget {
  @override
  _AreaConverterScreenState createState() => _AreaConverterScreenState();
}

class _AreaConverterScreenState extends State<AreaConverterScreen> {
  double inputValue = 0;
  double resultValue = 0;
  String fromUnit = 'Kilogram';
  String toUnit = 'Kilogram';

  final units = [
    'Kilogram',
    'Milligram',
    'Gram',
    'Ton',
    'Grain',
    'Pound',
    'Stone',
    'Tola',
  ];

  final unitConversions = {
    'Kilogram': 1,
    'Milligram': 1000000,
    'Gram': 1000,
    'Ton': 0.001102311,
    'Grain': 15432.36,
    'Pound': 2.204623,
    'Stone': 0.157473,
    'Tola': 85.73532,
  };

  void convert() {
    double conversionFactor = unitConversions[toUnit]! / unitConversions[fromUnit]!;
    setState(() {
      resultValue = inputValue * conversionFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Mass Converter'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, right: 80, left: 80, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    inputValue = double.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )
                    ),
                    labelText: 'Enter Units To Convert',
                    hintText: 'Enter Units',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )
                ),
              ),


              SizedBox(height: 10,),


              Padding(
                padding: const EdgeInsets.all(30.0),
                child: DropdownButton<String>(
                  menuMaxHeight: 500,
                  isExpanded: true,
                  value: fromUnit,
                  onChanged: (newValue) {
                    setState(() {
                      fromUnit = newValue!;
                    });
                  },
                  items: units.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),



              SizedBox(height: 10),




              Padding(
                padding: const EdgeInsets.all(9.0),
                child: DropdownButton<String>(
                  menuMaxHeight: 500,
                  isExpanded: true,
                  value: toUnit,
                  onChanged: (newValue) {
                    setState(() {
                      toUnit = newValue!;
                    });
                  },
                  items: units.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),


              SizedBox(height: 10),


              ElevatedButton(
                onPressed: convert,
                child: Text('Convert'),
              ),




              SizedBox(height: 10),
              Text('Result: $resultValue $toUnit'),
            ],
          ),
        ),
      ),
    );
  }
}
