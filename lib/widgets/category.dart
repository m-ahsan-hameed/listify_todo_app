import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/custom%20widgets/custom_text.dart';
import 'package:todo_app/data/category_data.dart';
import 'package:todo_app/models/category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    // bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Category")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: cateData.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, i) {
            if (i == 0) {
              return GestureDetector(
                onTap: () {
                  _addCategoryDialog(context);
                },
                child: Card(
                  color: Color(0xff122449),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 40),
                        SizedBox(height: 5),
                        CustomText(text: "Add Category", size: 18),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              final CategoryModel category = cateData[i - 1];
              return GestureDetector(
                child: Card(
                  color: Color(0xff122449),
                  child: Center(
                    child: CustomText(text: category.name, size: 20),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _addCategoryDialog(BuildContext context) {
    final TextEditingController categoryController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: categoryController,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,

                      decoration: InputDecoration(
                        hintText: "Add new Category",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(child: Icon(Icons.close)),
                ),
              ),

              Positioned(
                right: 20,
                bottom: 20,
                child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      cateData.add(
                        CategoryModel(name: categoryController.text.trim()),
                      );

                      Navigator.of(context).pop();
                      setState(() {});
                    },

                    child: Row(
                      children: [
                        Icon(Icons.check, size: 30),
                        SizedBox(width: 5),
                        CustomText(text: "Add Category", size: 17),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
