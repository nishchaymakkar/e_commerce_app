import 'package:flutter/material.dart';

import '../models/shoe.dart';


// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:25 ),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(shoe.description,
            style: TextStyle(
              color: Colors.grey[600]
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shoe.name, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    const SizedBox(height: 5,),
                    Text('\$${shoe.price}', style: TextStyle(color: Colors.grey),)
                  ],
                ),

                GestureDetector(
                  onTap:  onTap,
                  child: Container(
                    padding: EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)
                        )
                      ),
                      child: Icon(Icons.add,color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}