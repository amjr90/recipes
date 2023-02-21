import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'location.dart';

class Recipe extends Equatable {
  static List<Recipe> recipeFromJson(dynamic json) =>
      List<Recipe>.from(json.map((x) => Recipe.fromJson(x)));

  static String recipeToJson(List<Recipe> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.country,
    required this.location,
    required this.ingredients,
    required this.image,
  });

  String id;
  String name;
  String description;
  String country;
  Location location;
  List<String> ingredients;
  String image;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        country: json["country"],
        location: Location.fromJson(json["location"]),
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "country": country,
        "location": location.toJson(),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "image": image,
      };

  @override
  List<Object?> get props =>
      [name, description, country, location, ingredients, image];
}
