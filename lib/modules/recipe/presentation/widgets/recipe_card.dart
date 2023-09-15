import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.title,
    required this.ingredients,
  }) : super(key: key);

  final List<String> ingredients;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Title',
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            title,
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                  ),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Ingredients',
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            children: List.generate(ingredients.length, (index) {
              return Text(
                ingredients[index],
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                textAlign: TextAlign.center,
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
