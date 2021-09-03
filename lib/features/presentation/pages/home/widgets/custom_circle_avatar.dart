import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key, required this.photoUrl})
      : super(key: key);
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 150,
        width: 150,
        color: Colors.grey.shade200,
        child: Image.network(
          this.photoUrl,
          width: 150.0,
          height: 150.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
