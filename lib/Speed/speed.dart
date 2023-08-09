import 'package:flutter/material.dart';

void main() {
  runApp(Speed());
}

class Speed extends StatelessWidget {
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
  String fromUnit = 'Kilometer/Hour';
  String toUnit = 'Kilometer/Hour';

  final units = [
    'Kilometer/Hour',
    'Miles/hour',
    'Feet/Second',
    'Meter/Second',
    'Kilometer/Second',
    'Knot',
    'Speed of Sound',
  ];

  final unitConversions = {
    'Kilometer/Hour': 1,
    'Miles/hour': 0.6213712,
    'Feet/Second': 0.9113444,
    'Meter/Second': 0.2777778,
    'Kilometer/Second': 2.77778e-4,
    'Knot': 0.5399565,
    'Speed of Sound': 8.098477e-4,
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
        title: Text('Speed Converter'),
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
