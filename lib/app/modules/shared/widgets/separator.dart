import 'package:flutter/widgets.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    this.height = 0,
    this.width = 0,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
