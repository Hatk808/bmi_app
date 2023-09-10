import 'package:bmi_app/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';


class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController name = TextEditingController();
  TextEditingController wnum = TextEditingController();
  TextEditingController anum = TextEditingController();
  double weight = 0;
  int age=0;
  int indi=0;
  double hmin=1.0;
   double hupvalue =0;
  double hmax=9.0;
  double hvalue=0.0;
  double hinterval = 0.1;
  String gender = "male";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Center(child: Text("BMI Scale", style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
          SizedBox(height: 50,),
          Padding(padding: EdgeInsets.only(left: 8.0),
              child: Text("Birth Gender", style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ToggleSwitch(
              minWidth: 140.0,
              minHeight: 50.0,
              fontSize: 16.0,
              activeBgColor: [Colors.blue.shade900],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.black,
              initialLabelIndex: 0,
              customIcons: [
                Icon(Icons.male),
                Icon(Icons.female),
                Icon(Icons.person)
              ],
              borderColor: [Colors.black],
              totalSwitches: 3,
              labels: ['Male', 'Female', 'Others'],
              onToggle: (index) {
                switch (index) {
                  case 0:
                    gender = "Male";
                    break;
                  case 1:
                    gender = "Female";
                    break;
                  case 2:
                    gender = "Others";
                    break;
                }
              },
            ),
          ),
          SizedBox(height: 30,),


          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Name", style: TextStyle(color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),),
              ),
              SizedBox(width: 20,),
              Container(
                height: 50,
                width: 260,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "Enter your Name",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: const BorderSide(
                            color: Colors.black, width: 1.0),
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Height", style: TextStyle(color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),),
              ),
              SizedBox(width: 100,),
              ToggleSwitch(
                minWidth: 90.0,
                minHeight: 30.0,
                fontSize: 12.0,
                activeBgColor: [Colors.blue.shade900],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.black,
                initialLabelIndex: 0,
                customIcons: [
                  Icon(Icons.height),
                  Icon(Icons.electric_meter_rounded)
                ],
                borderColor: [Colors.black],
                totalSwitches: 2,
                labels: ['Feets', 'Meters'],
                onToggle: (index) {
                  if (index == 1) {
                    hmin = 0.0;
                    hmax = 3.0;
                    hinterval = 0.1;
                    indi=1;
                  }
                  if(index==0){
                    hmin=1.0;
                  hmax=9.0;
                  hinterval=0.5;
                  indi=0;
                  }

                },
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.0, top: 15.0),
            child: SfSliderTheme(
              data: SfSliderThemeData(
                activeTickColor: Colors.blue,
                inactiveTickColor: Colors.black,
                thumbColor: Colors.blue.shade900,
                thumbRadius: 10,
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                height: 54,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  )
                ),
                child: SfSlider(


                 thumbShape: _SfThumbShape(),
                  min: hmin,

                  max: hmax,
                  interval: 1,
                  thumbIcon: Icon(Icons.arrow_drop_down_outlined),
                  value: hvalue,
                  showLabels: true,
                  showDividers: true,
                  showTicks: true,
                  tickShape: SfTickShape(

                  ),
                  dividerShape: SfDividerShape(),

                  shouldAlwaysShowTooltip: true,
                  tooltipShape: const SfRectangularTooltipShape(),

                  onChanged: (value) {

                    setState(() {
                      hvalue = value;
                    });
                  }



                ),
              ),
            ),

          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 70.0),child: Text("Weight",style: TextStyle(color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),),),
              SizedBox(width: 100,),
              Padding(padding: EdgeInsets.only(left: 8.0),child: Text("Age",style: TextStyle(color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),),),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 50,),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [

                    Container(
                      height: 40,
                      width: 70,
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24,),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0)
                        ),

                        keyboardType: TextInputType.number,
                        controller: wnum,
                        onChanged: (wnum){
                          weight=double.parse(wnum.toString());
                        },
                      ),
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            weight++;
                            setState(() {
                              wnum.text="$weight";
                            });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Center(child: Icon(Icons.add)),
                          ),
                        ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: (){
                            weight--;
                            setState(() {
                              wnum.text="$weight";
                            });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Center(child: Icon(Icons.remove)),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 50,),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [

                    Container(
                      height: 40,
                      width: 70,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24,),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0)
                        ),
                        controller: anum,
                        onChanged: (anum){
                          age=int.parse(anum.toString());
                        },
                      ),
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                           age++;
                           setState(() {
                             anum.text="$age";
                           });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Center(child: Icon(Icons.add)),
                          ),
                        ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: (){
                            age--;
                            anum.text="$age";
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Center(child: Icon(Icons.remove)),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 29,),
          Center(child: Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(35),topLeft: Radius.circular(35),),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 2,
                    blurRadius: 1,
                  )
                ]
              ),
            padding: EdgeInsets.only(top: 80),
            child: Center(child: Text("Calculate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),)),
            ),
          )
        ],
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50,),
        child: FloatingActionButton(

          onPressed: (){

            if(indi==0){
              hupvalue=0.30*hvalue;
            }
            if(indi==1){
              hupvalue=hvalue;
            }
            double bmivalue=  weight/(hupvalue*hupvalue);
            String bmit = "";
            String bmistringvalue = "$bmivalue";
            if(bmivalue<18.5) {
              bmit =
              "You are UNDERWEIGHT as per your BMI.\n You shoud try to gain healthy weight ";
            }
            if(bmivalue>=18.5 && bmivalue<=24.9){
               bmit="You are NORMAL as per your BMI.\n You should try to maintain this weight and also do basic cardio exercises like running";

            }
            if(bmivalue>=25 && bmivalue<=29.9) {
              bmit="You are OVERWEIGHT as per your BMI.\n You should try to loose some weight and do healthy exercises like cardio exercises";
            }

            if(bmivalue>=30 ){
               bmit="You are OBESE as per your BMI.\n You should join weight loss program and try to eat in calorie deficit and be discliplined to loose weight";
            }

            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> resultbmi(ageresult: age,weightresult: weight,nameresult:name.text.toString(),heightresult: hvalue,genderesult: gender,ind: indi,bmiresult: bmistringvalue,bmidoublevalue: bmivalue,bmitex: bmit,)));
          },
          child: Icon(Icons.arrow_forward,color: Colors.white,),
          backgroundColor: Colors.blue.shade900,

        ),
      ),
    );
  }
}

class _SfThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
        required RenderBox? child,
        required SfSliderThemeData themeData,
        SfRangeValues? currentValues,
        dynamic currentValue,
        required Paint? paint,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required SfThumb? thumb}) {
    final Path path = Path();

    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx + 10, center.dy - 15);
    path.lineTo(center.dx - 10, center.dy - 15);
    path.close();
    context.canvas.drawPath(
        path,
        Paint()
          ..color = themeData.activeTrackColor!
          ..style = PaintingStyle.fill
          ..strokeWidth = 2);
  }
}



