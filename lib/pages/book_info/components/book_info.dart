class BookInfo{
  String bookId='';
  String bookName='';
  String description='';
  String author='';
  String authorImageUrl='';
  String bookImageUrl='';
  List<String> categories=[];
  List<String> tags=[];
  bool finished=false;
  String updateTime='';
  String createTime='';
  int likeCount=0;
  int viewCount=0;
  //评论数
  int commentsCount=0;
  bool isLiked=false;
  bool isFavourite=false;

}