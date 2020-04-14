import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;


void main() => runApp(Home());


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Application",
      home: BMI(),
    );
  }




}



class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeBMI();
  }



}




class HomeBMI extends State<BMI> {

  TextEditingController _ageEdit = new TextEditingController();
  TextEditingController _heightEdit = new TextEditingController();
  TextEditingController _weightEdit = new TextEditingController();
  double weight, height;
  double result;
  String bmi = "bmi";
  String status = "status";


  void _calculateBMI () {
    setState(() {
      weight = double.parse(_weightEdit.text);
      height = double.parse(_heightEdit.text);

      result = weight / math.pow(height / 100, 2);
      result = result.roundToDouble();
      bmi = result.toString();
      if (result < 18) status = "Your too Thin!";
      else if (18 < result && result < 25) status = "Your in Normal Shape!";
      else if (result > 25) status = "Your Overweight!";

    });
  }






  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            "BMI",
            style: TextStyle(
              fontSize: 25
            ),
          ),
          centerTitle: true,
        ),

        body: ListView(
          
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Image.asset("assets/images/bmilogo.png", width: 100, height: 100,),),

            Center(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5),
                height: 250,
                color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _ageEdit,
                        decoration: InputDecoration(
                          hintText: "Age",
                          icon: Icon(Icons.person_outline)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: TextField(
                        controller: _heightEdit,
                        keyboardType: TextInputType.number,
//                        controller: _ageEdit,
                        decoration: InputDecoration(
                          hintText: "Height in cm",
                          icon: Icon(Icons.accessibility_new)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                      child: TextField(
                        controller: _weightEdit,
                        keyboardType: TextInputType.number,
//                        controller: _ageEdit,
                        decoration: InputDecoration(
                          hintText: "weight in KG",
                          icon: Icon(Icons.art_track)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Builder(
                        builder: (ctx) =>
                            RaisedButton(
                                onLongPress: () {

                                  final snackbar = SnackBar(content: Text("BMI"), duration: Duration(seconds: 3),);
                                  Scaffold.of(ctx).showSnackBar(snackbar);

                                },
                                color: Colors.pinkAccent,
                                textColor: Colors.white,
                                child: Text(
                                    "Calculate"
                                ),
                                onPressed: _calculateBMI
                            ),
                      )
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Your BMI: $bmi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "$status",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    )
                  ],
                )
              )
            )

            
          ],
          
        ),

      ),
    );
  }



}