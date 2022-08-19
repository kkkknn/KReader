class SearchBookResult {
  bool isFinish = false;
  String bookName = '';
  String author = '';
  String imageUrl = '';
  int likeCount = 0;
  int searchCount = 0;
  List<String> categories = [];

  SearchBookResult({required this.isFinish, required this.bookName, required this.author, required this.imageUrl,
      required this.likeCount,  required this.searchCount, required this.categories});
}
