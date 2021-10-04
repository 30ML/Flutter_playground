import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ex_recipe/components/recipe_title.dart';
import 'package:flutter_ex_recipe/components/recipe_menu.dart';
import 'package:flutter_ex_recipe/components/recipe_list_item.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // 배경색 white로 설정
        appBar: _buildRecipeAppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), // 수평 여백 20
            child: ListView(
              //
              children: [
                RecipeTitle(),
                RecipeMenu(),
                RecipeListItem('coffee', 'Made Coffee'),
                RecipeListItem('burger', 'Made Burger'),
                RecipeListItem('pizza', 'Made Pizza'),
              ],
            )));
  }

  AppBar _buildRecipeAppBar() {
    return AppBar(
        backgroundColor: Colors.white, // AppBar 배경색: white
        elevation: 1.0, // AppBar 그림자 효과
        actions: [
          // 우측 상단에 위치
          Icon(
            CupertinoIcons.search, // Cupertino 아이콘 - saerch
            color: Colors.black,
          ),
          SizedBox(width: 15),
          Icon(
            CupertinoIcons.heart,
            color: Colors.redAccent,
          ),
          SizedBox(width: 15),
        ]);
  }
}
