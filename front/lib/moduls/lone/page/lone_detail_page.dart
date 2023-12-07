import 'package:flutter/material.dart';
import 'package:khorsand87/constants/color_constants.dart';
import 'package:khorsand87/constants/lootie_path.dart';
import 'package:khorsand87/moduls/lone/provider/lone_detail_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoneDetailPage extends StatelessWidget {
  const LoneDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoneDetailProvider(context: context),
      child: const _LoneDetailPage(),
    );
  }
}

class _LoneDetailPage extends StatelessWidget {
  const _LoneDetailPage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('جزییات درخواست وام'),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Lottie.asset(LootiePath.success, width: 250),
                const SizedBox(height: 20),
                Text(
                  'درخواست وام با موفقیت انجام شد',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: ColorConstants.primary)),
                    child: Text('درخواست وام شما به والد ارسال شد و والد پس از برسی نتیجه را ثبت خواهد کرد'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
