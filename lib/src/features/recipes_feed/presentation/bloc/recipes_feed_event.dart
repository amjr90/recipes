part of 'recipes_feed_bloc.dart';

abstract class RecipesFeedEvent extends Equatable {
  const RecipesFeedEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipesEvent extends RecipesFeedEvent {}
