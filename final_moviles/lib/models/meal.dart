class Meal {
  String? id;
  String? title;
  String? thumb;

  Meal(
      {
        this.id,
        this.title,
        this.thumb});

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['idMeal'];
    title = json['strMeal'];
    thumb = json['strMealThumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this.id;
    data['strMeal'] = this.title;
    data['strMealThumb'] = this.thumb;
    return data;
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'title': title,
    };
  }
}