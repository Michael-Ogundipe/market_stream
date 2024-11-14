import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../consts/app_style.dart';
import '../../../../consts/assets.dart';
import '../../../../consts/colors.dart';

class OrderItem {
  final double price;
  final double amount;

  OrderItem({required this.price, required this.amount});
}


List<OrderItem> generateRandomOrderItems() {
  final random = Random();
  final List<OrderItem> orderItems = [];

  for (int i = 0; i < 10 / 2; i++) {
    final price = random.nextDouble() *
        0.1; // Generate a random price between 0 and 0.1
    final amount =
        random.nextInt(90) + 1; // Generate a random amount between 1 and 20
    orderItems.add(OrderItem(price: price, amount: amount.toDouble()));
  }

  return orderItems;
}

class OrderBook extends StatefulWidget {
  const OrderBook({super.key});

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                buildItem(0, Assets.orderOne),
                const SizedBox(width: 24),
                buildItem(1, Assets.orderTwo),
                const SizedBox(width: 24),
                buildItem(2, Assets.orderThree),
              ],
            ),
            Container(
              height: 32,
              width: 63,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: grayColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: DropdownButton(items: const [
                DropdownMenuItem(child: Text("10")),
              ], onChanged: (_) {}),
            )
          ],
        ),
        const SizedBox(height: 12),
        buildOrderList(generateRandomOrderItems(), Colors.red),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "36,641.20",
              style: AppStyles.black16Medium
                  .copyWith(color: greenColor),
            ),
            const SizedBox(height: 12),
            const Icon(
              Icons.arrow_upward_rounded,
              color: greenColor,
            ),
            const SizedBox(height: 12),
            Text(
              "36,641.20",
              style: AppStyles.black16Medium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        buildOrderList(generateRandomOrderItems(), Colors.green),
      ],
    );
  }

  Widget buildItem(int index, String title) {
    bool isSelected = index == selectedItemIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItemIndex = index;
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isSelected
                ? grayColor2
                : Colors.transparent,
          ),
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            title,
            height: 12,
            width: 10,
          )),
    );
  }

  Widget buildOrderList(List<OrderItem> orders, Color color,
      [bool showTitle = true]) {
    return Column(
      children: [
        showTitle
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "Price\n(USDT)",
                  textAlign: TextAlign.left,
                  style: AppStyles.black12Medium
                      .copyWith(color: grayColor),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "Amount\n(BTC)",
                  textAlign: TextAlign.left,
                  style: AppStyles.black12Medium
                      .copyWith(color: grayColor),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Total',
                  textAlign: TextAlign.left,
                  style: AppStyles.black12Medium
                      .copyWith(color: grayColor),
                ),
              ),
            ),
          ],
        )
            : const SizedBox(),
        showTitle ? const SizedBox(height: 8) : const SizedBox(),
        ListView.builder(
          itemCount: orders.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final order = orders[index];
            return Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          order.price.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          order.amount.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: whiteColor,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          (order.amount * order.price).toStringAsFixed(2),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width:
                  _calculateFlexValue(order.price, order.amount).toDouble(),
                  color: color.withOpacity(.3),
                )
              ],
            );
          },
        ),
      ],
    );
  }

  int _calculateFlexValue(double volume, double totalVolume) {
    return (volume / totalVolume * 390).toInt();
  }
}
