import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
    required this.items,
  }) : super(key: key);
  final num items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        // ignore: prefer_const_constructors
        children: [
          Text('$items Products Found'),
          const Spacer(),
          const Icon(CupertinoIcons.arrow_up_arrow_down),
          const SizedBox(
            width: 20,
          ),
          const Icon(Icons.dehaze_outlined)
        ],
      ),
    );
  }
}
