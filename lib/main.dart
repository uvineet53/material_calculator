import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home:MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output="0";
  String _output="0", operand="";
  double num1=0.0,num2=0.0;
  void buttonLogic(String text)
  {
    if(text=="CLEAR")
      {
        output="0";
        _output="0"; operand="";
        num1=0.0; num2=0.0;
      }
    else if(text=='+'||text=="-"||text=='x'||text=="/")
      {
        num1=double.parse(output);
        operand=text;
        _output="0";

      }
    else if(text=='.')
      {
        if(_output.contains('.'))
         { print("ERROR");
         return;}
        else{
          _output+=text;
        }

      }
    else if(text=='='){
      num2=double.parse(_output);

        if(operand=='+')
        {  _output=(num1+num2).toString();}
        if(operand=='-')
        {  _output=(num1-num2).toString();}
        if(operand=='x')
        {  _output=(num1*num2).toString();}
        if(operand=='/')
        {  _output=(num1/num2).toString();}

        num1=0.0;
        num2=0.0;
        operand="";

    }
    else{
      _output = _output +text;
    }
    print(_output);
    setState(() {
      if(text=='+'||text=="-"||text=='x'||text=="/"){
        output=text;
      }
      else{
      output=double.parse(_output).toStringAsFixed(2);
    }});

  }

  Widget buttonBuilder(String text)
  {
   return Expanded(
      child: MaterialButton(
        height: 80,
        minWidth: 90,
        padding: EdgeInsets.all(2),
        color: Colors.black,
        onPressed: (){
          buttonLogic(text);
        },
        child: Text(text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300,color: Colors.white,letterSpacing: 2),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('CALCULATOR',style: TextStyle(color: Colors.amberAccent),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:

      Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(0, 100, 10, 10),
            child: Text(output,
              style: TextStyle(
              fontSize:60 ,
                color: Colors.white,
              ),),
            ),
          Expanded(
            child: Divider(color: Colors.grey[700],),

          ),
             Row(
              children: <Widget>[
                buttonBuilder('1'),
                buttonBuilder('2'),
                buttonBuilder('3'),
                buttonBuilder('+'),
              ],
            ),
          Row(
            children: <Widget>[
              buttonBuilder('4'),
              buttonBuilder('5'),
              buttonBuilder('6'),
              buttonBuilder('-'),
            ],
          ),
          Row(
            children: <Widget>[
              buttonBuilder('7'),
              buttonBuilder('8'),
              buttonBuilder('9'),
              buttonBuilder('x'),
            ],
          ),
          Row(
            children: <Widget>[
              buttonBuilder('.'),
              buttonBuilder('0'),
              buttonBuilder('00'),
              buttonBuilder('/'),
            ],
          ),
          Row(
            children: <Widget>[
              buttonBuilder('CLEAR'),
              buttonBuilder('='),
            ],
          ),

        ],
      ),
    );
  }
}
