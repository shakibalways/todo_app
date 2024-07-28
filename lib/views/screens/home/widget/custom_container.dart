
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?)? onChanged;
  const CustomContainer({
    super.key, required this.title, required this.value, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(value: value, onChanged: onChanged),
            Text(title),
          ],
        ));
  }
}
