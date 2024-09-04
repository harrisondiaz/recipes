import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:recipes/utils/Listfood.dart';

class DetailPage extends StatefulWidget {
  final Recipe food;

  const DetailPage({super.key, required this.food});


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      SingleChildScrollView(
        child:SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.white,),
                  SizedBox(width: 200,),
                  LikeButton(
                    size: 30,
                    circleColor:
                    CircleColor(start: Colors.red, end: Colors.red),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.white,
                        size: 30,
                      );
                    },
                  ),

                ],
              ),
              Image.asset(widget.food.image),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.food.name, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                            Text(widget.food.ingredients.length.toString() + " Ingredientes", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Tiempo de preparación: ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),),
                                Text(Random().nextInt(120).toString() + " minutos", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                              ],
                            ) ,
                            ),
                          ],

                        ),
                        )
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Ingredientes", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(top: 15)),
                            SingleChildScrollView(
                              child: Column(
                                children: widget.food.ingredients.map((ingredient) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.arrow_right, color: Colors.white,),
                                        SizedBox(width: 8), // Un poco de espacio entre el icono y el texto
                                        Expanded(
                                          child: Text(
                                            ingredient,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),


                          ],

                        ),
                        )
                      ),
                    Text("Preparación", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for(int i = 0; i < widget.food.steps.length; i++)
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text((i+1).toString() + ". ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),),
                                    SizedBox(width: 8), // Un poco de espacio entre el icono y el texto
                                    Expanded(
                                      child: Text(
                                        widget.food.steps[i],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                        ),
                        )
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}