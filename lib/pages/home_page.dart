import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timerapp/pages/numbers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int second=1,minut=0,hours=0;
  String secondStr='00',minutStr='00',hoursStr='00';
  Timer? timer;
  bool isPause=true;

  @override
  void initState() {
    startTimer();
    numVisiable();
    super.initState();
  }

  void startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
        startSecond();
    });
  }


  void numVisiable() {
    setState(() {
      secondStr=second.toString();
      if (secondStr.length==1) {
        secondStr = '0' + second.toString();
      }

      minutStr=minut.toString();
      if (minutStr.length==1) {
        minutStr='0'+minutStr;
      }

      hoursStr=hours.toString();
      if (hoursStr.length==1) {
        hoursStr='0'+hoursStr;
      }
    });
  }

  void timerCancel(){
    setState(() {
      if (hours==0 && minut==0 && second==0) {
        timer!.cancel();
      }
    });
  }

  void startSecond(){
    setState(() {
      if (second>0) {
        second--;
        secondStr=second.toString();
        numVisiable();
      } else {
        numVisiable();
        second=59;
        startMinut();
      }
      timerCancel();
    });
  }

  void startMinut(){
    setState(() {
      if (minut>0) {
        minut--;
        minutStr=minut.toString();
        numVisiable();
      } else {
        numVisiable();
        minut=60;
        startHours();
      }
      timerCancel();
    });
  }

  void startHours(){
    setState(() {
      if (hours>0) {
        hours--;
        minut=59;
        numVisiable();
        hoursStr=hours.toString();
        numVisiable();
      } else {
        numVisiable();
        hours=0;
        minut=0;
        second=0;
      }
      timerCancel();
      print('Timer Cancel');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 150),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.purple.withOpacity(.9),
                        Colors.red.withOpacity(.85),
                        Colors.yellow.withOpacity(.8),
                        Colors.green.withOpacity(.967),
                        Colors.greenAccent.withOpacity(1),
                        Colors.blue.withOpacity(.8)
                      ]
                  )
              ),
              child: Center(
                child: Text(
                  '$hoursStr:$minutStr:$secondStr',
                  style: TextStyle(fontSize: 40,color: Colors.white70),
                ),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AspectRatio(
                aspectRatio: 1.4/1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 140,
                            width: 50,
                            child: ListWheelScrollView.useDelegate(
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  hours=value;
                                  numVisiable();
                                });
                              },
                              itemExtent: 50,
                              physics: FixedExtentScrollPhysics(),
                              diameterRatio: 1.2,
                              perspective: 0.005,
                              childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 25,
                                  builder: (context,index) {
                                    return Numbers(
                                      min: index,
                                    );
                                  }
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            child: Text("H",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(width: 10,),
                          Text(':',style: TextStyle(color: Colors.white,fontSize: 33),),
                          Container(
                            height: 140,
                            width: 50,
                            child: ListWheelScrollView.useDelegate(
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  minut=value;
                                  numVisiable();
                                });
                              },
                              itemExtent: 50,
                              physics: FixedExtentScrollPhysics(),
                              diameterRatio: 1.2,
                              perspective: 0.005,
                              childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 60,
                                  builder: (context,index) {
                                    return Numbers(
                                      min: index,
                                    );
                                  }
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            child: Text("M",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(width: 10,),
                          Text(':',style: TextStyle(color: Colors.white,fontSize: 33),),
                          SizedBox(width: 10,),
                          Container(
                            height: 140,
                            width: 50,
                            child: ListWheelScrollView.useDelegate(
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  second=value;
                                  numVisiable();
                                });
                              },
                              itemExtent: 50,
                              physics: FixedExtentScrollPhysics(),
                              diameterRatio: 1.2,
                              perspective: 0.005,
                              childDelegate: ListWheelChildBuilderDelegate(
                                  childCount: 60,
                                  builder: (context,index) {
                                    return Numbers(
                                      min: index,
                                    );
                                  }
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            child: Text("S",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isPause=!isPause;
                                  if (isPause){
                                    timer!.cancel();
                                    print('Timer Pause');
                                  } else {
                                    startTimer();
                                    print('Timer Start');
                                  }
                                });
                              },
                              icon: isPause? Icon(Icons.play_arrow,color: Colors.white,size: 50,):Icon(Icons.pause,color: Colors.white,size: 50,)
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                second=0;
                                minut=0;
                                hours=0;
                                numVisiable();
                                isPause=!isPause;
                                print("Timer Clear and Timer Cancel");
                              });
                            },
                            icon: Icon(Icons.clear_all_outlined,color: Colors.white,size: 50,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
