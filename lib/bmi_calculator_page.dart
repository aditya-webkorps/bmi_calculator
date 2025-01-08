import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BmiCalculatorPage extends StatefulWidget {
  const BmiCalculatorPage({super.key});

  @override
  State<BmiCalculatorPage> createState() => _BmiCalculatorPageState();
}

class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  double _sliderValue = 55;
  int gender = 1; // 1 = FEMALE, 2 = MALE
  double _result = 0.0;
  int _age = 0;
  int _weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF222222),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // GENDER ROW
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        gender = 1;

                        print(gender);

                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: gender == 1
                              ? Color(0xFF797979)
                              : Color(0xFF484848),
                        ),

                        // width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: const Center(
                          child: Text(
                            "FEMALE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        gender = 2;

                        print(gender);
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: gender == 2
                              ? Color(0xFF797979)
                              : Color(0xFF484848),
                        ),
                        // width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: const Center(
                            child: Text(
                          "MALE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: kIsWeb ?  15.0 : 10,
              ),

              // HEIGHT ROW
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF484848),
                ),
                width: MediaQuery.of(context).size.width,
                height: kIsWeb ? MediaQuery.of(context).size.height * 0.15 : MediaQuery.of(context).size.height * 0.13,
                child: Column(
                  children: [
                    Text(
                      "HEIGHT ${_sliderValue.toInt()} cm",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        print(value);
                        _sliderValue = value;

                        setState(() {});
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.red,
                      min: 55,
                      max: 251,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10.0,
              ),

              // WEIGHT AND AGE ROW
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF484848),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT $_weight",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // WEIGHT UPWARD
                            InkWell(
                              onTap: () {
                                _weight = _weight + 1;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Color(0xFF808080),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                if (_weight > 0) {
                                  _weight = _weight - 1;
                                }
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Color(0xFF808080),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF484848),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE $_age",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_age < 120) {
                                  _age = _age + 1;
                                }
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Color(0xFF808080),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                if (_age > 0) {
                                  _age = _age - 1;
                                }
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Color(0xFF808080),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),

              SizedBox(
                height: 10.0,
              ),

              // BUTTONS
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      _result = 0.0;
                      setState(() {});
                    },
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF6F6F6F),
                      ),
                      child: Center(
                        child: Text(
                          "CLEAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      double heightInMtr = _sliderValue / 100;
                      _result = _weight / (heightInMtr * heightInMtr);

                      setState(() {});
                    },
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF4BB14F),
                      ),
                      child: Center(
                        child: Text(
                          "GET BMI",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              // CALCULATED BMI
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF484848),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "YOUR BMI IS",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "${_result.toStringAsFixed(1)}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 100.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Text("Overweight", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Colors.white),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
