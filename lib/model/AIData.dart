class AIData<T> {
  String? startedDate;
  String? endDate;
  String? hashTag;
  String? category;
  String? quantityLimit;

  AIData({this.startedDate, this.endDate, this.hashTag,this.category,this.quantityLimit});

  AIData.fromJson(Map<String, dynamic> json) {
    startedDate = json['startedDate'];
    endDate = json['endDate'];
    hashTag = json['hashTag'];
    category = json['category'];
    quantityLimit = json['quantityLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startedDate']  = this.startedDate;
    data['endDate']  = this.endDate;
    data['hashTag'] = this.hashTag;
    data['category'] = this.category;
    data['quantityLimit'] = this.quantityLimit;
    return data;
  }
}
