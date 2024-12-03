import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget{
  String text;
  Function onButtonClick;

  OperatorButton({required this.text, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            onPressed: (){
              onButtonClick(text);
            },

            child: Text(text,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue.shade200
              ),
            )
        ),
      ),
    );
  }

}