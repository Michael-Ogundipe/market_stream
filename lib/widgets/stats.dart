import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../consts/colors.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(FontAwesomeIcons.clock, size: 16, color:grayColor ),
            SizedBox(width: 4),
            Text('24h change', style: TextStyle(fontSize: 12, color: grayColor),)

          ],
        ),
        SizedBox(height: 4),
        Text('\$520.80 +1.25%',
          style: TextStyle(fontSize: 14, color: greenColor),)
      ],
    );
  }
}
