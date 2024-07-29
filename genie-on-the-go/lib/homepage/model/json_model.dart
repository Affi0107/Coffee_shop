class AddonModel {
  final String addonsName;
  final double price;

  AddonModel({required this.addonsName, required this.price});

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(addonsName: json['addonsName'], price: json['price']);
  }
}

class SizeModel {
  final String sizeName1;
  final String sizeName2;
  final String sizeName3;

  SizeModel(
      {required this.sizeName1,
      required this.sizeName2,
      required this.sizeName3});
}

class JsonModel {
  final int id;
  final String name;
  final String description;
  final String rating;
  final String totalRatings;
  final String image;
  final double price;
  final String discount;
  final double offerPrice;
  final String veg;
  final String category;
  final List<AddonModel> addons;
  final SizeModel size;

  JsonModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.rating,
      required this.totalRatings,
      required this.image,
      required this.price,
      required this.discount,
      required this.offerPrice,
      required this.veg,
      required this.category,
      required this.addons,
      required this.size});

  //deserialization
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    List<AddonModel> parseAddons = [];
    if (json['addons'] != null) {
      for (var addon in json["addons"]) {
        parseAddons.add(AddonModel.fromJson(addon));
      }
    }
    return JsonModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        rating: json['rating'],
        totalRatings: json['totalRatings'],
        image: json['image'],
        price: json['price'],
        discount: json['discount'],
        offerPrice: json['offerPrice'],
        veg: json['veg'],
        category: json['category'],
        addons: parseAddons,
        size: SizeModel(
            sizeName1: json['size']['sizeName1'],
            sizeName2: json['size']['sizeName2'],
            sizeName3: json['size']['sizeName3']));
  }
}
