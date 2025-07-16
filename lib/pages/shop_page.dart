import 'package:e_commerce_app/models/Cart.dart';
import 'package:e_commerce_app/models/shoe.dart';
import 'package:e_commerce_app/pages/shoe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();

}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen: false).addToCart(shoe);
    
    // show Dialog
    
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text('Successfully added!'),
      content: Text('Check your cart'),
    ));
  }
  @override
  Widget build(BuildContext context){
    return  Consumer<Cart>(builder: (context, value, child)=> Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search',style: TextStyle(color: Colors.grey),),
              Icon(Icons.search,color: Colors.grey,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text('everyone flies... some fly longer than others',style: TextStyle(color: Colors.grey[600]),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hot Picks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ),),
              Text('See All', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)
            ],
          ),
        ),
        const SizedBox(height: 10,),

        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal, itemCount: value.shoesShop.length, itemBuilder: (context,index){
            Shoe shoe = value.getShoeList()[index];

            return ShoeTile(shoe: shoe,onTap: ()=> addShoeToCart(shoe));
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(top:  25.0,left: 25.0, right: 25.0),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    ));
  }
}