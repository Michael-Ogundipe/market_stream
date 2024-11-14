import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../consts/app_style.dart';
import '../../../../consts/assets.dart';
import '../../../../consts/colors.dart';
import '../home_provider.dart';
import 'stats.dart';

class AssetOverview extends ConsumerWidget {
  const AssetOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usecase = ref.watch(homeProvider);
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: whiteColor,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(Assets.crypto, width: 44, height: 24),
              const SizedBox(width: 8),
              DropdownButton<String>(
                underline: const SizedBox(),
                icon: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: charcoalColor,
                    )),
                value: usecase.dropdownValue,
                onChanged: (String? newValue) {
                  usecase.selectNewDropdownValue(newValue ?? "");
                },
                items: usecase.dropDownList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: AppStyles.black18Medium),
                  );
                }).toList(),
              ),
              const SizedBox(width: 16),
              Text(
                '\$20,634',
                style: AppStyles.black18Medium.copyWith(color: greenColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 48,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                const Stats(
                  icon: FontAwesomeIcons.clock,
                  price: '\$520.80 +1.25%',
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 48,
                  child: VerticalDivider(color: grayColor.withOpacity(0.3)),
                ),
                const SizedBox(width: 12),
                const Stats(
                  icon: FontAwesomeIcons.arrowUp,
                  price: '\$520.80 +1.25%',
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 48,
                  child: VerticalDivider(color: grayColor.withOpacity(0.3)),
                ),
                const SizedBox(width: 12),
                const Stats(
                  icon: FontAwesomeIcons.arrowDown,
                  price: '\$520.80 +1.25%',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
