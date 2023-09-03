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
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
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
                          Column(
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
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/family.png",
                      height: MediaQuery.of(context).size.height * 0.6,
                    )
                  ],
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      AppString.birthRegs,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/nepal_logo.png",
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 50,
                    ),
                    Column(
                      children: [
                        const Text(
                          AppString.homeMinistry,
                          style: TextStyle(fontSize: 18),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            AppString.department,
                            style: TextStyle(
                                fontSize: 18, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        const Text(
                          AppString.location,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 50,
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
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("(C) Department of National Id and Civil Registration "),
                  Text("Contact \nEmail : xyz@gmail.com \nPhone : 9876543210"),
                  SizedBox(
                    height: 50,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
