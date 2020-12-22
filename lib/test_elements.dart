import 'logic/model/food_item_model.dart';
import 'logic/model/food_model.dart';

List<FoodItemModel> foodItems = [
  FoodItemModel(
    foodDetails: demoText,
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
    foodDetails: demoText,
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 3,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
    foodDetails: demoText,
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 4,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
    foodDetails: demoText,
  ),
  FoodItemModel(
    isCarted: false,
    quantity: 1,
    id: 5,
    imagePath: 'asset/chicken-chowmein.jpg',
    itemName: 'Chicken Chowmein',
    itemPrice: '180/-',
    foodDetails: demoText,
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


final demoText = 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section';
