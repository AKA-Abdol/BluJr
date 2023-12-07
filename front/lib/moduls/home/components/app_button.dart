import 'package:flutter/material.dart';
import 'package:khorsand87/constants/color_constants.dart';

class AppButton extends StatelessWidget {
  final bool isPressable;
  final double minWidth;
  final double height;
  final String text;
  final void Function()? onTap;
  final bool isLoading;
  final Color? enableColorButton;
  final Color? disableColorButton;

  const AppButton({
    Key? key,
    required this.isPressable,
    this.minWidth = 88,
    this.height = 45,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.enableColorButton,
    this.disableColorButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          isPressable ? ColorConstants.primary : ColorConstants.mainColor,
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(minWidth, height),
        ),
        // maximumSize: MaterialStatePropertyAll(
        //   Size(double.maxFinite, height),
        // ),
      ),
      onPressed: isPressable ? onTap : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }
}
