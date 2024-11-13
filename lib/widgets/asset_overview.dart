import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:market_stream/widgets/stats.dart';

import '../consts/colors.dart';

class AssetOverview extends StatelessWidget {
  const AssetOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: whiteColor,
      child:  Column(
        children: [
          const Row(
            children: [
              Text('BTC/USDT',
                  style: TextStyle(fontSize: 18, color: charcoalColor)),
              SizedBox(width: 16),
              Text(
                '\$20,634',
                style: TextStyle(fontSize: 18, color: greenColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          carousel.CarouselSlider.builder(

            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) {

              return const Stats();

            }, options: carousel.CarouselOptions(
            viewportFraction: 0.4,
          aspectRatio: 8,
            autoPlay: true,
          ),


          ),
          // Row(
          //   children: [
          //     Stats(),
          //     SizedBox(
          //       height: 48,
          //       child: VerticalDivider(color: grayColor.withOpacity(0.3)),
          //     ),
          //     SizedBox(width: 16),
          //     Stats(),
          //     SizedBox(
          //       height: 48,
          //       child: VerticalDivider(color: grayColor.withOpacity(0.3)),
          //     ),
          //     SizedBox(width: 16),
          //   ],
          // ),
        ],
      ),
    );
  }
}
