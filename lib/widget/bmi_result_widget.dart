import 'package:flutter/material.dart';

class BmiResultWidget extends StatelessWidget {
  const BmiResultWidget({
    super.key,
    required double result,
  }) : _result = result;

  final double _result;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFF484848),
        ),
        child: Column(
          children: [
            const Text(
              "YOUR BMI IS",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _result.toStringAsFixed(1),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 100.0,
                      color: Colors.white),
                ),
              ),
            ),
            const Text(
              "Overweight",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
