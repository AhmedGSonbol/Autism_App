class Messengers_Model
{
  List<MessengersData> messengersData = [];





  Messengers_Model.fromJson(Map<String,dynamic> json)
  {

    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        messengersData.add(MessengersData.fromJson(e));
      });
    }



  }
}

class MessengersData
{
  String? name;
  String? date;
  String? image;
  String? message;

  int? id;
  int? uId;

  MessengersData.fromJson(Map<String,dynamic> json)
  {

    name = json['name'];
    date = json['date'];
    image = json['image'];
    message = json['message'];

    id = json['id'];
    uId = json['uId'];

  }

  MessengersData(
      {
        required this.name,
        required this.date,
        required this.image,
        required this.message,

        required this.id,
        required this.uId,

      });
}