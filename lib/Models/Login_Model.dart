class Login_Model
{
  String? token;
  String? message;
  UserData? data;
  Login_Model.fromJson(Map<String,dynamic> json)
  {
    token = json['token'];
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

  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    user_type = json['user_type'];
  }
}