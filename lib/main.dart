import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculatrice());
}

class Calculatrice extends StatelessWidget{
  const Calculatrice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculatrice",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SimpleCalculatrice(),
    );
  }
}

class SimpleCalculatrice extends StatefulWidget{
  const SimpleCalculatrice({super.key});


  _SimpleCalculatriceState createState() => _SimpleCalculatriceState();
}

class _SimpleCalculatriceState extends State<SimpleCalculatrice>{

  String equation = "0";
  String expression = "0";
  String resultat = "0";

  ButtonPressed(String textButton){

    print(textButton);

    setState((){
        if(textButton == "C"){
          equation = "0";
          expression = "0";
        }else if(textButton == "="){
          expression = equation;
          expression = expression.replaceAll("⨯","*");
          expression = expression.replaceAll("÷","/");
          try{
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            resultat = "${exp.evaluate(EvaluationType.REAL, cm)}";
          }catch(e){
            resultat = "Erreur de syntaxe";
          }
        }else if(textButton == "⌫"){
          equation = equation.substring(0, equation.length-1);
          if(equation.isEmpty){
           equation = "0";
          }
          }else{
            if(equation == "0"){
                equation = textButton;
            }else{
            equation = equation + textButton;
          }
        }
    });
  }

  Widget CalculatriceButton(String textButton, Color couleurText, Color couleurButton){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: couleurButton,
      child: MaterialButton(
          onPressed: () => ButtonPressed(textButton),
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
            child: Text(equation,style: TextStyle(fontSize: 30))
          ),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(20,10,30,0),
              child: Text(resultat,style: TextStyle(fontSize: 30))
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
                          CalculatriceButton("9", Colors.blue, Colors.white),
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

