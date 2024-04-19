import 'package:flutter/material.dart';

void main() {
  runApp(FatorialApp());
}

class FatorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Fatorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FatorialHomePage(),
    );
  }
}

class FatorialHomePage extends StatefulWidget {
  @override
  _FatorialHomePageState createState() => _FatorialHomePageState();
}

class _FatorialHomePageState extends State<FatorialHomePage> {
  int? _numero;
  int? _fatorial;

  void _calcularFatorial() {
    if (_numero != null && _numero! >= 0) {
      int resultado = 1;
      for (int i = 1; i <= _numero!; i++) {
        resultado *= i;
      }
      setState(() {
        _fatorial = resultado;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Número Inválido"),
            content: Text("Por favor, digite um número válido."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void _resetarValores() {
    setState(() {
      _numero = null;
      _fatorial = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Fatorial'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Digite um número',
                    labelStyle: TextStyle(fontSize: 25, color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.0,
                    fontFamily: 'Roboto',
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  onChanged: (value) {
                    setState(() {
                      _numero = int.tryParse(value);
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calcularFatorial,
                  child:
                      Text('Calcular Fatorial', style: TextStyle(fontSize: 25)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                if (_fatorial != null)
                  Text(
                    'O fatorial de $_numero é $_fatorial',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetarValores,
                  child: Text('Resetar', style: TextStyle(fontSize: 25)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
