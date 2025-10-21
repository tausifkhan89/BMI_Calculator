import 'package:bmi_calci/pages/second_page.dart';
import 'package:bmi_calci/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedGender;

  Color selectedColor = Colors.white;
  Color maleColor = Colors.white;
  Color femaleColor = Colors.white;

  Color maleContentColor = Colors.black;
  Color femaleContentColor = Colors.black;

  int heightSlider = 120;
  int age = 10;
  int weight = 30;
  double totalInches = 0;
  double inches = 11;
  double feet = 3;

  void calcBMI() {
    double heightInM = heightSlider / 100;
    double bmi = weight / (heightInM * heightInM);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage(bmi: bmi)),
    );
  }

  // Function to change the color of containers.
  void selectGender(bool gender) {
    if (gender) {
      setState(() {
        selectedGender = 'Male';
        maleColor = selectedBlueColor;
        femaleColor = Colors.white;
        maleContentColor = Colors.white;
        femaleContentColor = textPrimaryColor;
      });
    } else {
      setState(() {
        selectedGender = 'Female';
        femaleColor = selectedBlueColor;
        maleColor = Colors.white;
        maleContentColor = textPrimaryColor;
        femaleContentColor = Colors.white;
      });
    }
  }

  // Function to add and subtract age and weight.
  void addSubFunc(bool op, String num) {
    if (num == 'age') {
      if (op) {
        setState(() {
          age++;
        });
      } else {
        setState(() {
          if (age > 0) {
            age--;
          }
        });
      }
    } else if (num == 'weight') {
      if (op) {
        setState(() {
          weight++;
        });
      } else {
        setState(() {
          if (weight > 0) {
            weight--;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SafeArea(
        child: ListView(
          children: [
            // Gender Row
            Padding(
              padding: kContainerPadding,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectGender(true);
                      },
                      child: WhiteContainer(
                        colour: maleColor,
                        cardChild: Column(
                          children: [
                            Icon(
                              Icons.male_outlined,
                              size: 55,
                              color: maleContentColor,
                            ),
                            Text(
                              'Male',
                              style: textStyle2.copyWith(
                                color: maleContentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectGender(false);
                      },
                      child: WhiteContainer(
                        colour: femaleColor,
                        cardChild: Column(
                          children: [
                            Icon(
                              Icons.female_outlined,
                              size: 55,
                              color: femaleContentColor,
                            ),
                            Text(
                              'Female',
                              style: textStyle2.copyWith(
                                color: femaleContentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Height Slider
            Padding(
              padding: kContainerPadding,
              child: WhiteContainer(
                colour: Colors.white,
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Height', style: textStyle2),
                          Text(
                            '${feet.toInt()}" ${inches.round()}\'',
                            style: textStyle1,
                          ),
                        ],
                      ),
                      Slider(
                        min: 120,
                        max: 200,
                        value: heightSlider.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            heightSlider = value.toInt();
                            totalInches = heightSlider / 2.54;
                            feet = totalInches / 12;
                            inches = (feet % 1) * 12;
                          });
                        },
                        activeColor: Colors.blue,
                        thumbColor: Colors.blue[600],
                        inactiveColor: Colors.blue[100],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Age and Weight Buttons
            Padding(
              padding: kContainerPadding,
              child: Row(
                children: [
                  Expanded(
                    child: WhiteContainer(
                      colour: Colors.white,
                      cardChild: Column(
                        children: [
                          Text('Age', style: textStyle2),
                          Text('$age', style: textStyle1),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: Icons.remove,
                                pressed: () {
                                  addSubFunc(false, 'age');
                                },
                              ),
                              RoundButton(
                                icon: Icons.add,
                                pressed: () {
                                  addSubFunc(true, 'age');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: WhiteContainer(
                      colour: Colors.white,
                      cardChild: Column(
                        children: [
                          Text('Weight', style: textStyle2),
                          Text('$weight', style: textStyle1),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: Icons.remove,
                                pressed: () {
                                  addSubFunc(false, 'weight');
                                },
                              ),
                              RoundButton(
                                icon: Icons.add,
                                pressed: () {
                                  addSubFunc(true, 'weight');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Calculate and Reset Button
            Row(
              children: [
                // Reset Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 4,
                      bottom: 6,
                      top: 6,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          age = 10;
                          weight = 30;
                          heightSlider = 120;
                          feet = 3;
                          inches = 11;
                        });
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.red.shade400,
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        fixedSize: WidgetStatePropertyAll(Size.fromHeight(50)),
                      ),
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // Calculate Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                      right: 12,
                      bottom: 6,
                      top: 6,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedGender == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please select your gender before calculating BMI.',
                              ),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          );
                          return; // stop function execution
                        }

                        calcBMI(); // proceed only if gender is selected
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.green.shade400,
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        fixedSize: WidgetStatePropertyAll(Size.fromHeight(50)),
                      ),
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        'BMI Calculator',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
    );
  }
}

class WhiteContainer extends StatelessWidget {
  final Widget cardChild;
  final Color colour;

  const WhiteContainer({
    super.key,
    required this.cardChild,
    required this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withAlpha(10),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: cardChild),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback pressed;

  const RoundButton({super.key, required this.icon, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      constraints: BoxConstraints(minWidth: 33.0, minHeight: 33.0),
      fillColor: Colors.white,
      shape: CircleBorder(),
      elevation: 1,
      child: Icon(icon),
    );
  }
}
