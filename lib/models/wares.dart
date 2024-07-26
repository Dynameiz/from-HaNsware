class Wares{
  final int id;
  final String name;
  final String rarity;
  final String category;
  final String type;
  final String image;
  final String detail;
  final int price;
  final int quantity;

  Wares({
    required this.id, 
    required this.name, 
    required this.rarity, 
    required this.category, 
    required this.type, 
    required this.image, 
    required this.detail, 
    required this.price, 
    required this.quantity
  });

  factory Wares.fromJson(Map<String, dynamic> json) => Wares(
    id: json['id'] as int,
    name: json['name'].toString(),
    rarity: json['rarity'].toString(),
    category: json['category'].toString(),
    type: json['type'].toString(),
    image: json['image'].toString(),
    detail: json['detail'].toString(),
    price: json['price'] as int,
    quantity: json['quantity'] as int,
  );
}