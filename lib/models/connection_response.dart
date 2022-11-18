class ConnectionResponse {
  List<Presets>? presets;

  ConnectionResponse({this.presets});

  ConnectionResponse.fromJson(Map<String, dynamic> json) {
    if (json['Presets'] != null) {
      presets = <Presets>[];
      json['Presets'].forEach((v) {
        presets!.add(new Presets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.presets != null) {
      data['Presets'] = this.presets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Presets {
  String? name;
  String? path;

  Presets({this.name, this.path});

  Presets.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Path'] = this.path;
    return data;
  }
}
