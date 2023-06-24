import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 18 : 6,
      width: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
