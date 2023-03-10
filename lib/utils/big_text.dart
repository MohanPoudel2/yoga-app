import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
 final String text;
 final Color color;
 double  size;
 BigText({required this.text,required this.color,required this.size});


  @override
  Widget build(BuildContext context) {
    return Text('$text',
    style: TextStyle(color: color,fontSize:size,fontFamily: 'Courgette',fontWeight: FontWeight.bold)
    );
  }
}
