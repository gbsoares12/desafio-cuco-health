import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Color background;
  final double strokeWidth;

  const LoadingContainer(
      {this.background = Colors.white, this.strokeWidth = 4.0})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.background,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: this.strokeWidth,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
