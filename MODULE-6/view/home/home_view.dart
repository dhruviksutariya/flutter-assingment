import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/constants.dart';
import '../../firebase/firebase_service.dart';
import '../../model/allUser.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<AllUser> _allUser = [];

  final FirebaseService _service = FirebaseService();
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    _loadAllUser();
  }

  Future<void> _loadAllUser() async {
    List<AllUser> allUser = await _service.loadAllUser();
    allUser.removeWhere(
        (user) => user.id == FirebaseAuth.instance.currentUser!.uid);
    if (mounted) {
      setState(() {
        _allUser = allUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: AppConstant.buttonColor,
        iconTheme: IconThemeData(color: AppConstant.buttonTextColor),
        title: Text('Chatter',
            style: TextStyle(
                color: AppConstant.buttonTextColor,
                fontWeight: FontWeight.w500)),
        actions: [
          PopupMenuButton(
            iconColor: AppConstant.buttonTextColor,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Logout'),
                  onTap: () {
                    showAlertDialog(context);
                  },
                )
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _allUser.length,
        itemBuilder: (context, index) {
          AllUser allUser = _allUser[index];
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AppConstant.chatView,
                      arguments: allUser);
                },
                title: Text('${allUser.fName}'),
              ),
              Divider(),
            ],
          );
        },
      ),
    /*  body: StreamBuilder(
        stream: _service.getAllUserStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppConstant.appBarColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error.toString()}'),
            );
          } else {
            List<AllUser> allUserList = snapshot.data ?? [];
            allUserList.removeWhere(
                (user) => user.id == FirebaseAuth.instance.currentUser!.uid);

            return ListView.builder(
              itemCount: allUserList.length,
              itemBuilder: (context, index) {
                AllUser allUser = allUserList[index];
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AppConstant.chatView,
                            arguments: allUser);
                      },
                      title: Text('${allUser.fName} ${allUser.lName} '),
                      subtitle: Text('${allUser.email}'),
                    ),
                    Divider(),
                  ],
                );
              },
            );
          }
        },
      ),*/
    );
  }

  Future<void> showAlertDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Alert'),
        content: Text('Are you sure you want to Logout'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              _service.logout().then((result) {
                if (result) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppConstant.loginView, (route) => false);
                }
              });
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }
}
