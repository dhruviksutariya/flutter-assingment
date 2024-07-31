import 'package:flutter/material.dart';
import 'package:untitled/MODULE-3/59program/register_screen.dart';

void main() => runApp(Program59());

class Program59 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: LoginScreen()
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool ischeckedeye = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginScreen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                         ),
                    )),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                     ),
                ),
                SizedBox(height: 5),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      hintText: 'Enter your Email',
                      hintStyle:
                      TextStyle( height: 2.5),
                      prefixIcon: Icon(Icons.mail),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 5),
                Container(
                  child: TextField(
                    obscureText: !ischeckedeye,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      hintText: 'Enter your Password',
                      hintStyle:
                      TextStyle(height: 2.5),
                      prefixIcon: Icon(Icons.lock,),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            ischeckedeye = !ischeckedeye;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: ischeckedeye == true
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                      filled: true,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ],
                ),
                Row(
                  children: [
                    // SizedBox(width: 15),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '-OR-',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in with',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      hoverColor: Colors.red,
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        NetworkImage('https://z-m-static.xx.fbcdn.net/rsrc.php/v3/yD/r/5D8s-GsHJlJ.png'),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://yt3.googleusercontent.com/viNp17XpEF-AwWwOZSj_TvgobO1CGmUUgcTtQoAG40YaYctYMoUqaRup0rTxxxfQvWw3MvhXesw=s900-c-k-c0x00ffffff-no-rj'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an Account?',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationForm(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//
//