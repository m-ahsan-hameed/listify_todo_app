import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/custom widgets/custom_text.dart';
import 'package:todo_app/data/category_data.dart'; // Ensure this path is valid

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool _showTextField = false;

  final TextEditingController addSubTaskController = TextEditingController();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDetailsController = TextEditingController();
  final TextEditingController taskCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task title input
                TextField(
                  controller: taskTitleController,
                  style: const TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Arial',
                  ),
                  decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(fontSize: 40, fontFamily: 'Roboto'),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  cursorHeight: 40,
                ),

                const SizedBox(height: 8),

                // Timestamp
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: CustomText(
                    text: "${DateTime.now().hour}:${DateTime.now().minute}",
                    size: 20,
                  ),
                ),

                const SizedBox(height: 10),

                // Divider line
                Container(
                  width: double.infinity,
                  height: 0.4,
                  color: const Color.fromARGB(255, 4, 4, 4),
                ),
                const SizedBox(height: 20),
                // Task Details Field
                _taskDetails(),
                const SizedBox(height: 20),
                _category(),

                const SizedBox(height: 20),

                // Subtask Input
                _addsubtask(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _category() {
    return GridView.builder(
      itemCount: cateData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(3),

            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: CustomText(text: cateData[i].name, size: 16)),
          ),
        );
      },
    );
  }

  Widget _taskDetails() {
    return TextField(
      controller: taskDetailsController,
      maxLines: null, // Enables vertical growth
      style: const TextStyle(fontSize: 25),
      decoration: const InputDecoration(
        hintText: "Task Details",
        hintStyle: TextStyle(fontSize: 25),
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _addsubtask() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_showTextField)
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: addSubTaskController,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    border: OutlineInputBorder(),
                    hintText: 'Subtask',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _showTextField = false;
                  addSubTaskController.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.check),
              ),
            ],
          )
        else
          TextButton(
            onPressed: () {
              setState(() {
                _showTextField = true;
              });
            },
            child: const Text(
              "Add SubTask",
              style: TextStyle(fontSize: 20, color: primaryColor),
            ),
          ),
      ],
    );
  }
}
