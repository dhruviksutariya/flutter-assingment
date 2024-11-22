import 'package:flutter/material.dart';
import '../../../constant/constants.dart';
import '../../../firebase/firebase_service.dart';
import '../../../model/allUser.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/custom_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String _fName = '';
  String _lName = '';
  String _email = '';
  String _pass = '';
  String _conPass = '';

  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isHidden = true, _isLoading = false, _isChecked = false;

  final FirebaseService _service = FirebaseService();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('''
      Name : $_fName $_lName
      email : $_email
      pass  : $_pass $_conPass
      ''');
      setState(() => _isLoading = true);
      _service.createAccountWithEmailPassword(
        email: _email,
        password: _pass,
        onSuccess: (credential) {
          setState(() => _isLoading = false);
          if (credential.user != null) {
            print('uid : ${credential.user?.uid}');
            print('email : ${credential.user?.email}');

            AllUser mUser = AllUser(
                id: credential.user!.uid,
                fName: _fName,
                lName: _lName,
                email: _email,
                password: _pass,
                createdAt: DateTime.now().millisecondsSinceEpoch);

            _service.saveUserCredential(mUser).then((value) {
              if (value) {
                print('User Created Account successfully');
                //Navigate to Home Screen
                Navigator.pushNamedAndRemoveUntil(
                    context, AppConstant.homeView, (route) => false);
              }
            });
          }
        },
        onError: (message) {
          setState(() => _isLoading = false);
          _showSnackbar(message);
          print('error : $message');
        },
      );
    }
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
            height: MediaQuery.of(context).size.height * 0.20,
            alignment: Alignment.center,
            child:
                Icon(Icons.message, size: 100, color: AppConstant.buttonColor),
          ),
          Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppConstant.buttonColor),
          ),
          Text(
            'Create your account',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    prefixIcon:
                        Icon(Icons.person, color: AppConstant.buttonColor),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      // Make it circular
                      borderSide: BorderSide.none, // Hide the line
                    ),
                    filled: true,
                    // Enable filling the background
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        color: AppConstant.cardTextColor, fontSize: 18),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _fName = value ?? '';
                  },
                  validator: (value) {
                    return AppUtil.validateName(value);
                  },
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      // Make it circular
                      borderSide: BorderSide.none, // Hide the line
                    ),
                    filled: true,
                    // Enable filling the background
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        color: AppConstant.cardTextColor, fontSize: 18),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    _lName = value ?? '';
                  },
                  validator: (value) {
                    return AppUtil.validateLastName(value);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
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
            controller: _passwordController,
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
            height: 16,
          ),
          TextFormField(
            controller: _confPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock, color: AppConstant.buttonColor),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(100), // Make it circular
                borderSide: BorderSide.none, // Hide the line
              ),
              filled: true,
              // Enable filling the background
              fillColor: Colors.white,
              suffixIcon: Icon(
                  _isChecked ? Icons.check_circle : Icons.check_circle_outline),
              suffixIconColor: _isChecked ? Colors.green : Colors.grey.shade900,
              labelStyle:
                  TextStyle(color: AppConstant.cardTextColor, fontSize: 18),
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) {
              _conPass = value ?? '';
            },
            onChanged: (value) {
              String p = _passwordController.text;
              String c = _confPasswordController.text;

              if (p == c) {
                setState(() {
                  _isChecked = true;
                });
              } else {
                setState(() {
                  _isChecked = false;
                });
              }
            },
          ),
          SizedBox(
            height: 22,
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
                    text: 'Sign Up',
                    textColor: AppConstant.buttonTextColor,
                    onClick: () {
                      _submitForm(context);
                    },
                  ),
                ),
          SizedBox(
            height: 16,
          ),
          Center(child: Text('Or')),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style:
                    TextStyle(fontSize: 16, color: AppConstant.cardTextColor),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppConstant.loginView, (route) => false);
                },
                child: Text(
                  'Login',
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
