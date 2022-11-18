class Register {
  String? messageName;
  Parameters? parameters;

  Register(Map<String, Object> map, {this.messageName, this.parameters});

  Register.fromJson(Map<String, dynamic> json) {
    messageName = json['MessageName'];
    parameters = json['Parameters'] != null
        ? new Parameters.fromJson(json['Parameters'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageName'] = this.messageName;
    if (this.parameters != null) {
      data['Parameters'] = this.parameters!.toJson();
    }
    return data;
  }
}

class Parameters {
  String? presetName;

  Parameters({this.presetName});

  Parameters.fromJson(Map<String, dynamic> json) {
    presetName = json['PresetName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PresetName'] = this.presetName;
    return data;
  }
}
