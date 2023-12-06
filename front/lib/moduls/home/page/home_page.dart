import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/color_constants.dart';
import 'package:khorsand87/moduls/core/components/price_component.dart';
import 'package:khorsand87/moduls/home/components/personal_goal_indicator.dart';
import 'package:khorsand87/moduls/home/components/receive_money_container.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: ColorConstants.mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: ColorConstants.withe,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/gamer_avatar.png',
                                    ),
                                    width: 10,
                                    height: 10,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Text('سلام امیرحسن'),
                                  Image(
                                    image: AssetImage('assets/images/hands.png'),
                                    width: 25,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text('موجودی'),
                          const SizedBox(height: 5),
                          PriceComponent(price: '5000')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const PersonalGoalIndicator(),
                const SizedBox(height: 15),
                const PersonalGoalIndicator(),
                const SizedBox(height: 15),
                ListView.builder(
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ReceiveMoneyContainer(
                      dateTime: '1400/05/07',
                      description: 'مرتب کردن تخت خواب',
                      type: 'A',
                      price: '22540',
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
