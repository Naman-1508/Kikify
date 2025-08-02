import 'package:flutter/material.dart';
class CategoryChip extends StatelessWidget{
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDarkMode;
  const CategoryChip({
    Key?key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isDarkMode,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color selectedBackgroundColor =
        isDarkMode ? Colors.white:Colors.black;
    final Color unselectedBackgroundColor =
        isDarkMode ? Colors.grey[800]!: Colors.grey[300]!;
    final Color selectedTextColor =
        isDarkMode ? Colors.black :Colors.white;
    final Color unselectedTextColor =
        isDarkMode ? Colors.white:Colors.black;
    final Color selectedBorderColor =
        isDarkMode ? Colors.white:Colors.black;
    final Color unselectedBorderColor =
        isDarkMode ? Colors.white24:Colors.grey[400]!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 18),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: isSelected ? selectedBorderColor : unselectedBorderColor,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 14,
          color: isSelected ? selectedTextColor : unselectedTextColor,
          fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}