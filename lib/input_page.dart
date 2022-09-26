import 'package:bmi/calc_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconcontent.dart';
import 'reusablecard.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';

enum Gender { male, female }

const boxcolor = Color(0xFF1E1D33);
const bottomcontainercolor = Color(0xFFEB1555);
const inactivecolor = Color(0xFF111328);
Color malecolor = boxcolor;
Color femalecolor = boxcolor;
int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void updatecolor(Gender gender) {
    gender == Gender.male ? malecolor = inactivecolor : malecolor = boxcolor;
    gender == Gender.male
        ? femalecolor = boxcolor
        : femalecolor = inactivecolor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: boxcolor,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // print("male button pressed");
                    setState(() {
                      updatecolor(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: malecolor,
                    cardChild: IconContent(
                      iconicon: const Icon(FontAwesomeIcons.mars, size: 80),
                      icontext: "MALE",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(Gender.female);
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      iconicon: const Icon(FontAwesomeIcons.venus, size: 80),
                      icontext: "FEMALE",
                    ),
                    colour: femalecolor,
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: bottomcontainercolor,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        // activeColor: Colors.white,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ],
              ),
              colour: boxcolor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: boxcolor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: boxcolor,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  new CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Result(
                          bmi: calc.Getbmi(),
                          result: calc.GetResult(),
                          interpretation: calc.GetInterpretation(),
                        )),
                  ));
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              padding: EdgeInsets.only(bottom: 20.0),
              margin: const EdgeInsets.only(top: 10),
              color: bottomcontainercolor,
              width: double.infinity,
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
