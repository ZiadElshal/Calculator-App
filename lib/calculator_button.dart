import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget{
  String text;
  Function onButtonClick;

  CalculatorButton({required this.text, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: (){
              onButtonClick(text);
            },

            child: Text(text,
            style: TextStyle(
              fontSize: 35,
              color: Colors.blue
            ),
            )
        ),
      ),
    );
  }

}