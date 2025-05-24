import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom%20widgets/custom_text.dart';
import 'package:todo_app/providerStates/theme_change.dart';
import 'package:todo_app/widgets/search_bar.dart';
import 'package:todo_app/widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Listify",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          SizedBox(width: 5),
          Consumer<ThemeChange>(
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  value.setTheme(value.themeMode != ThemeMode.light);
                },
                icon: Icon(
                  value.themeMode == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,

                  size: 25,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
              );
            },
          ),
          SizedBox(width: 5),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                "assets/images/user.png",
                width: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Welcome Ahsan,"),

              SizedBox(height: 20),
              CustomSearchBar(),
              SizedBox(height: 20),
              CustomText(text: "Tasks", size: 20, fontWeight: FontWeight.w600),
              SizedBox(height: 5),
              SizedBox(child: TaskList()),
            ],
          ),
        ),
      ),
    );
  }
}
