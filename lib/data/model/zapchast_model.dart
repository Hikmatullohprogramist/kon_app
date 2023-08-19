class ZapchastModel {
  String name;
  String birlik;
  int typeId;
  String size;
  double number;

  ZapchastModel({
    required this.name,
    required this.birlik,
    required this.typeId,
    required this.size,
    required this.number,
  });

  factory ZapchastModel.fromJson(Map<String, dynamic> json) => ZapchastModel(
        name: json["name"],
        birlik: json["birlik"],
        typeId: json["type_id"],
        size: json["size"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birlik": birlik,
        "type_id": typeId,
        "size": size,
        "number": number,
      };
}
