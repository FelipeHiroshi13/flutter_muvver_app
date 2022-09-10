class Delivery {
  String? user;
  String? transport_type;
  String? initialDate;
  String? finalDate;
  String? beginPoint;
  String? endPoint;
  String? product_size;
  String? product_weight;
  double? price;

  Delivery({this.user, this.transport_type, this.price});



  Delivery.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    transport_type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['type'] = this.transport_type;
    data['price'] = this.price;
    return data;
  }
}