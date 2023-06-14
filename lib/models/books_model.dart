// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
    List<Result> result;

    BooksModel({
        required this.result,
    });

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    String title;
    int authorId;
    String authorName;
    String bookCoverUrl;
    String categoryName;
    int categoryId;

    Result({
        required this.title,
        required this.authorId,
        required this.authorName,
        required this.bookCoverUrl,
        required this.categoryName,
        required this.categoryId,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        authorId: json["authorId"],
        authorName: json["authorName"],
        bookCoverUrl: json["bookCoverUrl"],
        categoryName: json["categoryName"],
        categoryId: json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "authorId": authorId,
        "authorName": authorName,
        "bookCoverUrl": bookCoverUrl,
        "categoryName": categoryName,
        "categoryId": categoryId,
    };
}
