import 'package:birthregistration/core/common/custom_button.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:birthregistration/features/homepage/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        height: 90,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/nepal_logo.png",
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 50,
                    ),
                    size > 600
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                AppString.homeMinistry,
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                AppString.department,
                                style: TextStyle(fontSize: 18),
                              ),
                              const Text(
                                AppString.location,
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                AppString.welcome,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              CustomButton(
                                title: AppString.event,
                                color: Colors.deepPurpleAccent,
                                ontap: () {
                                  context.pushNamed(RouteConstant.loginScreen);
                                },
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                AppString.homeMinistry,
                                style: TextStyle(fontSize: 12),
                              ),
                              const Text(
                                AppString.department,
                                style: TextStyle(fontSize: 12),
                              ),
                              const Text(
                                AppString.location,
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                AppString.welcome,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              CustomButton(
                                title: AppString.event,
                                color: Colors.deepPurpleAccent,
                                ontap: () {
                                  context.pushNamed(RouteConstant.loginScreen);
                                },
                              )
                            ],
                          )
                  ],
                ),
              ),
              Image.asset(
                "assets/images/family.png",
                height: MediaQuery.of(context).size.height * 0.6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
