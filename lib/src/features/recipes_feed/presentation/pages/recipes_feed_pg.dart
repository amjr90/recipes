import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/src/features/recipes_feed/data/repositories/recipes_repository_impl.dart';
import 'package:recipes/src/features/recipes_feed/domain/entities/recipe.dart';
import 'package:recipes/src/features/recipes_feed/presentation/bloc/recipes_feed_bloc.dart';

class RecipesFeedPage extends StatelessWidget {
  const RecipesFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RecipesRepositoryImpl(),
      child: BlocProvider(
        create: (context) => RecipesFeedBloc(
          RepositoryProvider.of<RecipesRepositoryImpl>(context),
        )..add(LoadRecipesEvent()),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<RecipesFeedBloc, RecipesFeedState>(
            builder: (context, state) {
              if (state is RecipesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RecipesLoadedState) {
                final recipes = state.recipes;
                return ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeListItem(
                      recipe: recipes[index],
                      ontap: (recipe) {},
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

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
