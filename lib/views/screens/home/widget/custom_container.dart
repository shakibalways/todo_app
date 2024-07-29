import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final bool discreption;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onPressed;
  const CustomContainer({
    super.key,
    required this.title,
    this.onChanged,
    required this.discreption, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(onPressed:onPressed ,
          icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Container(
          height: 140,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(value: discreption, onChanged: onChanged),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    decoration: discreption
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          )),
    );
  }
}
