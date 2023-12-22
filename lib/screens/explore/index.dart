import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vippro_project/base/app_colors.dart';
import 'package:vippro_project/base/app_strings.dart';
import 'package:vippro_project/screens/explore/widgets/listview_items.dart';
import 'package:vippro_project/screens/fruits/index.dart';
import 'package:vippro_project/widgets/app_bar.dart';
import 'package:vippro_project/widgets/top_listview_label.dart';
import '../../data/model/explore_caregories.dart';
import '../../data/model/products.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  final db = FirebaseFirestore.instance;
  List<ExploreCategories> listTitle = [];
  List<Products> listGroceries = [];
  List<Products> listVegetables = [];
  List<Products> listFruit = [];
  List<Products> listDairyProducts = [];
  List<Products> listBakery = [];
  Future<void> addTitle() async {
    await db.collection("Explore").get().then((event) {
      for (var doc in event.docs) {
        listTitle.add(ExploreCategories(
          id: doc.id,
          title: doc.data()['title'],
          image: doc.data()['image'],
        ));
      }
    });
  }
  Future<void> addGroceries() async {
    await db.collection('Products').get().then((value) {
      for (var item in value.docs) {
        var categoriesRef = item.data()['categories'] as DocumentReference;
        if (categoriesRef.path == 'Explore/HYJJZkGqeeQfTgVWWpVU') {
          listGroceries.add(Products(
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
  Future<void> addVegetables() async {
    await db.collection('Products').get().then((value) {
      for (var item in value.docs) {
        var categoriesRef = item.data()['categories'] as DocumentReference;
        if (categoriesRef.path == 'Explore/VtKpqTVH4RrFs4qNq1cG') {
          listVegetables.add(Products(
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
  Future<void> addFruit() async {
    await db.collection('Products').get().then((value) {
      for (var item in value.docs) {
        var categoriesRef = item.data()['categories'] as DocumentReference;
        if (categoriesRef.path == 'Explore/9sNJ3J2V6zpbZ3wXNlVe') {
          listFruit.add(Products(
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
  Future<void> addDairyProducts() async {
    await db.collection('Products').get().then((value) {
      for (var item in value.docs) {
        var categoriesRef = item.data()['categories'] as DocumentReference;
        if (categoriesRef.path == 'Explore/5I4x2QQK1dpcoVw7v922') {
          listDairyProducts.add(Products(
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
  Future<void> addBakery() async {
    await db.collection('Products').get().then((value) {
      for (var item in value.docs) {
        var categoriesRef = item.data()['categories'] as DocumentReference;
        if (categoriesRef.path == 'Explore/SyScGOhtnNueRGsFT7SW') {
          listBakery.add(Products(
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
  @override
  void initState() {
    super.initState();
    addTitle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(
        appBarChild: Text(
          ExplorePageStrings.appbarTitle,
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<String>(
          future: future(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Widget widget;
            if (snapshot.hasData) {
              widget = Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 24),
                  child: Column(
                    children: [
                      groceries(),
                      vegetables(),
                      fruits(),
                      dairyProducts(),
                      bakeryItems()
                    ],
                  ));
            } else {
              if (snapshot.hasError) {
                widget = Text('Error: ${snapshot.error}');
              } else {
                widget = Column(
                  children: [
                    Gap((MediaQuery.of(context).size.height / 2) - 80),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Loading...', style: TextStyle(fontSize: 22)),
                        Gap(20),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            color: AppColors.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            }
            return widget;
          },
        ),
      ),
    );
  }

  groceries() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: listTitle[2].title,
            textButtonName: ExplorePageStrings.seeAll,
            clickTextButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                            products: listGroceries,
                            title: listTitle[2].title,
                          )));
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listGroceries.length > 5 ? 5 : listGroceries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listGroceries[index].image,
                      productName: listGroceries[index].name,
                      productWeight: listGroceries[index].amount,
                      productPrice: listGroceries[index].price);
                }))
      ],
    );
  }

  vegetables() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: listTitle[4].title,
            textButtonName: ExplorePageStrings.seeAll,
            clickTextButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                            products: listVegetables,
                            title: listTitle[4].title,
                          )));
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    listVegetables.length > 5 ? 5 : listVegetables.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listVegetables[index].image,
                      productName: listVegetables[index].name,
                      productWeight: listVegetables[index].amount,
                      productPrice: listVegetables[index].price);
                }))
      ],
    );
  }

  fruits() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: listTitle[1].title,
            textButtonName: ExplorePageStrings.seeAll,
            clickTextButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                            products: listFruit,
                            title: listTitle[1].title,
                          )));
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listFruit.length >= 5 ? 5 : listFruit.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listFruit[index].image,
                      productName: listFruit[index].name,
                      productWeight: listFruit[index].amount,
                      productPrice: listFruit[index].price);
                }))
      ],
    );
  }

  dairyProducts() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: listTitle[0].title,
            textButtonName: ExplorePageStrings.seeAll,
            clickTextButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                            products: listDairyProducts,
                            title: listTitle[0].title,
                          )));
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listDairyProducts.length >= 5
                    ? 5
                    : listDairyProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listDairyProducts[index].image,
                      productName: listDairyProducts[index].name,
                      productWeight: listDairyProducts[index].amount,
                      productPrice: listDairyProducts[index].price);
                }))
      ],
    );
  }

  bakeryItems() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8, bottom: 8),
          child: TopListviewLabel(
            title: listTitle[3].title,
            textButtonName: ExplorePageStrings.seeAll,
            clickTextButton: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                            products: listBakery,
                            title: listTitle[3].title,
                          )));
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.only(),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listBakery.length >= 5 ? 5 : listBakery.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListviewItems(
                      image: listBakery[index].image,
                      productName: listBakery[index].name,
                      productWeight: listBakery[index].amount,
                      productPrice: listBakery[index].price);
                }))
      ],
    );
  }

  Future<String> future() async {
    await addGroceries();
    await addVegetables();
    await addFruit();
    await addDairyProducts();
    await addBakery();
    return 'abc';
  }
}
