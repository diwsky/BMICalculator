import 'dart:ui';

import 'file:///C:/Users/diwan/AndroidStudioProjects/bmi-calculator-flutter/lib/components/add_subtract_content.dart';
import 'file:///C:/Users/diwan/AndroidStudioProjects/bmi-calculator-flutter/lib/screens/results_page.dart';
import 'file:///C:/Users/diwan/AndroidStudioProjects/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/icon_content.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, text: "MALE"),
                      color: selectedGender == Gender.MALE
                          ? kActiveBoxColor
                          : kInactiveBoxColor,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, text: "FEMALE"),
                      color: selectedGender == Gender.FEMALE
                          ? kActiveBoxColor
                          : kInactiveBoxColor,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kCustomTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kHeightTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kCustomTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kGreyColor,
                          inactiveTrackColor: kGreyColor,
                          thumbColor: kButtonColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: kButtonColor.withAlpha(0x40)),
                      child: Slider(
                          min: 120.0,
                          max: 210.0,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: kActiveBoxColor,
                      cardChild: AddSubtractContent(
                        title: "WEIGHT",
                        units: "",
                        variables: weight,
                        onSubtractPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onAddPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveBoxColor,
                      cardChild: AddSubtractContent(
                        title: "AGE",
                        units: "",
                        variables: age,
                        onSubtractPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        onAddPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: "CALCULATE",
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: calc.getBMI(),
                      status: calc.getStatusText(),
                      desc: calc.getDescText(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
