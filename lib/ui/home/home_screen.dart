import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/ui/home/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          spacing: 32.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/logo.png', width: 147),
            Text("Boas-vindas"),
            TextFormField(),
            Text("Escolha por categoria"),
            Row(
              children: List.generate(CategoriesData.listaCategories.length, (
                index,
              ) {
                return CategoryWidget(
                  category: CategoriesData.listaCategories[index],
                );
              }),
            ),
            Image.asset('assets/banners/banner_promo.png'),
            Text("Bem avaliados"),
          ],
        ),
      ),
    );
  }
}
