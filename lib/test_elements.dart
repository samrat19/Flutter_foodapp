import 'logic/model/food_item_model.dart';
import 'logic/model/food_model.dart';

List<FoodItemModel> foodItems = [
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 1,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 2,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 3,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 4,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 5,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
  ),
];

List<FoodModel> allItems = [
  FoodModel(
    genre: 'veg',
    foodItems: foodItems,
  ),
  FoodModel(
    genre: 'chicken',
    foodItems: foodItems,
  ),
  FoodModel(
    genre: 'non-veg',
    foodItems: foodItems,
  ),
];
