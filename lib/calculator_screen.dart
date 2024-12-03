import 'package:flutter/material.dart';
import 'package:practice3_calculator/calculator_button.dart';
import 'dart:math' as math;

import 'operator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black87,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(resText,
                  style: TextStyle(
                      color: Colors.white ,
                      fontSize: 30
                  ),)
                ],
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //CalculatorButton(text: "C", onButtonClick: onClearClick),

                  /// clear
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      onPressed: (){
                        onClearClick("C");
                        setState(() {

                        });
                      },
                      child: Text("C",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white
                      ),
                      ),
                    ),
                  ),

                  /// backspace
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                        onPressed: (){
                          onBackSpaceClick();
                          setState(() {

                          });
                        },
                        child: Icon(Icons.backspace_outlined,
                          color: Colors.white,
                        size: 25,),
                    ),
                  ),

                  OperatorButton(text: "%", onButtonClick: onOperatorClick),
                  OperatorButton(text: "/", onButtonClick: onOperatorClick),

                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(text: "7", onButtonClick: onDigitClick),
                  CalculatorButton(text: "8", onButtonClick: onDigitClick),
                  CalculatorButton(text: "9", onButtonClick: onDigitClick),
                  OperatorButton(text: "*", onButtonClick: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(text: "4", onButtonClick: onDigitClick),
                  CalculatorButton(text: "5", onButtonClick: onDigitClick),
                  CalculatorButton(text: "6", onButtonClick: onDigitClick),
                  OperatorButton(text: "-", onButtonClick: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(text: "1", onButtonClick: onDigitClick),
                  CalculatorButton(text: "2", onButtonClick: onDigitClick),
                  CalculatorButton(text: "3", onButtonClick: onDigitClick),
                  OperatorButton(text: "+", onButtonClick: onOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(text: "0", onButtonClick: onDigitClick),
                  CalculatorButton(text: ".", onButtonClick: onDigitClick),
                  OperatorButton(text: "√", onButtonClick: onSqrtClick),

                  /// equal button
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onPressed: (){
                        onEqualClick("=");
                        setState(() {

                        });
                      },
                      child: Text("=",
                      style: TextStyle(
                        color: Colors.blue.shade100,
                        fontSize: 35
                      ),
                      )
                    ),
                  ),
                  //CalculatorButton(text: "=", onButtonClick: onEqualClick),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String text){
    resText += text;
    setState(() {

    });
  }

  String operator = '';
  String lhs = '';
  void onOperatorClick (clickOperator){
    if(operator.isEmpty){
      lhs = resText;
    }else{
      String rhs = resText;
      lhs = calculate(lhs, rhs, operator);
    }
    operator = clickOperator;
    resText = '';
    setState(() {

    });

  }

  void onEqualClick(String onEqualClick){
    String rhs = resText;
    resText = calculate(lhs, rhs, operator);
    lhs = '';
    operator = '';
    setState(() {

    });
  }

  void onClearClick(String onClearClick){
    lhs = '';
    operator = '';
    resText = '';
    setState(() {

    });
  }

  void onBackSpaceClick(){
    if(resText.isNotEmpty){
      resText = resText.substring(0, resText.length - 1);
    }
    setState(() {

    });
  }

  void onSqrtClick(String onSqrtClick){
    if(resText.isNotEmpty){
      double num = double.parse(resText);
      if(num >= 0){
        double sqrt = math.sqrt(num);
        resText = sqrt.toString();
      } else {
        resText = "Invalid input";
      }
      setState(() {});
    }
  }


  String calculate(String lhs, String rhs, String operator) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;

    if(operator == "+"){
      res = num1 + num2;
    }else if(operator == "-"){
      res = num1 - num2;
    }else if(operator == "*"){
      res = num1 * num2;
    }else if(operator == "/"){
      res = num1 / num2;
    }else if(operator == "%"){
      res = num1 % num2;
    }

    return res.toString();
  }

  }


