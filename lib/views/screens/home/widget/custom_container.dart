import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final bool discreption;
  final Function(bool?)? onChanged;
  const CustomContainer({
    super.key,
    required this.title,
    this.onChanged,
    required this.discreption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(value: discreption, onChanged: onChanged),
            Text(title),
          ],
        ));
  }
}
