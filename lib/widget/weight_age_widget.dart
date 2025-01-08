import 'package:flutter/material.dart';

import 'increment_icon_widget.dart';

class WeightAgeWidget extends StatefulWidget {
  const WeightAgeWidget({
    super.key,
    required this.weightChanged,
    required this.label,
  });

  final Function(int weight) weightChanged;
  final String label;

  @override
  State<WeightAgeWidget> createState() => _WeightAgeWidgetState();
}

class _WeightAgeWidgetState extends State<WeightAgeWidget> {
  int _weight = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF484848),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.label} $_weight",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // WEIGHT UPWARD
              IncrementIconWidget(
                isUpward: true,
                onClick: () {
                  _weight = _weight + 1;
                  setState(() {});
                  widget.weightChanged(_weight);
                },
              ),

              const SizedBox(
                width: 10.0,
              ),

              IncrementIconWidget(
                isUpward: false,
                onClick: () {
                  if (_weight > 0) {
                    _weight = _weight - 1;
                  }
                  setState(() {});
                  widget.weightChanged(_weight);
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
