import 'package:flutter/material.dart';

class PizzaScreen extends StatefulWidget {
  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  List<String> ingredient = ['cheese', 'Tomato', 'Olive', 'Paneer'];
  List<String> ingredientImageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSslJva3I9KMoEs6Oc2rCGu6jpD0y7BnTrbOQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK-Y4wMG7oFJ59k1WTocPcg8tikrGI8DO3LA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMgmz1-3HgHjcdcK8rJ8dCSk-ha0JwLlZmvQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYSV5HnKqybnd6L6gNr5Pi3ZsCfm7SM0H24g&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 25),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.favorite_border, size: 25),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80),
                  Text('Pizza',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.watch_later_outlined, color: Colors.blue),
                          Text('50min',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.amber),
                          Text('4.8',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.local_fire_department,
                              color: Colors.orange),
                          Text('325 Kcal',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              color: Colors.grey.shade300,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text('\$12',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50)),
                                      color: Colors.amber,
                                      child: Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text('-',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Text('1'),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text('+',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ingredient',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Container(
                        height: 130,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 130,
                                      child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(50)),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  ingredientImageList[index]),
                                            ),
                                            Text(ingredient[index]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          'The low-moisture mozzarella gives the pizza that essential stretchy layer of cheese and it also browns nicely in the oven. The fresh mozzarella makes pristine white pools of melted, gooey cheese that look great on top and add a textural contrast to the chewier low-moisture mozzarella.'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 110,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: Colors.amber,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 7),
                                    Icon(Icons.shopping_bag_outlined, size: 30),
                                    SizedBox(width: 7),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Text('1'),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              color: Colors.grey.shade100,
            ),
          ),
          Positioned(
            top: -100,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg'),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.amber.shade700,
    );
  }
}