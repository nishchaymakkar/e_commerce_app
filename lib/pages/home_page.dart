import 'package:e_commerce_app/components/bottom_nav_bar.dart';
import 'package:e_commerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),

    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index) ,
      ),
      appBar: AppBar(
        leading:  Builder(
          builder: (context) => IconButton(onPressed:(){
              Scaffold.of(context).openDrawer();
            } ,
                icon: const Padding(
                  padding:  EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.menu,
                    color: Colors.black,),
                ))

        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              children: [
                DrawerHeader(child: Image.asset('lib/sneakers/shoeslogo.png', height: 240,color: Colors.white,)),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),),
                const Padding(
                  padding:  EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home,color: Colors.white,),
                    title: Text('Home', style: TextStyle(color: Colors.white),),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.white,),
                    title: Text('About', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),

            const Padding(
              padding:  EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text('Logout', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}