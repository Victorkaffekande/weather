import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  const Glass({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration:
      BoxDecoration(color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2,color: Colors.white30)),
    );
  }
}
