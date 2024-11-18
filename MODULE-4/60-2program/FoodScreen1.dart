
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ToolbarDesign extends StatefulWidget {
  @override
  State<ToolbarDesign> createState() => _ToolbarDesignState();
}

final List<MenuDishes> cartItems = [];
final List<MenuDishes> orderItems = [];

class _ToolbarDesignState extends State<ToolbarDesign> {
  final List<Widget> _screenList = [
    MenuScreen(),
    AccountScreen(),
    CartScreen(),
  ];
  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.amber,
              currentIndex: _selectedScreen,
              onTap: (value) {
                _changeScreen(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outlined), label: 'Account'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              ]),
          body: _screenList[_selectedScreen],
        );
      }
    );
  }

  _changeScreen(var index) {
    setState(() {
      _selectedScreen = index;
    });
  }
}

class MenuDishes {
  String title;
  double rating;
  double price;
  int noReview;
  AssetImage image;
  MenuDishes(
      {required this.image,
        required this.title,
        required this.rating,
        required this.price,
        required this.noReview});
}

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

double _sumOfOrder() {
  double sum = 0;

  orderItems.forEach((element) {
    sum = sum + element.price.toDouble();
  });
  return sum;
}

class _MenuScreenState extends State<MenuScreen> {
  List<MenuDishes> _menuList = [
    MenuDishes(
        title: 'Vegetable And Poached Egg',
        rating: 3,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/Vegetable And Poached Egg.jpg')),
    MenuDishes(
        title: 'Avocado Salad Gluten Free',
        rating: 4,
        price: 19.28,
        noReview: 29,
        image: AssetImage('image/Avocado Salad Gluten Free.jpg')),
    MenuDishes(
        title: 'Pancakes with Orange Syrup',
        rating: 4,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/Pancakes with Orange Syrup.jpg')),
    MenuDishes(
        title: 'Vegetable Soup',
        rating: 2,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/Vegetable Soup.jpg')),
    MenuDishes(
        title: 'Burger',
        rating: 4.5,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/Burger.jpeg')),
    MenuDishes(
        title: 'Ice Cream',
        rating: 3,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/ICECREAM.jpeg')),
    MenuDishes(
        title: 'Koream Ramen',
        rating: 3,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/Koream Ramen.jpg')),
    MenuDishes(
        title: 'Manchurian',
        rating: 3,
        price: 13.50,
        noReview: 12,
        image: AssetImage('image/Manchurian.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Menu',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  CircleAvatar(child: Icon(Icons.search),backgroundColor: Colors.white,),
                  CircleAvatar(child: Icon(Icons.filter_alt_outlined),backgroundColor: Colors.white,)

                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Kinza'),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(6)),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Maman'),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Tanuki'),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Chinese'),
                ),
              ),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text('Gastrol'),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStatePropertyAll(Colors.amber.shade100)),
                  onPressed: () {},
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStatePropertyAll(Colors.amber.shade100)),
                  onPressed: () {},
                  child: Text(
                    'Salad',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStatePropertyAll(Colors.amber.shade100)),
                  onPressed: () {},
                  child: Text(
                    'Pizza',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStatePropertyAll(Colors.amber.shade100)),
                  onPressed: () {},
                  child: Text(
                    'Asian',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStatePropertyAll(Colors.amber.shade100)),
                  onPressed: () {},
                  child: Text(
                    'Burger',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                      MaterialStatePropertyAll(Colors.amber.shade100)),
                  onPressed: () {},
                  child: Text(
                    'Dessert',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 230,
          child: GridView.builder(
            padding: EdgeInsets.all(16),
            itemCount: _menuList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1 / 2),
            itemBuilder: (context, index) {
              return MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 160,
                          width: 145,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                  image: _menuList[index].image,
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
                          child: Text(
                            _menuList[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                itemSize: 20,
                                itemCount: 5,
                                rating: _menuList[index].rating,
                                unratedColor: Colors.black,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '(${_menuList[index].noReview})',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${_menuList[index].price}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              SizedBox.square(
                                dimension: 40,
                                child: FilledButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStatePropertyAll(Colors.amber),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.all(0)),
                                      shape: MaterialStatePropertyAll(
                                          ContinuousRectangleBorder())),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cartItems.insert(0, _menuList[index]);
                                      print(cartItems[0].title);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  appBar() => Padding(
    padding: EdgeInsets.only(left: 18.0, right: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        /*Container(width: 100, child: SearchBar()),*/
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_alt_outlined),
            ),
            IconButton(
                onPressed: () {
                  _showOrderSheet(context);
                },
                icon: Badge(
                    label: Text(orderItems.length.toString()),
                    child: Icon(Icons.shopping_bag_outlined)))
          ],
        )
      ],
    ),
  );

  void _showOrderSheet(BuildContext context) {
    print(' order items length : ${orderItems.length}');
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
        child: StatefulBuilder(
          builder: (context, setState) => ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Orders',
                    style: TextStyle(fontSize: 21),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() => orderItems.clear());
                      },
                      icon: Icon(Icons.delete_outline))
                ],
              ),
              Divider(),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderItems.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        title: Text(
                          orderItems[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          height: 70,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: orderItems[index].image,
                                  fit: BoxFit.fill)),
                        ),
                        trailing: Text(
                          orderItems[index].price.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      orderItems.isEmpty ? Text('') : Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total :',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      '\$ ${_sumOfOrder()}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              orderItems.isEmpty
                  ? FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey),
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Order List is empty',
                      backgroundColor: Colors.redAccent);
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.black),
                ),
              )
                  : FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Order Placed!',
                      backgroundColor: Colors.lightGreen);
                  setState(() {
                    cartItems.clear();
                  });
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double _sumOfCart() {
  double sum = 0;

  cartItems.forEach((element) {
    sum = sum + element.price.toDouble();
  });
  return sum;
}

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 18.0, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '${_showDay()}, ${DateTime.now().day}th of ${_showMonth()}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: MaterialButton(
                  textColor: Colors.grey,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      orderItems.addAll(cartItems);
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Text('Add to Order'),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      title: Center(
                        child: Column(
                          children: [
                            Text(
                              cartItems[index].title,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '-',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '+',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      leading: Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: cartItems[index].image, fit: BoxFit.fill)),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ' \$ ${cartItems[index].price.toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox.square(
                            dimension: 25,
                            child: FilledButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber),
                                  padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(0)),
                                  shape: MaterialStatePropertyAll(
                                      ContinuousRectangleBorder())),
                              child: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Divider(
              //   endIndent: 20,
              //   indent: 20,
              //   thickness: 3,
              // ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total :',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    '\$ ${_sumOfCart()}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: cartItems.isEmpty
                      ? FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.grey),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: 'Cart is empty',
                          backgroundColor: Colors.redAccent);
                      setState(() {
                        cartItems.clear();
                      });
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                      : FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.amber),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: 'Order Placed!',
                          backgroundColor: Colors.lightGreen);
                      setState(() {
                        cartItems.clear();
                      });
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _showDay() {
    String day = '';
    print(' Cart Items length  = ${cartItems.length}');
    switch (DateTime.now().weekday) {
      case 1:
        day = 'Momday';
        break;
      case 2:
        day = 'Tuesday';
        break;
      case 3:
        day = 'Wednesday';
        break;
      case 4:
        day = 'Thursday';
        break;
      case 5:
        day = 'Friday';
        break;
      case 6:
        day = 'Saturday';
        break;
      case 7:
        day = 'Sunday';
        break;
    }
    return day;
  }

  String _showMonth() {
    String month = '';
    switch (DateTime.now().month) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }
    return month;
  }
}

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Stack(children: [
                CircleAvatar(
                  radius: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      "https://www.shutterstock.com/image-vector/user-icon-trendy-flat-style-isolated-1697898655",
                      // Adjust the path to your actual image
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      height: 25,
                      width: 25,
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.only(right: 1, bottom: 1),
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          size: 15,
                        ),
                      ),
                    ))
              ]),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name : Dhruvik Sutariya",
                      style: TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      "Email : dhruviksutariya@gamil.com",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Rate Us',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          leading: Icon(Icons.star),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Share with friends',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          leading: Icon(Icons.share),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Feedback',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          leading: Icon(Icons.feedback),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          indent: 16,
          endIndent: 16,
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Theme',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Dark Mode',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dark_mode,
                size: 30,
              ),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[400],
          indent: 16,
          endIndent: 16,
        ),
        SizedBox(height: 10),
        ListTile(
          title: Text(
            'Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
          leading: Icon(Icons.logout, color: Colors.red),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'Delete your Account',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
          leading: Icon(Icons.logout, color: Colors.red),
        ),
      ],
    );
  }
}
