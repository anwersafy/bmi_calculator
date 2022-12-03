import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  int result ;
  bool isMale ;
  int age ;
  BMIResultScreen({
    required this.age ,
    required this.isMale,
    required this.result,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI result'
        ),
      ),
      body: Center(

        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.blue
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Gander : ${isMale ? 'Male ' : 'Female'}',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w900
              ),),
              Text('Age : $age',
              style: const TextStyle(
                  color: Colors.white,

                  fontSize: 30,
                fontWeight: FontWeight.w900
              ),),
              Text(' BMI result : $result',
              style: const TextStyle(
                fontSize: 30,
                  color: Colors.white,

                  fontWeight: FontWeight.w900
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
