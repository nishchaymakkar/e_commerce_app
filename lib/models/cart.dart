import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoesShop = [
    Shoe(name: 'Brown Shoe', price: '400',
        imagePath: 'lib/sneakers/brown-leather-shoes.jpg',
        description: 'This is a brown sneakers.'),
    Shoe(name: 'Black Shoe', price: '500',
        imagePath: 'lib/sneakers/fashion-shoes-sneakers.jpg',
        description: 'This is a fashion  sneakers'),
    Shoe(name: 'Mens shoes', price: '600',
        imagePath: 'lib/sneakers/men-shoes.jpg',
        description: 'This is a brown leather sneakers'),
    Shoe(name: 'White Shoe', price: '700',
        imagePath: 'lib/sneakers/shoes.jpg',
        description: 'This is a blue sneakers'),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];


  // get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoesShop;
  }

  // get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  //add items to cart
  void addToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  // removing items from cart
  void removingItemToCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}