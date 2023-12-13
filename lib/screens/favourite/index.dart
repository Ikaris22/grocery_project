import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vippro_project/base/app_strings.dart';

import '../../base/app_colors.dart';
import '../../base/app_images.dart';
import '../../data/model/products.dart';
import '../fruits/widgets/fruit_items.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<StatefulWidget> createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen> {
  final db = FirebaseFirestore.instance;
  List<Products> listFav = [];
  Future<void> addFav() async {
    await db.collection('Products').get().then((value) {
      for (var item in value.docs) {
        if (item.data()['isFav'] == true) {
          listFav.add(Products(
            id: item.id,
            image: item.data()['image'],
            price: item.data()['price'],
            name: item.data()['name'],
            amount: item.data()['amount'],
            isFav: item.data()['isFav'],
          ));
        }
      }
    });
  }

  Future<void> changeFav({required String id, required bool isFav}) async {
    await db.collection('Products').doc(id).update({"isFav": isFav}).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }

  String changeIconFav(bool isFav) {
    return isFav ? AppLogos.redHeartIcon : AppLogos.heartIcon;
  }

  Future<String> future() async {
    await addFav();
    return 'abc';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        elevation: 0,
        backgroundColor: AppColors.greenColor,
        title: const Text(
          FavouritePageStrings.appbarTitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
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
            child: FutureBuilder<String>(
              future: future(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                Widget widget;
                if (snapshot.hasData) {
                  widget = GridView.builder(
                      itemCount: listFav.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              mainAxisExtent: 228),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItems(
                          price: listFav[index].price,
                          weight: listFav[index].amount,
                          name: listFav[index].name,
                          image: listFav[index].image,
                          clickDetails: () {},
                          isFavIcon: changeIconFav(listFav[index].isFav),
                          clickFav: () {
                            changeFav(
                                id: listFav[index].id,
                                isFav: !listFav[index].isFav);
                            setState(() {
                              listFav.clear();
                            });
                          },
                        );
                      });
                } else {
                  if (snapshot.hasError) {
                    widget = Text('Error: ${snapshot.error}');
                  } else {
                    widget = GridView.builder(
                        itemCount: listFav.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                mainAxisExtent: 228),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.backGroundColor,
                            ),
                            child: const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.greenColor,
                                )),
                          );
                        });
                  }
                }
                return widget;
              },
            ),
          )
        ],
      ),
    );
  }
}
