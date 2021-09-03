import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key, required this.photoUrl})
      : super(key: key);
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        constraints: BoxConstraints(
            minHeight: 80, minWidth: 80, maxHeight: 150, maxWidth: 150),
        color: Colors.grey.shade200,
        child: Image.network(
          this.photoUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
