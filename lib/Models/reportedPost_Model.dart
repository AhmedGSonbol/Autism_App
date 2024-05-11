class ReportedPost_Model
{
  String? message;
  List<ReportedPostData> reportedPostData = [];





  ReportedPost_Model.fromJson(Map<String,dynamic> json)
  {
    message = json['message'];


    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        reportedPostData.add(ReportedPostData.fromJson(e));
      });
    }



  }
}

class ReportedPostData
{
  String? comp_from;
  String? comp_to;
  String? date;
  String? image;
  String? content;
  int? type;
  String? complaint;
  int? id;

  ReportedPostData.fromJson(Map<String,dynamic> json)
  {

    comp_from = json['comp_from'];
    comp_to = json['comp_to'];
    date = json['date'];
    image = json['image'];
    content = json['content'];
    complaint = json['complaint'];
    id = json['id'];
    type = json['type'];

  }

  ReportedPostData(
      {
        required this.id,
        required this.comp_from,
        required this.comp_to,
        required this.date,
        required this.image,
        required this.content,
        required this.complaint,
        required this.type,

      });
}