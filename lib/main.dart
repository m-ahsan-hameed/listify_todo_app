import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/providerStates/theme_change.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeChange())],
      child: Builder(
        builder: (BuildContext context) {
          final themeChange = Provider.of<ThemeChange>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChange.themeMode,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: backgroundColor,
                titleTextStyle: TextStyle(color: textColor),
                iconTheme: IconThemeData(color: primaryColor),
              ),
              primaryColor: primaryColor,
              scaffoldBackgroundColor: backgroundColor,
              inputDecorationTheme: InputDecorationTheme(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: primaryColor),
              ),
              textTheme: TextTheme(
                titleMedium: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            home: AddTaskScreen(),
          );
        },
      ),
    );
  }
}
