import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
    required this.title,
    required this.index,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final int index;
  final VoidCallback onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected
              ? Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                )
              : Container(height: 8.0),
          SizedBox(height: 8.0),
          Text(
            this.title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white60,
              fontSize: isSelected ? 20.0 : 18.0,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
