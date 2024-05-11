class User_Model
{
  String? message;
  UserData? data;

  User_Model.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null ;

  }
}

class UserData
{
  int? id;
  String? name;
  String? email;
  String? image;
  String? user_type;
  String? city;
  String? government;


  // UserData({
  //   required this.id,
  //   required this.name,
  //   required this.email,
  //   required this.Phone,
  //   required this.Image,
  //   required this.points,
  //   required this.credit,
  //   required this.token,
  // });

  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    user_type = json['user_type'];
    city = json['city'];
    government = json['government'];
  }

}