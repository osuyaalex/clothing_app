import 'dart:convert';

void main() {
  // Create an empty list to store the JSON objects
  List<Map<String, dynamic>> jsonList = [];

  // Create a list of possible values for the "type" property
  List<String> types = ["dresses", "tops", "shoes", "outer", "blouse", "t-shirt", "knitwear", "skirt", "pants", "denim", "kids", "boots", "heels", "trainers", "schoolbag", "suitcases", "hiking bag", "beanies", "belts", "caps", "body care", "hair care", "make up"];

  // Use a loop to generate 100 JSON objects
  for (int i = 0; i < 100; i++) {
    // Create a JSON object with the desired properties
    Map<String, dynamic> jsonObj = {
      "name": "Product " + i.toString(),
      "image": "https://example.com/product-" + i.toString() + ".jpg",
      "description": "This is a sample product description. It should be at least 5 lines long to meet the specifications you provided. You can add more details about the product here, such as its features, materials, and benefits. Make sure to include enough information to give customers a good idea of what the product is and why they might want to buy it.",
      "price": i,
      "rating": i % 5,
      "type": types[i % types.length]
    };

    // Add the JSON object to the list
    jsonList.add(jsonObj);
  }

  // Print the JSON list
  print(jsonEncode(jsonList));
}
