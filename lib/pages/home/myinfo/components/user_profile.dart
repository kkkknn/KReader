class UserProfile {
  String id='';
  String birthday='';
  String email='';
  String gender='';
  String slogan='';
  String name='';
  String nickname='';
  //是否验证，好像未验证的不让评论
  bool verified=false;
  int exp=0;
  int level=1;
  List<dynamic> characters=[];
  String createTime='';
  //是否进行签到
  bool isPunched=false;
  String imageUrl='assets/images/default/author.jpg';


}