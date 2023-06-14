import 'package:coding_test_ghufran/models/books_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.bookDetail});
  final Result bookDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(bookDetail.categoryName),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      bookDetail.bookCoverUrl,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookDetail.title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "by ${bookDetail.authorName}",
                          style: const TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
