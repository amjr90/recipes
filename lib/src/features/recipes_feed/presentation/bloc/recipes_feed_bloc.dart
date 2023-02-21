import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipes/src/features/recipes_feed/domain/entities/recipe.dart';
import 'package:recipes/src/features/recipes_feed/domain/repositories/recipes_repository.dart';

part 'recipes_feed_event.dart';
part 'recipes_feed_state.dart';

class RecipesFeedBloc extends Bloc<RecipesFeedEvent, RecipesFeedState> {
  final RecipesRepository _repository;
  RecipesFeedBloc(this._repository) : super(RecipesLoadingState()) {
    on<LoadRecipesEvent>(
      (event, emit) async {
        emit(RecipesLoadingState());
        try {
          final recipes = await _repository.recipes;
          emit(RecipesLoadedState(recipes));
        } catch (e) {
          emit(const RecipesLoadedState([]));
        }
      },
    );
  }
}
