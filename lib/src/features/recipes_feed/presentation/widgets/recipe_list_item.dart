import 'package:flutter/material.dart';
import 'package:recipes/src/features/recipes_feed/domain/entities/recipe.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem({
    Key? key,
    required this.recipe,
    required this.ontap,
  }) : super(key: key);

  final Recipe recipe;
  final Function(Recipe) ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => ontap(recipe),
        child: Card(
          elevation: 4,
          child: SizedBox(
            height: 150,
            child: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    recipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.black.withAlpha(150),
                  height: 30,
                  width: double.infinity,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      recipe.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
