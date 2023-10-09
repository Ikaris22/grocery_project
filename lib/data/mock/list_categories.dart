class ListCategories{
  final String categoriesImage ;
  final String categoriesName;
  ListCategories({required this.categoriesImage,required this.categoriesName});
}
List<ListCategories> listCategories=[
  ListCategories(
      categoriesImage: 'assets/categoriesImage/categories_groecries.png',
      categoriesName: 'Groecries'),
  ListCategories(
      categoriesImage: 'assets/categoriesImage/categories_vegetables.png',
      categoriesName: 'Vegetables'),
  ListCategories(
      categoriesImage: 'assets/categoriesImage/categories_fruits.png',
      categoriesName: 'Fruits'),
  ListCategories(
      categoriesImage: 'assets/categoriesImage/categories_beverages.png',
      categoriesName: 'Beverages')
];