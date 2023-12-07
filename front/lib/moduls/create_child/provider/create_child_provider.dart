import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/core/components/app_button.dart';
import 'package:khorsand87/moduls/core/components/app_text_field.dart';
import 'package:khorsand87/moduls/create_child/api/create_child_api.dart';
import 'package:khorsand87/moduls/create_child/api/get_child_list_api.dart';
import 'package:khorsand87/moduls/create_child/model/create_child_model.dart';
import 'package:khorsand87/moduls/create_child/model/get_child_list_model.dart';
import 'package:vrouter/vrouter.dart';

class CreateChildProvider extends ChangeNotifier {
  final BuildContext context;
  final CreateChildApi creatChildApi = CreateChildApiImp();
  final GetChildListApi getChildListApi = GetChildListApiImp();
  CreateChildResponseModel? createChildModel;
  List<GetChildListModel>? getChildListModel;
  bool isLoadingCreateChild = false;
  bool isLoadingChildList = false;
  final childFirstNameController = TextEditingController();
  final childLastNameController = TextEditingController();
  final initialValueController = TextEditingController();
  final weeklyPriceController = TextEditingController();

  CreateChildProvider({required this.context}) {
    initialChildList();
  }

  Future<void> initialChildList() async {
    isLoadingChildList = true;
    try {
      getChildListModel = await getChildListApi.getChildList();
    } catch (e) {
      // Handle other types of exceptions
      print('Exception during createChild: $e');
    } finally {
      // Ensure that isLoadingCreateChild is set to false
      isLoadingChildList = false;
      notifyListeners(); // Ns
    }
  }

  Future<void> createChild() async {
    print(childFirstNameController.text);
    print(initialValueController.text);
    try {
      isLoadingCreateChild = true;
      notifyListeners();
      // Make the API call
      createChildModel = await creatChildApi.createChild(
        childFirstName: childFirstNameController.text,
        childLastName: childLastNameController.text,
        initialWallet: initialValueController.text,
        weekly: weeklyPriceController.text,
      );
      initialChildList();
      childFirstNameController.clear();
      childLastNameController.clear();
      initialValueController.clear();
      initialValueController.clear();
      weeklyPriceController.clear();
      context.vRouter.pop();

      // Assuming you have a check for API error here
    } catch (e) {
      // Handle other types of exceptions
      print('Exception during createChild: $e');
    } finally {
      // Ensure that isLoadingCreateChild is set to false
      isLoadingCreateChild = false;
      notifyListeners(); // Notify listeners about the change in loading state
    }
  }

  void openAddNewChild(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            AppTextField(
              labelText: 'نام فرزند',
              textController: childFirstNameController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              labelText: 'نام خانوادگی فرزند',
              textController: childLastNameController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              inputType: TextInputType.number,
              labelText: 'شارژ اولیه',
              textController: initialValueController,
            ),
            const SizedBox(height: 20),
            AppTextField(
              inputType: TextInputType.number,
              labelText: 'مقدار پول تو جیبی هفتگی',
              textController: weeklyPriceController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AppButton(
                  isPressable: true,
                  text: 'افزودن',
                  onTap: () => createChild(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
