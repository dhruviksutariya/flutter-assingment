import 'package:flutter/material.dart';

class Category {
  List<Item> itemList = [];
  List<SubItem> subNameList = [];
  Category({required this.itemList, required this.subNameList});
}

class Item {
  int id;
  String name;
  Item({required this.id,required this.name});
}

class SubItem{
  String subName;
  SubItem({required this.subName});
}


class CardItemImage {
  String image;
  CardItemImage({required this.image});
}
class CartItemname{
  List<String>  cardItemImage = [];

  CartItemname({required this.cardItemImage});
}
class MainCategory {
  String categoryName;
  List<SubCategory> subCategory = [];

  MainCategory({required this.categoryName, required this.subCategory});
}

class SubCategory {
  String subName;
  List<CardItem> cardItemList = [];

  SubCategory({required this.subName, required this.cardItemList});
}

class CardItem {
  String image, name, price;
  double ratting;

  CardItem(
      {required this.image,
        required this.name,
        required this.price,
        required this.ratting});
}