import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/custom%20widgets/custom_text.dart';
import 'package:todo_app/providerStates/tasks.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    final tasksProvider = Provider.of<Tasks>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: tasksProvider.getTasks.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 8),
          width: 200,
          height: 80,
          decoration: BoxDecoration(
            color:
                isLight
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(115, 52, 52, 52),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: greenColor,
                    ),
                    child: Icon(Icons.check),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: tasksProvider.getTasks[index].taskName),
                    Text(
                      _truncateText(
                        tasksProvider.getTasks[index].details.toString(),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        color:
                            isLight
                                ? Colors.grey
                                : const Color.fromARGB(
                                  255,
                                  211,
                                  211,
                                  211,
                                ).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _truncateText(String text) {
    if (text.length <= 30) {
      return text;
    } else {
      return '${text.substring(0, 35)}...';
    }
  }
}
