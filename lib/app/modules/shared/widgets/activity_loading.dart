import 'package:flutter/material.dart';

class ActivityLoading extends StatelessWidget {
  const ActivityLoading({super.key, required this.color,});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
