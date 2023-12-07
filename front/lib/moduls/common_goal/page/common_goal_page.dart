import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/common_goal/components/common_goal_card.dart';
import 'package:khorsand87/moduls/common_goal/provider/common_goal_detail_provider.dart';
import 'package:provider/provider.dart';

class CommonGoalPage extends StatelessWidget {
  const CommonGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommonGoalDetailProvider(context: context),
      child: const _CommonGoalPage(),
    );
  }
}

class _CommonGoalPage extends StatelessWidget {
  const _CommonGoalPage();

  @override
  Widget build(BuildContext context) {
    final staticProvider = context.read<CommonGoalDetailProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('اهداف جمعی'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    padding: EdgeInsets.all(8),
                    physics: const ScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CommonGoalCard(
                              onTap: () => staticProvider.goToGoalDetailPage(),
                              goalPrice: '25000000',
                              goalTitle: 'خرید ps5',
                              startDate: '1403/010/09',
                            ),
                            const SizedBox(height: 8),
                            CommonGoalCard(
                              onTap: () => staticProvider.goToGoalDetailPage(),
                              goalPrice: '450000',
                              goalTitle: 'رفتن به شهر بازی',
                              startDate: '1403/05/21',
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
