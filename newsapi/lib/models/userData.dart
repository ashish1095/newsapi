class UserData {
  String? responseCode;
  String? responseMessage;
  List<Items>? items;

  UserData({this.responseCode, this.responseMessage, this.items});

  UserData.fromJson(Map<String, dynamic> json) {
    this.responseCode = json["response_code"];
    this.responseMessage = json["response_message"];
    this.items = json["items"] == null
        ? null
        : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["response_code"] = this.responseCode;
    data["response_message"] = this.responseMessage;
    if (this.items != null)
      data["items"] = this.items?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Items {
  String? username;
  int? age;

  Items({this.username, this.age});

  Items.fromJson(Map<String, dynamic> json) {
    this.username = json["username"];
    this.age = json["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.username;
    data["age"] = this.age;
    return data;
  }
}
