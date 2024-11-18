import 'package:flutter/material.dart';
import 'package:flutter_modules/MODULE-3/60program/screen/pizza_screen.dart';

void main() => runApp(Program60());

class Program60 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Question12()
    );
  }
}

class Question12 extends StatefulWidget {
  const Question12({super.key});

  @override
  State<Question12> createState() => _Question12State();
}

class _Question12State extends State<Question12> {
  int selectedIndex = 0;
  List<String> mainProductList = [
    'Recommended',
    'Popular',
    'Noodles',
    'Pizza',
    'Pasta',
    'Burger'
  ];
  List<String> productList = [
    'Noodles',
    'Pizza',
    'Pasta',
    'Burger'
  ];
  List<String> productImageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHI6vHr6V8yiVoYNezh3ViC4ZcCD7U_0kuuw&s',
    'https://img.freepik.com/free-photo/top-view-pepperoni-pizza-with-mushroom-sausages-bell-pepper-olive-corn-black-wooden_141793-2158.jpg',
    'https://www.indianhealthyrecipes.com/wp-content/uploads/2023/05/red-sauce-pasta-recipe.jpg',
    'https://t4.ftcdn.net/jpg/05/61/78/69/360_F_561786951_IdQbtR0bga3RzISgodGvIRMFEBqmjfcn.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      alignment: Alignment.topLeft,
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
                      alignment: Alignment.topLeft,
                      icon: Icon(Icons.search, size: 25),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(
                        'Restaurant',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 85,
                                height: 32,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text('20-30min',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                ),
                              ),
                              Text('2.4km',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                              Text('Restaurant',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('Orange Sandwiches is delicious',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 40),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Card(
                            child: Center(
                              child: Text(
                                'R',
                                style: TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star_border,
                                color: Colors.amber, size: 30),
                            Text('4.7',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 5),
              Container(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: mainProductList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: ((mainProductList[index].length).toInt()) * 12,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: selectedIndex == index
                                ? Colors.amber
                                : Colors.white,
                            child: Center(
                              child: Text('${mainProductList[index]}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 450,
                    child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 150,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PizzaScreen(),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                      NetworkImage(productImageList[index]),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          productList[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'No1 in Sales',
                                          style: TextStyle(
                                              fontSize: 15, color: selectedIndex == index
                                              ? Colors.amber
                                              : Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '\$12',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                        Icon(Icons.arrow_forward_ios_outlined))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.more_horiz, size: 45, color: Colors.amber),
                  FloatingActionButton(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    onPressed: () {},
                    child: Icon(Icons.shopping_bag_outlined, size: 30),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}