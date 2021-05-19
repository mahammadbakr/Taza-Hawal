

class  LanguageAndCountry {
  final String name;
  final String country;
  final String image;

  LanguageAndCountry(
      {required this.name,
        required this.country,
        required this.image
      });

  factory  LanguageAndCountry.fromJson(Map<String, dynamic> data) =>  LanguageAndCountry(
    name: data["name"],
      country: data["country"],
    image: data["image"]
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'country': country,
    'image': image
  };
}
