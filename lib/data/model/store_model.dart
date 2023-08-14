
class StoreModel {
  String name;
  String birlik;
  String size;
  int number;

  StoreModel({
    required this.name,
    required this.birlik,
    required this.size,
    required this.number,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        name: json["name"],
        birlik: json["birlik"],
        size: json["size"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birlik": birlik,
        "size": size,
        "number": number,
      };
}
