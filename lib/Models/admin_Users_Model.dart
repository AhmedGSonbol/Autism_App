class Admin_Users_Model
{
  List<Admin_UsersData> admin_UsersData = [];


  Admin_Users_Model.fromJson(Map<String,dynamic> json)
  {

    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        admin_UsersData.add(Admin_UsersData.fromJson(e));
      });
    }



  }
}

class Admin_UsersData
{
  int? id;
  String? name;
  String? email;
  String? image;
  String? user_type;

  Admin_UsersData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    user_type = json['user_type'];




  }

  Admin_UsersData(
      {
        required this.id,
        required this.email,
        required this.name,
        required this.image,
        required this.user_type,

      });
}