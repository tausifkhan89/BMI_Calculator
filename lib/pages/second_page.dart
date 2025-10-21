import 'package:bmi_calci/utils/constants.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final double bmi;

  const SecondPage({super.key, required this.bmi});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String size = '';
  String category = '';

  Color getBmiColor(double bmi) {
    if (bmi < 18.5) {
      setState(() {
        size = 'underweight';
        category = 'Underweight';
      });
      return Colors.blue;
    } else if (bmi < 25) {
      size = 'normal';
      category = 'Normal';
      return Colors.green;
    } else if (bmi < 30) {
      size = 'overweight';
      category = 'Overweight';
      return Colors.yellow;
    } else if (bmi < 35) {
      size = 'obese';
      category = 'Obese';
      return Colors.orange;
    } else {
      size = 'extreme';
      category = 'Extreme';
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Result', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      'Your BMI is ',
                      style: textStyle1.copyWith(fontSize: 24),
                    ),
                    Text(
                      widget.bmi.toStringAsFixed(1),
                      style: textStyle1.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: getBmiColor(widget.bmi),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Your are ', style: textStyle1),
                        Text(
                          category,
                          style: textStyle1.copyWith(
                            fontWeight: FontWeight.w600,
                            color: getBmiColor(widget.bmi),
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 350,
                child: Image.asset('images/$size.png'),
              ),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Colors.orange[300]),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  fixedSize: WidgetStatePropertyAll(Size.fromHeight(50)),
                ),
                child: Text(
                  'Back to Home Screen',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
