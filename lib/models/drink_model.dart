class DrinkModel {
  int? id;
  String? name;
  String? img;
  String? description;
  double? price;
  double? salePrice;
  double? favorite;
  double? rating;

  DrinkModel(
      {this.id,
      this.name,
      this.img,
      this.description,
      this.price,
      this.salePrice,
      this.favorite,
      this.rating});

  DrinkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    description = json['description'];
    price = json['price'];
    salePrice = json['salePrice'];
    favorite = json['favorite'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    data['description'] = description;
    data['price'] = price;
    data['salePrice'] = salePrice;
    data['favorite'] = favorite;
    data['rating'] = rating;
    return data;
  }
}
