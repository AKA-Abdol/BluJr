import 'package:flutter/material.dart';
import 'package:khorsand87/moduls/create_child/model/get_child_list_model.dart';

class ChildInformationContainer extends StatelessWidget {
  const ChildInformationContainer({super.key, required this.childItem});
  final GetChildListModel childItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 4,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'نام و نام خانوادگی : ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '${childItem.firstName} ${childItem.lastName}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'شماره کارت : ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                childItem.card.cardNo,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'cvv2 : ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                childItem.card.cvv2.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
