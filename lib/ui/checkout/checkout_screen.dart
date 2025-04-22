import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [TextButton(onPressed: () {
          bagProvider.clearBag();
        }, child: Text("Limpar"))],
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Pedidos", textAlign: TextAlign.center,),
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return ListTile(
                      onTap: () {},
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        
                      ),
                      title: Text(dish.name),
                      subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                      trailing: SizedBox(
                        width: 40,
                        height: 100,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                bagProvider.removeDish(dish);
                              },
                              icon: Transform.rotate(angle: 180 * 3.14 / 180, 
                                child: Icon(Icons.arrow_drop_down_circle, color: AppColors.mainColor),
                              ) 
                            ),
                            Text(
                              bagProvider.getMapByAmount()[dish].toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              onPressed: () {
                                bagProvider.addAllDishes([dish]);
                              },
                              icon: Icon(Icons.arrow_drop_down_circle, color: AppColors.mainColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
