part of 'recipes_feed_bloc.dart';

abstract class RecipesFeedState extends Equatable {
  const RecipesFeedState();

  @override
  List<Object> get props => [];
}

class RecipesLoadingState extends RecipesFeedState {}

class RecipesLoadedState extends RecipesFeedState {
  final List<Recipe> recipes;

  const RecipesLoadedState(this.recipes);
  @override
  List<Object> get props => [recipes];
}
