import 'package:birthregistration/core/common/custom_button.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/extension/date_time.dart';
import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.height});
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final String dateTime = DateTime.now().toWeekDayMonthWithTime();
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/nepal_logo.png",
                  height: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.navHeading1,
                    ),
                    Text(
                      AppString.navHeading2,
                    )
                  ],
                ),
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  AppString.birthRegs,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                Text(
                  dateTime,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  AppString.welcome,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomButton(
                    title: "Login as Admin",
                    color: Colors.green,
                    ontap: () {
                      context.pushNamed(RouteConstant.loginScreen);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
