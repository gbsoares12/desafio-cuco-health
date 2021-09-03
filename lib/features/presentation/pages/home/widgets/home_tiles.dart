import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$label:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                value,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
