class Book {
  String? image;
  String? title;
  String? author;
  String? desc;
  String? language;
  double? price;
  int? id;
  String? authorId;
  String? publisher;
  List<String>? genres;
  List<int>? genreIds;
  List<int>? ratings;
  List<String>? comments;
  String? isbn;
  String? edition;
  String? pseudonym;
  String? releaseDate;
  int? pages;
  List? bookAuthors;

  Book({
    this.image,
    this.title,
    this.author,
    this.desc,
    this.language,
    this.price,
    this.genres,
    this.id,
    this.authorId,
    this.bookAuthors,
    this.edition,
    this.isbn,
    this.pages,
    this.pseudonym,
    this.publisher,
    this.releaseDate,
    this.ratings,
    this.comments,
    this.genreIds,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      image: json['featured_image_url'],
      title: json['title_of_book'],
      author: json['display_name'],
      desc: json['description'],
      price: json['sale_price']?.toDouble(),
      genres: (json["bookCategory"] as List<dynamic>?)
          ?.map((category) => category["category_name"])
          .toList()
          .cast<String>(),
      genreIds: (json["bookCategory"] as List<dynamic>?)
          ?.map((category) => category["category_id"])
          .toList()
          .cast<int>(),
      id: json["book_id"],
      authorId: json["author_id"],
      bookAuthors:
          json["bookAuthors"] != null ? List.from(json["bookAuthors"]) : [],
      edition: json["edition"],
      isbn: json["isbn"],
      pages: json["book_page_count"],
      pseudonym: json["pseudonym"],
      publisher: json["publisher"],
      releaseDate: json["release_date"],
      ratings: (json["bookReviews"] as List<dynamic>?)
          ?.map<int>((review) => review["rating"] as int)
          .toList(),

      comments: [],
      // comments: (json["bookReviews"] as List<dynamic>?)
      //     ?.map<String>((review) => review["message"].toString())
      //     .toList(),
    );
  }
}
