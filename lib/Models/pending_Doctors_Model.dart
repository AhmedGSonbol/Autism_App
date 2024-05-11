class Pending_Doctors
{
  List<PendingData> pendingData = [];


  Pending_Doctors.fromJson(Map<String,dynamic> json)
  {

    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        pendingData.add(PendingData.fromJson(e));
      });
    }



  }
}

class PendingData
{
  String? name;
  String? email;
  String? date;
  String? image;
  String? cv;

  int? id;

  PendingData.fromJson(Map<String,dynamic> json)
  {

    name = json['name'];
    email = json['email'];
    date = json['create_at'];
    image = json['image'];
    cv = json['cv'];

    id = json['id'];


  }

  PendingData(
      {
        required this.id,
        required this.email,
        required this.name,
        required this.date,
        required this.image,
        required this.cv,

      });
}