import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/components/app_button.dart';
import 'package:khorsand87/moduls/core/components/app_text_field.dart';
import 'package:khorsand87/moduls/lone/components/refund_description_container.dart';
import 'package:khorsand87/moduls/lone/components/refund_time_container.dart';
import 'package:khorsand87/moduls/lone/provider/lone_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LonePage extends StatelessWidget {
  const LonePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoneProvider(context: context),
      child: const _LonePage(),
    );
  }
}

class _LonePage extends StatelessWidget {
  const _LonePage();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoneProvider>();
    final staticProvider = context.read<LoneProvider>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('درخواست وام'),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        value: provider.value,
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          staticProvider.onChangeValue(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('انتخاب بازه زمانی'),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RefundTimeContainer(
                                  refundTime: '2',
                                  onTap: () {},
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: RefundDescriptionContainer(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AppTextField(labelText: 'توضیحات درخواست وام'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AppButton(
                    isPressable: true,
                    text: 'درخواست وام',
                    onTap: () => staticProvider.goToLoneDetailPage(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
