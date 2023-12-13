import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_images.dart';
import 'package:vippro_project/screens/details/index.dart';
import 'package:vippro_project/screens/fruits/widgets/fruit_items.dart';
import 'package:vippro_project/widgets/green_appbar.dart';

import '../../data/model/products.dart';

class ProductsScreen extends StatefulWidget {
  final String title;
  final List<Products> products;
  const ProductsScreen(
      {super.key, required this.products, required this.title});

  @override
  State<StatefulWidget> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final db= FirebaseFirestore.instance;
  Future<void> changeFav ({required String id,required bool isFav})async{
    await db.collection('Products').doc(id).update({"isFav":isFav}).then((value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }
  String changeIconFav(bool isFav){
    return isFav?AppLogos.redHeartIcon:AppLogos.heartIcon;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GreenAppbar(
        title: widget.title,
        clickBack: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.greenColor,
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 28,
                bottom: 12,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: GridView.builder(
                  itemCount: widget.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 228,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItems(
                      price: widget.products[index].price,
                      weight: widget.products[index].amount,
                      name: widget.products[index].name,
                      image: widget.products[index].image,
                      clickDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Details(product: widget.products[index]),
                          ),
                        );
                      },
                      isFavIcon: changeIconFav(widget.products[index].isFav),
                        clickFav: () {
                          changeFav(id: widget.products[index].id, isFav: !widget.products[index].isFav);
                          setState(() {
                            widget.products[index].isFav=!widget.products[index].isFav;
                          });
                        },
                    );
                  }))
        ],
      ),
    );
  }
}
