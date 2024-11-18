import 'package:flutter/material.dart';
import 'Model/UID.dart';
import 'Model/User.dart';
import 'Model/itema.dart';


class Userscreen1 extends StatefulWidget {
  User? user;

  Userscreen1({this.user});

  @override
  State<Userscreen1> createState() => _Userscreen1State();
}

class _Userscreen1State extends State<Userscreen1> {

  String emailRegx = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  String DobRegx = r'^(0[1-9]|[12][0-9]|3[01])[-/](0[1-9]|1[0-2])[-/](\d{4})$';

  //String AddressRegx = r'^\d+\s[A-z]+\s(?:[A-z]+\s)*[A-z]+,\s[A-z]+,\s[A-z]{2}\s\d{5}(?:-\d{4})?$';

  String? _Fname, _Lname, _Email, _Contact, _Dob, _Address;
  final _fomekey = GlobalKey<FormState>();

  double _corantsildervalue = 0;
  var _isChecked = false;
  var _isChecked2 = false;
  var _isChecked3 = false;
  var _isChecked4 = false;
  String? Gender = 'Male';
  int? selectedCity = null;
  int? selectedstate = null;
  List<City> CityList = [
    City(text: 'Ahemdabad', id: 1),
    City(text: 'Bhavnager', id: 2),
    City(text: 'Rajkot', id: 3),
    City(text: 'Surat', id: 4),
    City(text: 'Gandhinager', id: 5),
    City(text: 'Bharuch', id: 6),
    City(text: 'Ancleshvar', id: 7),
  ];
  List<state> stateList = [
    state(text: 'Gujarat', id: 1),
    state(text: 'Mp', id: 2),
    state(text: 'Up', id: 3),
    state(text: 'Rajasthan', id: 4),
    state(text: 'Nepal', id: 5),
    state(text: 'Panjab', id: 6),
    state(text: 'Mharastra', id: 7),
  ];

  void inserUser(User user, BuildContext context) {
    Navigator.pop(context, user);
  }

  final _FnameController = TextEditingController();
  final _LnameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _ContactController = TextEditingController();
  final _DobController = TextEditingController();
  final _AddressController = TextEditingController();


  void _updateGender(String? selection) {
    setState(() {
      Gender = selection!;
    });
  }

  @override
  void initState() {
    super.initState();

    User? U = widget.user;
    if(U != null){
      _FnameController.text = U.Fname;
      _LnameController.text = U.Lname;
      _EmailController.text = U.Email;
      _ContactController.text = U.Contact;
      _DobController.text = U.Dob;
      _AddressController.text = U.Address;
    }


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _fomekey,
                  child: Column(
                    children: [
                      Text(
                        'FILL THE FORM',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.account_circle_outlined,
                        size: 100,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _FnameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.account_circle_outlined,
                                  ),
                                  labelText: 'First name'),
                              validator: (Fname) {
                                if (Fname == null || Fname.isEmpty) {
                                  return 'Enter valid user name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _Fname = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextFormField(
                            controller: _LnameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: Icon(
                                  Icons.account_circle_outlined,
                                ),
                                labelText: 'Last name'),
                            validator: (Lname) {
                              if (Lname == null || Lname.isEmpty) {
                                return 'Enter valid user name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _Lname = value;
                            },
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _EmailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            labelText: 'Email Address'),
                        validator: (Email) {
                          if (Email == null || Email.isEmpty) {
                            return 'Email can\'t be blank';
                          } else if (!RegExp(emailRegx).hasMatch(Email)) {
                            return 'Enter valid email address';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _Email = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _ContactController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(
                              Icons.call,
                            ),
                            labelText: 'Contect'),
                        validator: (Contect) {
                          if (Contect == null || Contect.length != 10) {
                            return 'Contact must be of 10 digits';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _Contact = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _DobController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(
                              Icons.date_range_outlined,
                            ),
                            labelText: 'Date Of Bathe'),
                        validator: (Dob) {
                          if (Dob == null || Dob.isEmpty) {
                            return 'Email can\'t be blank';
                          } else if (!RegExp(DobRegx).hasMatch(Dob)) {
                            return 'Enter valid email address';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _Dob = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _AddressController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                            ),
                            labelText: 'Address'),
                        validator: (Address) {
                          if (Address == null || Address.isEmpty) {
                            return 'Email can\'t be blank';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _Address = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cityname',
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton(
                                  value: selectedCity,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  underline: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 5,
                                  ),
                                  hint: Text('---select City---'),
                                  items: List.generate(
                                      CityList.length,
                                      (index) => DropdownMenuItem(
                                            child:
                                                Text('${CityList[index].text}'),
                                            value: CityList[index].id,
                                          )),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCity = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State Nmae',
                                  style: TextStyle(fontSize: 18),
                                ),
                                DropdownButton(
                                  value: selectedstate,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  underline: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 5,
                                  ),
                                  hint: Text('---select State---'),
                                  items: List.generate(
                                      stateList.length,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                                '${stateList[index].text}'),
                                            value: stateList[index].id,
                                          )),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedstate = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Select the Gender',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Expanded(
                              child: RadioListTile(
                                title: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                value: 'MALE',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    _updateGender(value);
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: Text('female',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                value: 'FEMALE',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    _updateGender(value);
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: Text('Other',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                value: 'OTHER',
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    _updateGender(value);
                                  });
                                }),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      FilledButton(
                          onPressed: () {
                            if (_fomekey.currentState!.validate()) {
                              _fomekey.currentState!
                                  .save(); // w
                              User user = User(
                                  id: JPUti.getUniqueid(),
                                  Fname: _Fname!,
                                  Lname: _Lname!,
                                  Email: _Email!,
                                  Contact: _Contact!,
                                  Dob: _Dob!,
                                  Address: _Address!);

                              inserUser(user, context);
                            }
                          },
                          child: Text(widget.user == null?'Submit':'Update'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
