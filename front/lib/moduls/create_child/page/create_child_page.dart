import 'package:flutter/material.dart';
import 'package:khorsand87/constants/lootie_path.dart';
import 'package:khorsand87/moduls/core/components/app_button.dart';
import 'package:khorsand87/moduls/create_child/components/child_information_container.dart';
import 'package:khorsand87/moduls/create_child/provider/create_child_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CreateChildPage extends StatelessWidget {
  const CreateChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateChildProvider(context: context),
      child: const _CreateChildPage(),
    );
  }
}

class _CreateChildPage extends StatelessWidget {
  const _CreateChildPage();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreateChildProvider>();
    final staticProvider = context.read<CreateChildProvider>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('لیست فرزندان شما'),
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: (provider.isLoadingChildList)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (provider.getChildListModel == null || provider.getChildListModel!.isEmpty)
                    ? Column(
                        children: [
                          Lottie.asset(LootiePath.emptyChild),
                          AppButton(
                            isPressable: true,
                            text: 'اولین فرزندتان را اضافه کنید',
                            onTap: () => staticProvider.openAddNewChild(context),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: provider.getChildListModel!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChildInformationContainer(childItem: provider.getChildListModel![index]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: AppButton(
                                isPressable: true,
                                text: 'افزودن فرزند',
                                onTap: () => staticProvider.openAddNewChild(context),
                              ),
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
