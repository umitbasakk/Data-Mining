class FoodItem {
  String? foodUrl;
  String? foodName;
  String? foodCalories;
  String? foodPrice;

  FoodItem({this.foodUrl, this.foodName, this.foodCalories,this.foodPrice});

  FoodItem.fromJson(Map<String, dynamic> json) {
    foodUrl = json['foodUrl'];
    foodName = json['foodName'];
    foodCalories = json['foodCalories'];
    foodPrice = json['foodPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startedDate']  = this.foodUrl;
    data['endDate']  = this.foodName;
    data['hashTag'] = this.foodCalories;
    data['category'] = this.foodCalories;
    return data;
  }
}
