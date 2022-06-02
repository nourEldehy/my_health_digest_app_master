import 'package:flutter/material.dart';
import 'package:training_and_diet_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
                child: Image.asset(
                  meal.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 80,
                ),
                ListTile(
                  subtitle: Center(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  // trailing: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         SizedBox(
                  //           width: 30,
                  //         ),
                  //         Text(
                  //           "${meal.kiloCaloriesBurnt} kcal",
                  //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                  //         ),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 4,
                  //     ),
                  //     Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         Icon(
                  //           Icons.access_time,
                  //           color: Colors.grey,
                  //         ),
                  //         SizedBox(
                  //           width: 5,
                  //         ),
                  //         Text(
                  //           "${meal.timeTaken} mins",
                  //           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Text(
                //     "Your Health",
                //     style: TextStyle(
                //       fontWeight: FontWeight.w800,
                //       fontSize: 14,
                //       color: Colors.blueGrey,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisSize: MainAxisSize.min,
                //     children: <Widget>[
                //       for (int i = 0; i < meal.ingredients.length; i++)
                //         Padding(
                //           padding: const EdgeInsets.only(bottom: 6),
                //           child: Text(
                //             meal.ingredients[i],
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Text(
                //     "Explanation",
                //     style: TextStyle(
                //       fontWeight: FontWeight.w800,
                //       fontSize: 14,
                //       color: Colors.blueGrey,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                //   child: Text(
                //     meal.preparation,
                //     style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}