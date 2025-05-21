import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/custom%20widgets/custom_text.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 170, // Width for each card item
          margin: const EdgeInsets.only(right: 16), // Space between items
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2 Tasks",
                  style: TextStyle(
                    color: isLight ? textColor : Colors.white,
                    fontSize: 15,
                  ),
                ),
                CustomText(text: "Business", size: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
