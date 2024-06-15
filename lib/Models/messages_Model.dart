class Messages_Model
{
  List<MessagesData> messagesData = [];





  Messages_Model.fromJson(Map<String,dynamic> json)
  {

    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        messagesData.add(MessagesData.fromJson(e));
      });
    }



  }
}

class MessagesData
{
  String? date;
  String? message;

  bool? isMyMessage;

  // int? id;

  bool? status ;

  MessagesData.fromJson(Map<String,dynamic> json)
  {

    date = json['date'];
    message = json['message'];

    isMyMessage = json['is_my_message'] == 0 ? false : true;

    status = true;

    // id = json['ID'];

  }

  MessagesData(
      {
        required this.date,
        required this.message,

        required this.isMyMessage,

        required this.status,

        // required this.id,

      });
}