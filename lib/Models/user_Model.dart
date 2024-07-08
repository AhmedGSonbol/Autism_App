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
  String? phone;
  String? city;
  String? government;

  bool? profile_status;

  //doctor
  String? about;
  String? clinicAddress;

  //patient
  String? age;
  String? patient_name ;
  String? test_result;

  List<UserImages> userImages = [];



  UserData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    user_type = json['user_type'];
    phone = json['phone'];
    city = json['city'];
    government = json['government'];
    profile_status = json['profile_status'] == null ? null : json['profile_status'] == 0 ? false : true;
    about = json['about'];
    clinicAddress = json['clinicAddress'];
    age = json['age'].toString() ?? '';
    patient_name = json['patient_name'] ?? '';
    test_result = json['test_result'] ?? '';


    if(json.containsKey('images') && json['images'].length != 0)
    {
      json['images'].forEach((e)
      {
        userImages.add(UserImages.fromJson(e));
      });
    }

  }


}

class UserImages
{

  String? imagePath;

  UserImages.fromJson(Map<String,dynamic> json)
  {
    imagePath = json['image'];

  }
}