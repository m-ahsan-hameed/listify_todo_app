import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/custom%20widgets/custom_text.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 16),
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            color: isLight ? Colors.grey : greenColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Doing Ui/Ux"),
                Text(
                  _truncateText(
                    "Make a website UiUx for client to make it beautiful so that client like it",
                  ),
                  style: TextStyle(
                    fontSize: 17,
                    color:
                        isLight
                            ? accentColor
                            : const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _truncateText(String text) {
    if (text.length <= 35) {
      return text;
    } else {
      return '${text.substring(0, 35)}...';
    }
  }
}
