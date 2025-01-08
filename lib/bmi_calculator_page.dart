import 'package:bmi_calculator/widget/weight_age_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widget/bmi_result_widget.dart';

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
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: gender == 1
                              ? const Color(0xFF797979)
                              : const Color(0xFF484848),
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
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: gender == 2
                              ? const Color(0xFF797979)
                              : const Color(0xFF484848),
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

              const SizedBox(
                height: kIsWeb ? 15.0 : 10,
              ),

              // HEIGHT ROW
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFF484848),
                ),
                width: MediaQuery.of(context).size.width,
                height: kIsWeb
                    ? MediaQuery.of(context).size.height * 0.15
                    : MediaQuery.of(context).size.height * 0.13,
                child: Column(
                  children: [
                    Text(
                      "HEIGHT ${_sliderValue.toInt()} cm",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Slider(
                      value: _sliderValue,
                      onChanged: (value) {
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
                  /// WEIGHT
                  WeightAgeWidget(
                    label: "WEIGHT",
                    weightChanged: (int weight) {
                      _weight = weight;
                    },
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),

                  /// AGE
                  WeightAgeWidget(
                    label: "AGE",
                    weightChanged: (int value) {
                      _age = value;
                    },
                  ),
                ],
              ),

              const SizedBox(
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
                        color: const Color(0xFF6F6F6F),
                      ),
                      child: const Center(
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
                  const SizedBox(
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
                        color: const Color(0xFF4BB14F),
                      ),
                      child: const Center(
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

              const SizedBox(
                height: 10.0,
              ),

              // CALCULATED BMI
              BmiResultWidget(result: _result)
            ],
          ),
        ),
      ),
    );
  }
}
