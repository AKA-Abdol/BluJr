import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/home/components/receive_money_container.dart';
import 'package:khorsand87/moduls/task/components/task_container.dart';
import 'package:khorsand87/moduls/task/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const _TaskPage(),
    );
  }
}

class _TaskPage extends StatelessWidget {
  const _TaskPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('کارهای من'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: 20,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ReceiveMoneyContainer(
                      dateTime: '1400/05/07',
                      description: 'مرتب کردن تخت خواب',
                      type: 'A',
                      price: '22540',
                    ),
                  );
                  ;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
