import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class DishDetailScreen extends StatelessWidget {
  final Dish dish;
  final Restaurant restaurant;
  const DishDetailScreen({super.key, required this.dish, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),



      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Image.asset('assets/dishes/default.png', width: double.infinity),
            SizedBox(height: 16),
            Text(
              dish.name,
              style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textColor),
            ),
            SizedBox(height: 16),
            Text(
              "R\$ ${dish.price.toStringAsFixed(2)}",
              style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.cardText),
            ),
            SizedBox(height: 8),
            Text(
              dish.description,
              style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.cardText),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_drop_down_circle_rounded, color: AppColors.mainColor,),
                  onPressed: () {
                    bagProvider.removeDish(dish);
                  },
                ),
                Text(
                  (bagProvider.getMapByAmount()[dish] ?? 0).toString(),
                  style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.cardText),
                ),
                Transform.rotate(
                  angle: 180 * 3.14 / 180,
                  child: IconButton(
                    icon: Icon(Icons.arrow_drop_down_circle_rounded, color: AppColors.mainColor,),
                    onPressed: () {
                      bagProvider.addAllDishes([dish]);
                    },
                  ),
                ),
              ],
            ),


            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<BagProvider>().addAllDishes([dish]);
                  Navigator.pop(context);
                },
                child: Text("Adicionar"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}