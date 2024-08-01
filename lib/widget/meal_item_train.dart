import 'package:flutter/material.dart';

class ItemStrain extends StatelessWidget {
  const ItemStrain({super.key, required this.icon, required this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5,),
        Text(
        lable, 
        style:const TextStyle(
          color: Colors.white,
          fontSize: 18

        ),
        )

      ],
    );
  }
}
