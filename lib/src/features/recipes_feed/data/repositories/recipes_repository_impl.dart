import 'package:either_dart/either.dart';

import '../../../../Networking/network_error.dart';
import '../../../../Networking/network_repository_impl.dart';
import '../../../../Networking/network_service.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl extends RecipesRepository {
  @override
  Future<List<Recipe>> get recipes async {
    final networkService = NetworkService(NetworkRepositoryImpl());
    const url = 'http://demo8081810.mockable.io/';
    List<Recipe> recipes = [];
    Either<NetworkException, dynamic> response =
        await networkService.getResponse(url);
    if (response.isRight) {
      final json = response.right;
      recipes = Recipe.recipeFromJson(json);
    }

    return recipes;
  }
}
