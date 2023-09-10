import 'dart:ffi';

import 'package:bmi_app/bmi.dart';
import 'package:bmi_app/bmibox.dart';
import 'package:bmi_app/bmidata.dart';
import 'package:bmi_app/bmilist.dart';
import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class resultbmi extends StatefulWidget {
  resultbmi({Key? key,this.ageresult,required this.bmiresult,this.genderesult,this.heightresult,this.nameresult,this.weightresult,this.ind,this.bmidoublevalue,this.bmitex}) : super(key: key);
   double? weightresult=0.0;
   int? ageresult=0;
   int? ind=0;
   String? nameresult="";
   double? heightresult=0;
   String? genderesult="";
   String bmiresult="";
   String? bmitex="";
   double? bmidoublevalue=0;

  @override
  State<resultbmi> createState() => _resultbmiState(bmiresult1: bmiresult,bmidoublevalue1: bmidoublevalue,bmitext: bmitex,genderresult1: genderesult,nameresult1: nameresult,ageresult1: ageresult,heightresult1: heightresult,weightresult1: weightresult);
}

class _resultbmiState extends State<resultbmi> {
  _resultbmiState({required this.bmiresult1,this.bmidoublevalue1,this.bmitext,this.ageresult1,this.genderresult1,this.heightresult1,this.nameresult1,this.weightresult1});
  String bmiresult1="";
  double? weightresult1=0;
  String? bmitext="";
  double? bmidoublevalue1=0;
  String? genderresult1="";
  int? ageresult1=0;
  double? heightresult1=0;
  String? nameresult1="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
      child: Column(
        children: [
          Padding(padding:EdgeInsets.only(left: 20,top: 40,),child: CircularPercentIndicator(
            radius: 80,
            lineWidth: 35,
            percent: bmidoublevalue1!/100,
            progressColor: Colors.blue.shade900,
            startAngle: 270,
            backgroundColor: Colors.grey.shade200,
          )),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(top: 10,left: 25),child: Text("BMI: $bmidoublevalue1",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),),
          SizedBox(height: 10,),
          Container(
            height: 495,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 20,left: 10),
                  child: Row(
                    children: [
                      Container(height:70,width:340,decoration:BoxDecoration(border: Border.all(color: Colors.black,width: 2,)),child: Text("$bmitext",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,softWrap: true,)),
                      SizedBox(width: 7,)
                    ],
                  )
                ),
                SizedBox(height: 20,),
                Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    )
                  ),
                    child: Column(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Container(height:20,width:30,child: Image.asset("assets/gender.png")),
                                ),
                                SizedBox(height: 5,),
                                Container(width:60,padding:EdgeInsets.only(top: 5),child: Text(" $genderresult1",style: TextStyle(color: Colors.white,fontSize: 14),)),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Icon(Icons.perm_identity),
                                ),
                                SizedBox(height: 10,),
                                Container(height:30,width:70,padding:EdgeInsets.only(top: 3),child: Text("$nameresult1",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,textAlign: TextAlign.center,)),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/height.jpg"),
                                ),
                                SizedBox(height: 10,),
                                Container(width:50,child: Center(child: Text("$heightresult1",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,))),

                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/weight.jpg"),
                                ),
                                SizedBox(height: 10,),
                                Container(width:50,child: Center(child: Text("$weightresult1",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,))),

                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/bmi.png"),
                                ),
                                SizedBox(height: 10,),
                                Container(height:30,width:50,padding:EdgeInsets.only(top: 3),child: Text("$bmidoublevalue1}",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,)),

                              ],
                            ),
                          ],
                        ),



                      ],
                    ),
                  ),

                SizedBox(height: 40,),
                Container(
                  width: 200,
                  child: ElevatedButton(onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
                  }, child: Row(
                    children: [
                      Icon(Icons.home,color: Colors.blue.shade900,),
                      Text("Go Back To Home",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      backgroundColor: Colors.blue.shade100,

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 200,
                  child: ElevatedButton(onPressed: (){
                    setState(() {


                       bmibox.put("$nameresult1+$bmi",bmidata(gender: genderresult1, height: heightresult1, weight: weightresult1, age: ageresult1, name: nameresult1, bmi: bmidoublevalue1));
                    });
                       Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>bmilist()));
                  }, child: Row(
                    children: [
                      Icon(Icons.save_alt_sharp,color: Colors.blue.shade900,),
                      Text("Save your data",style: TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ),

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      backgroundColor: Colors.blue.shade100,

                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Opacity(
                  opacity: 0.25,

                  child: Container(
                    height: 79,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),),
    );
  }
}
