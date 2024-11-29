class AiDataResponse {
  String? userId;
  String? startedDate;
  String? endDate;
  String? hashTag;
  int? category;
  int? quantityLimit;
  int? requestStatus;
  String? createdAt;
  String? updatedAt;

  AiDataResponse(
      {this.userId,
      this.startedDate,
      this.endDate,
      this.hashTag,
      this.category,
      this.quantityLimit,
      this.requestStatus,
      this.createdAt,
      this.updatedAt});

  AiDataResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    startedDate = json['startedDate'];
    endDate = json['endDate'];
    hashTag = json['hashTag'];
    category = json['category'];
    quantityLimit = json['quantityLimit'];
    requestStatus = json['requestStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['StartedDate'] = this.startedDate;
    data['EndDate'] = this.endDate;
    data['HashTag'] = this.hashTag;
    data['Category'] = this.category;
    data['QuantityLimit'] = this.quantityLimit;
    data['RequestStatus'] = this.requestStatus;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}