import 'package:amazon_clone/features/account/widgets/below_app_bar_widget.dart';
import 'package:amazon_clone/features/account/widgets/orders_widget.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons_widget.dart';
import 'package:amazon_clone/themes/app_global_colors.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          const BelowAppBar(),
          const SizedBox(height: 10),
          const TopButtonWidget(),
          const SizedBox(height: 10),
          OrdersWidget()
        ],
      ),
    );
  }
}

PreferredSize customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      // BACKGROUND APPBAR
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(gradient: AppGlobalColors.appBarGradient),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LOGO
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/amazon_in.png",
              width: 120,
              height: 45,
            ),
          ),
          // ICONS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.notifications_outlined),
                ),
                Icon(Icons.search),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
