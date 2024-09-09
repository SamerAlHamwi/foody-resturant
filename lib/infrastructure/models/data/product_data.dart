
import 'galleries.dart';
import 'kitchen_data.dart';
import 'stock.dart';
import 'unit_data.dart';
import 'translation.dart';
import 'category_data.dart';

class ProductData {
  ProductData({
    int? id,
    int? cartCount,
    String? uuid,
    int? shopId,
    int? categoryId,
    num? tax,
    num? interval,
    String? barCode,
    String? status,
    bool? active,
    bool? addon,
    String? img,
    int? minQty,
    int? maxQty,
    List<String>? locales,
    Translation? translation,
    CategoryData? category,
    UnitData? unit,
    List<Stock>? stocks,
    List<Galleries>? galleries,
    Stock? stock,
    KitchenModel? kitchen,
    int? unitId,
    List<ProductDiscounts>? discounts,
    bool? isSelectedAddon,
  }) {
    _id = id;
    _kitchen = kitchen;
    _galleries = galleries;
    _cartCount = cartCount;
    _uuid = uuid;
    _shopId = shopId;
    _categoryId = categoryId;
    _tax = tax;
    _interval = interval;
    _barCode = barCode;
    _status = status;
    _active = active;
    _addon = addon;
    _img = img;
    _minQty = minQty;
    _maxQty = maxQty;
    _locales = locales;
    _translation = translation;
    _category = category;
    _unit = unit;
    _stocks = stocks;
    _stock = stock;
    _unitId = unitId;
    _discounts = discounts;
    _isSelectedAddon = isSelectedAddon;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _cartCount = 0;
    _uuid = json['uuid'];
    _shopId = json['shop_id'];
    _categoryId = int.tryParse(json['category_id'].toString());
    _tax = num.tryParse(json['tax'].toString());
    _interval = json['interval'];
    _barCode = json['bar_code'];
    _status = json['status'];
    _active = json['active'];
    _addon = json['addon'];
    _img = json['img'];
    _minQty = int.tryParse(json['min_qty'].toString());
    _maxQty = int.tryParse(json['max_qty'].toString());
    _locales = json['locales'] != null ? json['locales'].cast<String>() : [];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    _stock = json?["stock"] == null ? null : Stock.fromJson(json?["stock"]);
    _category = json['category'] != null
        ? CategoryData.fromJson(json['category'])
        : null;
    if (json['galleries'] != null) {
      _galleries = [];
      json['galleries'].forEach((v) {
        _galleries?.add(Galleries.fromJson(v));
      });
    }
    _unit = json['unit'] != null ? UnitData.fromJson(json['unit']) : null;
    _kitchen =
        json['kitchen'] != null ? KitchenModel.fromJson(json['kitchen']) : null;
    if (json['stocks'] != null) {
      _stocks = [];
      json['stocks'].forEach((v) {
        _stocks?.add(Stock.fromJson(v));
      });
    }
    _unitId = json['unit_id'];
    if (json['discounts'] != null) {
      _discounts = [];
      json['discounts'].forEach((v) {
        _discounts?.add(ProductDiscounts.fromJson(v));
      });
    }
    _isSelectedAddon = false;
  }

  int? _id;
  List<Galleries>? _galleries;
  int? _cartCount;
  String? _uuid;
  int? _shopId;
  int? _categoryId;
  num? _tax;
  num? _interval;
  String? _barCode;
  String? _status;
  bool? _active;
  bool? _addon;
  String? _img;
  int? _minQty;
  int? _maxQty;
  List<String>? _locales;
  Translation? _translation;
  CategoryData? _category;
  UnitData? _unit;
  List<Stock>? _stocks;
  Stock? _stock;
  KitchenModel? _kitchen;
  int? _unitId;
  List<ProductDiscounts>? _discounts;
  bool? _isSelectedAddon;

  ProductData copyWith({
    int? id,
    int? cartCount,
    List<Galleries>? galleries,
    String? uuid,
    int? shopId,
    int? categoryId,
    num? tax,
    num? interval,
    String? barCode,
    String? status,
    bool? active,
    bool? addon,
    String? img,
    int? minQty,
    int? maxQty,
    List<String>? locales,
    Translation? translation,
    CategoryData? category,
    UnitData? unit,
    List<Stock>? stocks,
    Stock? stock,
    int? unitId,
    List<ProductDiscounts>? discounts,
    bool? isSelectedAddon,
  }) =>
      ProductData(
        id: id ?? _id,
        cartCount: cartCount ?? _cartCount,
        uuid: uuid ?? _uuid,
        shopId: shopId ?? _shopId,
        categoryId: categoryId ?? _categoryId,
        tax: tax ?? _tax,
        galleries: galleries ?? galleries,
        interval: interval ?? _interval,
        barCode: barCode ?? _barCode,
        status: status ?? _status,
        active: active ?? _active,
        addon: addon ?? _addon,
        img: img ?? _img,
        minQty: minQty ?? _minQty,
        maxQty: maxQty ?? _maxQty,
        locales: locales ?? _locales,
        translation: translation ?? _translation,
        category: category ?? _category,
        unit: unit ?? _unit,
        stocks: stocks ?? _stocks,
        stock: stock ?? _stock,
        unitId: unitId ?? _unitId,
        discounts: discounts ?? _discounts,
        isSelectedAddon: isSelectedAddon ?? _isSelectedAddon,
      );

  int? get id => _id;

  int? get cartCount => _cartCount;

  String? get uuid => _uuid;

  int? get shopId => _shopId;

  List<Galleries>? get galleries => _galleries;

  int? get categoryId => _categoryId;

  num? get tax => _tax;

  num? get interval => _interval;

  String? get barCode => _barCode;

  String? get status => _status;

  bool? get active => _active;

  bool? get addon => _addon;

  String? get img => _img;

  int? get minQty => _minQty;

  int? get maxQty => _maxQty;

  List<String>? get locales => _locales;

  Translation? get translation => _translation;

  CategoryData? get category => _category;

  UnitData? get unit => _unit;

  KitchenModel? get kitchen => _kitchen;

  List<Stock>? get stocks => _stocks;

  Stock? get stock => _stock;

  int? get unitId => _unitId;

  List<ProductDiscounts>? get discounts => _discounts;

  bool? get isSelectedAddon => _isSelectedAddon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['shop_id'] = _shopId;
    map['category_id'] = _categoryId;
    map['tax'] = _tax;
    map['bar_code'] = _barCode;
    map['status'] = _status;
    map['active'] = _active;
    map['img'] = _img;
    map['min_qty'] = _minQty;
    map['max_qty'] = _maxQty;
    map['locales'] = _locales;
    map['unit_id'] = _unitId;
    if (_discounts != null) {
      map['discounts'] = _discounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductDiscounts {
  ProductDiscounts({
    int? id,
    int? shopId,
    String? type,
    num? price,
    String? start,
    String? end,
    String? img,
    int? active,
    ProductPivot? pivot,
  }) {
    _id = id;
    _shopId = shopId;
    _type = type;
    _price = price;
    _start = start;
    _end = end;
    _img = img;
    _active = active;
    _pivot = pivot;
  }

  ProductDiscounts.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _type = json['type'];
    _price = json['price'];
    _start = json['start'];
    _end = json['end'];
    _img = json['img'];
    _active = json['active'];
    _pivot =
        json['pivot'] != null ? ProductPivot.fromJson(json['pivot']) : null;
  }

  int? _id;
  int? _shopId;
  String? _type;
  num? _price;
  String? _start;
  String? _end;
  String? _img;
  int? _active;
  ProductPivot? _pivot;

  ProductDiscounts copyWith({
    int? id,
    int? shopId,
    String? type,
    num? price,
    String? start,
    String? end,
    String? img,
    int? active,
    ProductPivot? pivot,
  }) =>
      ProductDiscounts(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        type: type ?? _type,
        price: price ?? _price,
        start: start ?? _start,
        end: end ?? _end,
        img: img ?? _img,
        active: active ?? _active,
        pivot: pivot ?? _pivot,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  String? get type => _type;

  num? get price => _price;

  String? get start => _start;

  String? get end => _end;

  String? get img => _img;

  int? get active => _active;

  ProductPivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['type'] = _type;
    map['price'] = _price;
    map['start'] = _start;
    map['end'] = _end;
    map['img'] = _img;
    map['active'] = _active;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }
}

class ProductPivot {
  ProductPivot({int? productId, int? discountId}) {
    _productId = productId;
    _discountId = discountId;
  }

  ProductPivot.fromJson(dynamic json) {
    _productId = json['product_id'];
    _discountId = json['discount_id'];
  }

  int? _productId;
  int? _discountId;

  ProductPivot copyWith({int? productId, int? discountId}) => ProductPivot(
        productId: productId ?? _productId,
        discountId: discountId ?? _discountId,
      );

  int? get productId => _productId;

  int? get discountId => _discountId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['discount_id'] = _discountId;
    return map;
  }
}
