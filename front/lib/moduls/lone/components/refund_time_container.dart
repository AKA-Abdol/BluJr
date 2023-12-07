import 'package:flutter/material.dart';

class RefundTimeContainer extends StatelessWidget {
  const RefundTimeContainer({super.key, required this.refundTime, required this.onTap});
  final String refundTime;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.black)),
        child: Text(refundTime),
      ),
    );
  }
}
