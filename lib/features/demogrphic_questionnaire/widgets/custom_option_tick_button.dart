import 'package:flutter/material.dart';
import 'package:yoboshu_task/utils/color_constants.dart';
import 'package:yoboshu_task/utils/value_holders.dart';

class CustomOptionTickButton extends StatefulWidget {
  String buttonText;
  CustomOptionTickButton({super.key, required this.buttonText});

  @override
  State<CustomOptionTickButton> createState() => _CustomOptionTickButtonState();
}

class _CustomOptionTickButtonState extends State<CustomOptionTickButton> {
  Color optionButtonBorderColor = ColorConstants.inactiveColor;
  bool pressed = false;
  Color buttonTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: (pressed) ? Border.all(color: optionButtonBorderColor) : null,
        color: ColorConstants.inactiveColor,
      ),
      child: InkWell(
        child: GestureDetector(
          onTap: () {
            if (!pressed) {
              ValueHolders.userSexHolder = widget.buttonText;
              setState(() {
                pressed = true;
                optionButtonBorderColor = ColorConstants.activeColor;
              });
            } else {
              ValueHolders.userRisks.remove(widget.buttonText);
              setState(() {
                pressed = false;
                optionButtonBorderColor = ColorConstants.inactiveColor;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
              title: Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                ),
              ),
              tileColor: buttonTextColor,
              trailing: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: optionButtonBorderColor),
                ),
                child: Icon(
                  Icons.check,
                  color: optionButtonBorderColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
