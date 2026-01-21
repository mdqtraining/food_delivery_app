import '../data/dummy_foods.dart';
import '../models/food_model.dart';

class FoodViewModel {
  List<FoodModel> getFoodsByCategory(String categoryId) {
    return dummyFoods.where((food) => food.categoryId == categoryId).toList();
  }
}
