import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/item_tile.dart';
import '../provider/cart_provider.dart';
import 'cart_page.dart';

class FishItems extends StatelessWidget {
  FishItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fishhome = context.watch<CartProvider>().fishhome;
    var fishcart = context.watch<CartProvider>().cartall;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          )),
          child: Wrap(
            children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
              Text("${fishcart.length}")
            ]
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fish Items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.builder(
                    itemCount: fishhome.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      var fish= fishhome[index];
                      return ItemTile(
                        ItemName: fish.name,
                        ItemPrice: "${fish.price}",
                        ImagePath: fish.image,
                        color: Colors.green,
                        onPressed: () {
                        context.read<CartProvider>().addToCart(fish);
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
