class Products{
  List<ProductItem>? products;

  Products({this.products});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductItem>[];
      json['products'].forEach((v) {
        products!.add(new ProductItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductItem {
  int? productId;
  String? name;
  String? desc;
  String? price;

  ProductItem({this.productId, this.name, this.desc, this.price});

  ProductItem.fromJson(dynamic json) {
    productId = json['productId'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['price'] = this.price;
    return data;
  }

  ProductItem copyWith({
    int? productId,
    String? name,
    String? desc,
    String? price
  }) {
    return ProductItem(
      productId: productId ?? this.productId,
      name: name ,
      desc: desc ,
      price: price,
    );
  }
}