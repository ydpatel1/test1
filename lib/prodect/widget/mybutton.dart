import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.ontap,
    this.title,
    this.child,
    this.borderRadius,
  }) : super(key: key);
  final Function ontap;
  final String? title;
  final Widget? child;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0))),
        onPressed: () {
          ontap();
        },
        child: child ??
            Text(
              title ?? '',
              style: const TextStyle(color: Colors.white),
            ));
  }
}
