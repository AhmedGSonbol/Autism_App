class Search_Model
{

  List<SearchData> data = [];

  Search_Model.fromJson(Map<String,dynamic> json)
  {
    if(json['data'].length != 0)
    {
      json['data'].forEach((e)
      {
        data.add(SearchData.fromJson(e));
      });
    }


  }
}

class SearchData
{
  int? id;
  String? name;
  String? country;
  String? government;
  String? image;


  SearchData.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    government = json['government'];
    image = json['image'];

  }

}