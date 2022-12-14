import 'package:flutter/material.dart';
import 'package:yoboshu_task/utils/color_constants.dart';
import 'package:yoboshu_task/utils/value_holders.dart';

class CustomOptionButton extends StatefulWidget {
  String buttonText;
  CustomOptionButton({super.key, required this.buttonText});

  @override
  State<CustomOptionButton> createState() => _CustomOptionButtonState();
}

class _CustomOptionButtonState extends State<CustomOptionButton> {
  Color optionButtonColor = ColorConstants.inactiveColor;
  bool pressed = false;
  Color buttonTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: optionButtonColor,
      ),
      child: InkWell(
        child: GestureDetector(
          onTap: () {
            if (!pressed) {
              ValueHolders.userSexHolder = widget.buttonText;
              setState(() {
                pressed = true;
                optionButtonColor = ColorConstants.activeColor;
                buttonTextColor = Colors.black;
              });
            } else {
              ValueHolders.userSexHolder = null;
              setState(() {
                pressed = false;
                optionButtonColor = ColorConstants.inactiveColor;
                buttonTextColor = Colors.white;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                color: buttonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
