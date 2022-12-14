import 'package:flutter/material.dart';
import 'package:yoboshu_task/utils/color_constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: ColorConstants.activeColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.activeShadowColor,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      child: InkWell(
        child: GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
