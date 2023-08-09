import 'package:flutter/material.dart';
import 'package:task_1/Area/area.dart';
import 'package:task_1/Frequency/frequency.dart';
import 'package:task_1/Length/length.dart';
import 'package:task_1/Mass/mass.dart';
import 'package:task_1/Speed/speed.dart';
import 'package:task_1/Temperature/temperature.dart';
 
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task_1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Unit Converter'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.settings),),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: GridView.count(crossAxisCount: 2,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:Column(
                    children: [
                      Center(
                        child: Image.asset('assets/area.png',
                          height: 160,
                          width: 160,),
                      ),

                      Text('Area', style: TextStyle(fontWeight: FontWeight.w800,),),
                    ],
                  ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.grey,

                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Area(),),
              );
            },
          ),


          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:Column(
                  children: [
                    Center(
                      child: Image.asset('assets/frequency.png',
                        height: 160,
                        width: 160,),
                    ),
                    Text('Frequency', style: TextStyle(fontWeight: FontWeight.w800,),),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.grey,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Frequency(),),
              );
            },
          ),


          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:Column(
                  children: [
                    Center(
                      child: Image.asset('assets/length.png',
                        height: 160,
                        width: 160,),
                    ),
                    Text('Length', style: TextStyle(fontWeight: FontWeight.w800,),),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.grey,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Length(),),
              );
            },
          ),


          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:Column(
                  children: [
                    Center(
                      child: Image.asset('assets/mass.png',
                        height: 160,
                        width: 160,),
                    ),
                    Text('mass', style: TextStyle(fontWeight: FontWeight.w800,),),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.grey,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mass(),),
              );
            },
          ),



          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:Column(
                  children: [
                    Center(
                      child: Image.asset('assets/speed.png',
                        height: 160,
                        width: 160,),
                    ),
                    Text('Speed', style: TextStyle(fontWeight: FontWeight.w800,),),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.grey,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Speed(),),
              );
            },
          ),


          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:Column(
                  children: [
                    Center(
                      child: Image.asset('assets/temperature.png',
                        height: 160,
                        width: 160,),
                    ),
                    Text('Temperature', style: TextStyle(fontWeight: FontWeight.w800,),),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.grey,
                ),
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Temperature(),),
              );
            },
          ),


        ],
        ),
      ),
    );
  }
}

