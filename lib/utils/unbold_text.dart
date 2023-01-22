import 'package:flutter/material.dart';
class UnboldText extends StatelessWidget {
  final String text;
  final Color color;
  double  size;
  UnboldText({required this.text,required this.color,required this.size});


  @override
  Widget build(BuildContext context) {
    return  Text('$text',textAlign: TextAlign.center,
        style: TextStyle(color: color,fontSize:size,)
    );
  }
}
