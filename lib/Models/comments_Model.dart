class Comments_Model
{
  List<CommentsData> commentsData = [];





  Comments_Model.fromJson(Map<String,dynamic> json)
  {

    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        commentsData.add(CommentsData.fromJson(e));
      });
    }



  }
}

class CommentsData
{
  String? name;
  String? date;
  String? image;
  String? content;

  bool? is_my_comment;

  int? id;

  CommentsData.fromJson(Map<String,dynamic> json)
  {

    name = json['name'];
    date = json['date'];
    image = json['image'];
    content = json['content'];

    is_my_comment = json['is_my_comment'] == 0 ? false : true;

    id = json['id'];

  }

  CommentsData(
      {
        required this.name,
        required this.date,
        required this.image,
        required this.content,

        required this.is_my_comment,

        required this.id,

      });
}