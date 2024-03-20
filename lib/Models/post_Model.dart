class Post_Model
{
  String? name;
  String? date;
  String? avatarImage;
  String? text;
  String? uId;

  bool? isLiked;
  bool? isSaved;

  int? postType;
  int? likesCount;
  int? commentsCount;
  int? savesCounts;



  Post_Model.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    date = json['date'];
    avatarImage = json['avatarImage'];
    text = json['text'];
    uId = json['uId'];

    isLiked = json['isLiked'];
    isSaved = json['isSaved'];

    postType = json['postType'];
    likesCount = json['likesCount'];
    commentsCount = json['commentsCount'];
    savesCounts = json['savesCounts'];



  }

  Post_Model(
  {
    required this.name,
    required this.date,
    required this.avatarImage,
    required this.text,
    required this.uId,

    required this.isLiked,
    required this.isSaved,

    required this.postType,
    required this.likesCount,
    required this.commentsCount,
    required this.savesCounts,

});
}