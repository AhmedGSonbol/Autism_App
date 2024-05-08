class Post_Model
{
  String? message;
  List<PostData> postData = [];





  Post_Model.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];

    // print('aaaaaaaaaaa');
    // print(json['data']);
    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        postData.add(PostData.fromJson(e));
      });
    }



  }
}

class PostData
{
  String? name;
  String? email;
  String? date;
  String? image;
  String? content;
  String? type;

  bool? isLiked;
  bool? isSaved;

  int? post_user_id;
  int? id;
  int? likes;
  int? comments;
  int? saves;

  PostData.fromJson(Map<String,dynamic> json)
  {

    name = json['name'];
    email = json['email'];
    date = json['date'];
    image = json['image'];
    content = json['content'];
    post_user_id = json['post_user_id'];

    isLiked = json['isLiked'] == 0 ? false : true;
    isSaved = json['isSaved'] == 0 ? false : true;

    id = json['id'];
    type = json['type'];
    likes = json['likes'];
    comments = json['comments'];
    saves = json['saves'];

  }

  PostData(
      {
        required this.id,
        required this.email,
        required this.name,
        required this.date,
        required this.image,
        required this.content,
        required this.post_user_id,

        required this.isLiked,
        required this.isSaved,

        required this.type,
        required this.likes,
        required this.comments,
        required this.saves,

      });
}