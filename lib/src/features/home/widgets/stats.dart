import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
    required this.icon,
    required this.price,
  });

  final IconData icon;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: grayColor),
            const SizedBox(width: 4),
            const Text(
              '24h change',
              style: TextStyle(fontSize: 12, color: grayColor),
            )
          ],
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(fontSize: 14, color: greenColor),
        )
      ],
    );
  }
}
