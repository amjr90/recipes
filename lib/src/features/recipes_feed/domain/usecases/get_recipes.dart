import '../repositories/recipes_repository.dart';

class GetRecipes {
  final RecipesRepository recipesRepository;

  GetRecipes(this.recipesRepository);

  Future call() {
    return recipesRepository.recipes;
  }
}
