import 'package:flutter/material.dart';
class GellaryScreen extends StatelessWidget {
List<Image> _galleryList=[
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
  Image(image: NetworkImage('https://i1.wp.com/www.edwud.com/wp-content/uploads/2017/05/Gallery_of_Modern_Art_Glasgow.jpg?fit=2000%2C1454&ssl=1')),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: _galleryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: _galleryList[index].image,
              ),
            ),
          ),
        ),
      ),
      height: double.maxFinite,
    );
  }
}
