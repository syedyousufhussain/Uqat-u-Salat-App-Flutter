import 'package:api_prac_3/recipelist.dart';
import "package:flutter/material.dart";

import 'recipe.api.dart';
import 'recipe.dart';

class ApiPrac4 extends StatefulWidget {
  const ApiPrac4({super.key});

  @override
  State<ApiPrac4> createState() => _ApiPrac4State();
}

class _ApiPrac4State extends State<ApiPrac4> {
  List<Recipe>? _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text("Food Recipe"),
          ],
        ),
      ),
      body: 
      // RecipeCard(title: "My Recipe", cookTime: "30 min", rating: "4.3", thumbnailUrl: "https://img.freepik.com/free-photo/burger-hamburger-cheeseburger_505751-3697.jpg?w=740&t=st=1699770772~exp=1699771372~hmac=40f6522f806013f7e59d65b5ba9b54c2aa9e74c3be582148ed5693b2c5cddc46"),
      _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes?.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes![index].name,
                      cookTime: _recipes![index].totalTime,
                      rating: _recipes![index].rating.toString(),
                      thumbnailUrl: _recipes![index].images);
                },
    ));
  }
}