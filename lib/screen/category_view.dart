import 'dart:developer';

import 'package:coding_test_ghufran/models/books_model.dart';
import 'package:coding_test_ghufran/screen/category_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  BooksModel bookCategory = BooksModel(result: []);
  loadListOfBookCategory() async {
    try {
      final response = await rootBundle.loadString("assets/json/books.json");
      final data = (booksModelFromJson(response));
      bookCategory = data;
      setState(() {});
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  @override
  void initState() {
    loadListOfBookCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Book Categories"),
        ),
        body: ListView(
          children: [
            ...bookCategory.result.map((e) => ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailsView(bookDetail: e)),
                  ),
                  title: Text(e.categoryName),
                ))
          ],
        ));
  }
}
