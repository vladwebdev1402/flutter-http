import 'package:laba_http/model/cameras.dart';

class Rover {
  int? id;
  String? name;
  String? landingDate;
  String? launchDate;
  String? status;
  int? maxSol;
  String? maxDate;
  int? totalPhotos;
  List<Cameras>? cameras;

  Rover(
      {this.id,
      this.name,
      this.landingDate,
      this.launchDate,
      this.status,
      this.maxSol,
      this.maxDate,
      this.totalPhotos,
      this.cameras});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
    maxSol = json['max_sol'];
    maxDate = json['max_date'];
    totalPhotos = json['total_photos'];
    if (json['cameras'] != null) {
      cameras = <Cameras>[];
      json['cameras'].forEach((v) {
        cameras!.add(Cameras.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['landing_date'] = landingDate;
    data['launch_date'] = launchDate;
    data['status'] = status;
    data['max_sol'] = maxSol;
    data['max_date'] = maxDate;
    data['total_photos'] = totalPhotos;
    if (cameras != null) {
      data['cameras'] = cameras!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
