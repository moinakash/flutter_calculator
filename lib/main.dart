import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Top());
}


class Top extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator App",
      home: HomeScreen(),

    );
  }
}

class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ModelClass modelClass = new ModelClass();

  int text = 0;

  int title;

  void _setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'), centerTitle: true,),
      body: Container(

        alignment: Alignment.center,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(
              margin: EdgeInsets.all(10),

              child: TextField(


                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'First Number',contentPadding: EdgeInsets.all(10.0)),

                onChanged: (text){



                  modelClass.FirstNumber = int.parse(text);

                },

              ),
            ),





            Container(
              margin: EdgeInsets.all(10),
              child: TextField(

                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Second Number',contentPadding: EdgeInsets.all(10.0)),
                onChanged: (text){

                  modelClass.SecondNumber = int.parse(text);

                },

              ),
            ),







            Container(


              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  RaisedButton(

                      child: Text('+', style: TextStyle(fontSize: 20),),
                      onPressed: (){

                      // modelClass.FirstNumber = 10;
                    //    modelClass.SecondNumber = 12;

                        var f = modelClass.FirstNumber;
                        var s = modelClass.SecondNumber;


                        var a =  f+s;


                        modelClass.result = a;

                        title = a;

                        _setText();
                        print('num: ${modelClass.result}');


                      }),

                  RaisedButton(
                      child: Text('-', style: TextStyle(fontSize: 20),),
                      onPressed: (){

                        var f = modelClass.FirstNumber;
                        var s = modelClass.SecondNumber;


                        var a =  f-s;



                        modelClass.result = a;

                        title = a;

                        _setText();
                      }),

                  RaisedButton(
                      child: Text('*', style: TextStyle(fontSize: 20),),
                      onPressed: (){

                        var f = modelClass.FirstNumber;
                        var s = modelClass.SecondNumber;


                        var a =  f*s;

                        modelClass.result = a;

                        title = a;

                        _setText();

                      }),

                  RaisedButton(
                      child: Text('%', style: TextStyle(fontSize: 20),),
                      onPressed: (){


                        var f = modelClass.FirstNumber;
                        var s = modelClass.SecondNumber;


                        var a =  f%s;

                        modelClass.result = a;

                        title = a;

                        _setText();

                      })


                ],

              ),

            ),






            Container(
              margin: EdgeInsets.all(10),
              child: Text('Result : ${text}',style: TextStyle(fontSize: 20),),
            ),

          ],


        ),

      ),

    );
  }
}

class FirstNumber extends StatelessWidget{

  ModelClass modelClass = new ModelClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(

        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'First Number'),
        onChanged: (text){

          modelClass.FirstNumber = text as int;

        },

      ),
    );
  }
}

class SecondNumber extends StatelessWidget{

  ModelClass modelClass = new ModelClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(

        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Second Number'),
        onChanged: (text){

          modelClass.SecondNumber = text as int;

        },

      ),
    );
  }
}

class Oparators extends StatelessWidget{

  ModelClass modelClass = new ModelClass();
  @override
  Widget build(BuildContext context) {
    return Container(


      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          RaisedButton(

            child: Text('+', style: TextStyle(fontSize: 20),),
              onPressed: (){

                modelClass.FirstNumber = 10;
                modelClass.SecondNumber = 10;

              var f = modelClass.FirstNumber;
              var s = modelClass.SecondNumber;


              var a =  f+s;


              modelClass.result = a;

             print('num: ${modelClass.result}');


          }),

          RaisedButton(
              child: Text('-', style: TextStyle(fontSize: 20),),
              onPressed: (){

                var f = modelClass.FirstNumber;
                var s = modelClass.SecondNumber;


                var a =  f-s;



                modelClass.result = a;


          }),

          RaisedButton(
              child: Text('*', style: TextStyle(fontSize: 20),),
              onPressed: (){

                var f = modelClass.FirstNumber;
                var s = modelClass.SecondNumber;


                var a =  f*s;

                modelClass.result = a;


          }),

          RaisedButton(
              child: Text('/', style: TextStyle(fontSize: 20),),
              onPressed: (){


                var f = modelClass.FirstNumber;
                var s = modelClass.SecondNumber;


                var a =  f%s;

                modelClass.result = a;


          })


        ],

      ),

    );


  }


}


class Result extends StatelessWidget{

  ModelClass modelClass = new ModelClass();



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text('Result : ${modelClass.result}',style: TextStyle(fontSize: 20),),
    );
  }
}

class ModelClass {


  int FirstNumber;
  int SecondNumber;
  int result;

  set setFirstNumber(int fNumber){

    this.FirstNumber = fNumber;

  }

  int get setFirstNumber{

    return FirstNumber;
  }


  set setSecondNumber(int sNumber){

    this.SecondNumber = sNumber;

  }

  int get setSecondNumber{

    return SecondNumber;
  }


  set set_result(int _result){

    this.result = _result;

  }

  int get set_result{

    return result;
  }

}

void _showToast(BuildContext context, int sum) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text('Welcome to my App ${sum}'),
      action: SnackBarAction(
          label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );



}
