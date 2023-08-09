import 'package:flutter/material.dart';

void main() {
  runApp(Frequency());
}

class Frequency extends StatelessWidget {
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
  String fromUnit = 'Hertz';
  String toUnit = 'Hertz';

  final units = ['Hertz',
    'Microhertz',
    'Millihertz',
    'Kilohertz',
    'Megahertz',
    'Gigahertz',
    'Terahertz',
    'Petahertz'
  ];

  final unitConversions = {
    'Hertz': 1,
    'Microhertz': 1000000,
    'Millihertz': 1000,
    'Kilohertz': 0.001,
    'Megahertz': 1e-6,
    'Gigahertz': 1e-9,
    'Terahertz': 1e-12,
    'Petahertz': 1e-15,
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
        title: Text('Frequency Converter'),
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
