import 'dart:math';

import 'package:flutter/material.dart';

import 'bmi_result.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true ;
  double height = 120.0 ;
  int age = 20 ;
  int weight = 50 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true ;
                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                           Image(image: AssetImage('images/male.png'),
                           height: 90,
                           width: 90,),
                            SizedBox(height: 15,),
                            Text('MALE',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold
                            ),
                            )],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isMale? Colors.blue :Colors.grey[300]

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false ;
                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(image: AssetImage('images/female.png'),
                              height: 90,
                              width: 90,),
                            SizedBox(height: 15,),
                            Text('FEMALE',
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold
                              ),
                            )],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !isMale ?Colors.blue : Colors.grey[300]

                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),

                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    const Text('HEIGHT',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic ,
                      children: [
                        Text('${height.round()}',
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900
                        )
                        ),
                        const SizedBox(width: 8,),
                        const Text('CM',
                        style: TextStyle(
                            fontWeight: FontWeight.w900
                                ,fontSize: 20
                        ),),



                      ],

                    ),
                    Slider(value: height,
                        min:80.0,
                        max:220,
                        onChanged: (value){
                      setState(() {
                        height = value ;
                      });

                        }
                    )
                  ],

                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(



                children: [
                  Expanded(
                    child: Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text('WEIGHT',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900
                            ),),
                          Text('$weight',
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900
                              )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,


                            children: [

                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight ++ ;
                                }
                                 ) ;
                              } ,
                                heroTag: 'weight +',
                                mini: true,
                                child:const Icon(Icons.add,
                                )
                                ,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight -- ;
                                });
                              } ,
                                heroTag: 'weight -',

                                mini: true,
                                child:const Icon(Icons.remove)
                                ,),
                            ],
                          ),


                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]

                      ),

                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text('AGE',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900
                            ),),
                          Text('$age',
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900
                              )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,


                            children: [

                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age ++ ;
                                });
                              } ,
                                heroTag: 'age +',

                                mini: true,
                                child:const Icon(Icons.add,
                                )
                                ,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age -- ;
                                });
                              } ,
                                heroTag: 'age -',

                                mini: true,
                                child:const Icon(Icons.remove)
                                ,),
                            ],
                          ),


                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]

                      ),

                    ),
                  ),


                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: (){
                double result = weight / pow(height/100, 2);
                print(result.round());

                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>BMIResultScreen(
                      age: age,
                      isMale: isMale,
                      result:result.round() ,
                    )
                ));



              },
              child: const Text('CALCULATE',
            style: TextStyle(
              color: Colors.white
            ),),),
          )
        ],
      ),

    );



  }
}
