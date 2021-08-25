import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  double val = 0;
  String botonIF = "Iniciar", titulo="Iniciar";
  Color colorBotonIF = Colors.green;
  bool _isPaused;
  
   
  void change() {
    setState(() {
      if(botonIF == "Iniciar"){
        botonIF = "Detener";
        titulo="Detener Proceso";
        colorBotonIF = Colors.red;
        val++;
      }else{
        botonIF = "Iniciar";
        titulo="Iniciar Proceso";
        colorBotonIF = Colors.green;
        val=val+2;
      }
	
	_isPaused? _isPaused=false: _isPaused=true;

    });
  }

  void proceso(){
	  while (_isPaused) {
		await Future.delayed(Duration(milliseconds: 500));
	      }
	      
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
       backgroundColor: colorBotonIF
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('$val'))),
            ElevatedButton(
              child: Text(botonIF),
              onPressed: change,
              style: ElevatedButton.styleFrom(
                primary: colorBotonIF,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Counter(),
      ),
    );
  }
}

Future<void> main() async {
  runApp(MyApp());
}
