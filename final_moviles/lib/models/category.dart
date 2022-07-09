class Category {
  String? id;
  String? title;
  String? thumb;
  String? description;

  Category(
      {this.id,
        this.title,
        this.thumb,
        this.description,});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['idCategory'];
    title = json['strCategory'];
    thumb = json['strCategoryThumb'];
    description = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategory'] = this.id;
    data['strCategory'] = this.title;
    data['strCategoryThumb'] = this.thumb;
    data['strCategoryDescription'] = this.description;
    return data;
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'title': title,
    };
  }
}