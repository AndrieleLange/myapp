import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/ui/home/widgets/category_widget.dart';
import 'package:myapp/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/logo.png', width: 147),
              Text(
                "Boas-vindas",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                  color: AppColors.textColor,
                ),
              ),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'O que você deseja comer?',
                ),
              ),
              // TextFormField(),
              Text(
                "Escolha por categoria",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                  ),
                  color: AppColors.textColor,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    CategoriesData.listaCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listaCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text("Bem avaliados"),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurant.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurant[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
