class Cameras {
  String? name;
  String? fullName;

  Cameras({this.name, this.fullName});

  Cameras.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['full_name'] = fullName;
    return data;
  }
}
