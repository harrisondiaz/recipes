import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../utils/Listfood.dart';
import 'DetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final listFood = RecipeList().listFood;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hola, Santiago 👋🏻',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.lime,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("¿Qué vas a cocinar hoy?",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/pics.jpg'),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar recetas',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              SizedBox(
                  height: 120,
                  child: ListView.builder(
                      itemCount: listFood.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.lime.shade500,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage(listFood[index].image.toString()),height: 75,),
                                Text(listFood[index].name.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,

                                    )),
                              ],
                            ),
                          ),
                        );
                      })),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Recetas populares',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ver todo',
                            style: TextStyle(
                              color: Colors.lime,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(

                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                          itemCount: listFood.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      food: listFood[index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 250,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(fit: BoxFit.cover,
                                        image: AssetImage(
                                            listFood[index].image.toString(),),
                                        height: 100,

                                      ),
                                      Text(
                                        listFood[index].name.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 10)),
                                      LikeButton(
                                        size: 30,
                                        circleColor: CircleColor(
                                            start: Colors.red, end: Colors.red),
                                        bubblesColor: BubblesColor(
                                          dotPrimaryColor: Colors.red,
                                          dotSecondaryColor: Colors.red,
                                        ),
                                        padding: EdgeInsets.all(5),
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            Icons.favorite,
                                            color: isLiked ? Colors.red : Colors.grey,
                                            size: 30,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}


