import 'package:flutter/material.dart';

class IncrementIconWidget extends StatelessWidget {
  const IncrementIconWidget({
    super.key,
    required this.isUpward,
    required this.onClick,
  });

  final bool isUpward;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: const Color(0xFF808080),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          size: 25,
          isUpward ? Icons.arrow_upward : Icons.arrow_downward,
          color: Colors.white,
        ),
      ),
    );
  }
}
