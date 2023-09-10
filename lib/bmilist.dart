import 'package:bmi_app/bmibox.dart';
import 'package:bmi_app/bmidata.dart';
import 'package:bmi_app/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class bmilist extends StatefulWidget {
  bmilist({Key? key}) : super(key: key);

  @override
  State<bmilist> createState() => _bmilistState();
}

class _bmilistState extends State<bmilist> {
 late List<bmidata> savedbmi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Your Saved BMI",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                   backgroundColor: Colors.blue.shade900,
      ),
        body: bmibox.length==0?Center(child: Text("You have not saved any data",style: TextStyle(fontSize: 32,color: Colors.blue.shade200,fontWeight: FontWeight.bold),),):ValueListenableBuilder<Box<bmidata>>(valueListenable: bmibox.listenable(), builder: (context,bmibox,_){
         savedbmi = bmibox.values.toList().cast<bmidata>();
          return ListView.builder(itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.blue.shade900,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade100,
                spreadRadius: 2,
                  blurRadius: 2,

                ),

              ],
               border: Border.all(color: Colors.black,width: 2),

              ),
              child: Column(
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
                            child: Image.asset("assets/gender.png"),
                          ),
                          SizedBox(height: 10,),
                          Container(width:50,child: Text(" ${savedbmi[index].gender}",style: TextStyle(color: Colors.white,fontSize: 14),)),
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
                          Container(height:30,width:70,padding:EdgeInsets.only(top: 3),child: Text("${savedbmi[index].name}",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,textAlign: TextAlign.center,)),
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
                          Container(width:50,child: Center(child: Text("${savedbmi[index].height}",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,))),

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
                          Container(width:50,child: Center(child: Text("${savedbmi[index].weight}",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,))),

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
                          Container(height:30,width:50,padding:EdgeInsets.only(top: 5),child: Text("${savedbmi[index].bmi}",style: TextStyle(color: Colors.white,fontSize: 18,),overflow: TextOverflow.fade,)),

                        ],
                      ),
                      SizedBox(height: 40,width: 9,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            bmibox.deleteAt(index);
                          });

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 60),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                            ),
                            child:  Icon(Icons.delete)),
                      ),
                    ],
                  ),



                ],
              ),
            );
          },itemCount: bmibox.length,);
        })

    ));
  }
}
