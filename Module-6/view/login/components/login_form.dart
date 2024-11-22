import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../firebase/firebase_service.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/custom_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isHidden = true, _isLoading = false;

  String? _email, _pass;
  final _formKey = GlobalKey<FormState>();
  final FirebaseService _service = FirebaseService();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _login(String _email, String _pass) {
    // show progress

    setState(() => _isLoading = true);

    _service.signInWithEmailPassword(
      email: _email,
      password: _pass,
      onSuccess: (UserCredential credential) {
        // hide progress
        setState(() => _isLoading = false);
        print('uid : ${credential.user!.uid}');
        // navigate to home
        Navigator.pushNamedAndRemoveUntil(
            context, AppConstant.homeView, (route) => false);
      },
      onError: (String message) {
        // hide progress
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email or password is incorrect'),
            duration: Duration(seconds: 5),
          ),
        );
        print('abcd : ${message}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.center,
            child: Icon(Icons.message, size: 100, color: AppConstant.buttonColor),
          ),
          Text(
            'Login',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppConstant.buttonColor),
          ),
          Text(
            'Enter your email and password',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
          ),
          SizedBox(
            height: 22,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'E-mail Id',
              prefixIcon: Icon(Icons.mail, color: AppConstant.buttonColor),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(100), // Make it circular
                borderSide: BorderSide.none, // Hide the line
              ),
              filled: true,
              fillColor: Colors.white,
              labelStyle:
                  TextStyle(color: AppConstant.cardTextColor, fontSize: 18),
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) {
              _email = value ?? '';
            },
            validator: (value) {
              return AppUtil.isValidEmail(value);
            },
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: _isHidden,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock, color: AppConstant.buttonColor),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(100), // Make it circular
                borderSide: BorderSide.none, // Hide the line
              ),
              filled: true,
              // Enable filling the background
              fillColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: () {
                  _toggleVisibility();
                },
                icon: _isHidden
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
              labelStyle:
                  TextStyle(color: AppConstant.cardTextColor, fontSize: 18),
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) {
              _pass = value ?? '';
            },
            validator: (value) {
              return AppUtil.isValidPassword(value);
            },
          ),
          SizedBox(
            height: 32,
          ),
          _isLoading
              ? Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50, top: 10, bottom: 10),
                  child: CustomButton(
                    backgroundColor: AppConstant.buttonColor,
                    text: 'Login',
                    textColor: AppConstant.buttonTextColor,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _login(_email!, _pass!);
                        print(_email);
                      }
                    },
                  ),
                ),
          SizedBox(
            height: 32,
          ),
          Center(child: Text('Or')),
          SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Donn\'t have an account?',
                style: TextStyle(fontSize: 16, color: AppConstant.cardTextColor),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppConstant.signupView, (route) => false);
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
