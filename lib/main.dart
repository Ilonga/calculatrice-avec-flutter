import 'package:flutter/material.dart';

void main() {
  runApp(const Calculatrice());
}

class Calculatrice extends StatelessWidget{
  const Calculatrice();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculatrice",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculatrice(),
    );
  }
}

class SimpleCalculatrice extends StatefulWidget{
  _SimpleCalculatriceState createState() => _SimpleCalculatriceState();
}

class _SimpleCalculatriceState extends State<SimpleCalculatrice>{

  Widget CalculatriceButton(String textButton, Color couleurText, Color couleurButton){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: couleurButton,
      child: MaterialButton(
          onPressed: null,
          padding: EdgeInsets.all(16),
          child: Text(textButton, style: TextStyle(color: couleurText, fontSize: 30, fontWeight: FontWeight.normal)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Calculatrice"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(20,10,30,0),
            child: Text("0",style: TextStyle(fontSize: 30))
          ),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(20,10,30,0),
              child: Text("0",style: TextStyle(fontSize: 30))
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        CalculatriceButton("C", Colors.redAccent, Colors.white),
                        CalculatriceButton("⌫", Colors.blue, Colors.white),
                        CalculatriceButton("%", Colors.blue, Colors.white),
                        CalculatriceButton("÷", Colors.blue, Colors.white),
                    ]),
                    TableRow(
                        children: [
                          CalculatriceButton("7", Colors.blue, Colors.white),
                          CalculatriceButton("8", Colors.blue, Colors.white),
                          CalculatriceButton("9c", Colors.blue, Colors.white),
                          CalculatriceButton("⨯", Colors.blue, Colors.white),
                        ]),
                    TableRow(
                        children: [
                          CalculatriceButton("4", Colors.blue, Colors.white),
                          CalculatriceButton("5", Colors.blue, Colors.white),
                          CalculatriceButton("6", Colors.blue, Colors.white),
                          CalculatriceButton("-", Colors.blue, Colors.white),
                        ]),
                    TableRow(
                        children: [
                          CalculatriceButton("1", Colors.blue, Colors.white),
                          CalculatriceButton("2", Colors.blue, Colors.white),
                          CalculatriceButton("3", Colors.blue, Colors.white),
                          CalculatriceButton("+", Colors.blue, Colors.white),
                        ]),
                    TableRow(
                        children: [
                          CalculatriceButton(".", Colors.blue, Colors.white),
                          CalculatriceButton("0", Colors.blue, Colors.white),
                          CalculatriceButton("00", Colors.blue, Colors.white),
                          CalculatriceButton("=", Colors.white, Colors.blue),
                        ]),
                  ]
                )
              )
            ]
          )
        ]
      )

    );
  }
}

