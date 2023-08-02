import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  final void Function() ontap;
  const IconContainer({
    required this.color,
    required this.icon,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(80),
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 40,
        width: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
