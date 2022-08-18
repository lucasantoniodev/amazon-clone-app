import 'package:amazon_clone/features/account/widgets/account_button_widget.dart';
import 'package:flutter/material.dart';

class TopButtonWidget extends StatefulWidget {
  const TopButtonWidget({Key? key}) : super(key: key);

  @override
  State<TopButtonWidget> createState() => _TopButtonWidgetState();
}

class _TopButtonWidgetState extends State<TopButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            AccountButtonWidget(text: "Your Orders", onTap: () {}),
            AccountButtonWidget(text: "Turn Seller", onTap: () {}),
          ],
        ),
        Row(
          children: [
            AccountButtonWidget(text: "Log Out", onTap: () {}),
            AccountButtonWidget(text: "Your Wish List", onTap: () {}),
          ],
        ),
      ],
    );
  }
}
