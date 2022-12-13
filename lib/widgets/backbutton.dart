import 'package:flutter/material.dart';

class backbutton extends StatelessWidget {
  const backbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.keyboard_arrow_left_outlined,
        color: Colors.black,
      ),
      label: const Text(
        'Back',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
