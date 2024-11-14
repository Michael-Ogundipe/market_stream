import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';


class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Open Orders',
          style: TextStyle(
            fontSize: 18,
            color: charcoalColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: 500,
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: grayColor,
                fontWeight: FontWeight.w500,
              )),
        )
      ],
    );
  }
}
