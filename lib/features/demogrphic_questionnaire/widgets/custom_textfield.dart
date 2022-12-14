import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final bool calander;
  final String hintText;
  const CustomTextfield(
      {super.key, required this.calander, required this.hintText});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();

  late Animation<double> scaleDownAnimation;
  late Animation<Offset> moveAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );

      scaleDownAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      );
      moveAnimation =
          Tween<Offset>(begin: const Offset(50, 50), end: Offset.zero)
              .animate(_animationController);

      _animationController.forward();

      _animationController.addListener(() {
        setState(() {});
      });

      /*_controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.forward();
      }
    });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextFormField(
        controller: _controller,
        focusNode: _focus,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: Theme.of(context).textTheme.headline2?.fontSize,
          ),
        ),
      ),
    );
  }
}
