import 'package:day08/models/users.dart';
import 'package:day08/screens/datails.dart';
import 'package:day08/ut.dart';
import 'package:day08/screens/widget/card.dart';
import 'package:day08/service/userservice.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool loading = true;
  List<User> users = [];

  getUserList() async {
    users = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCREEN OF USERS "),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: InkWell(
                      onTap: () {
                        pushPage(context, UserDetails(users[index]));
                      },
                      child: MyCard(content: "${users[index].name}")),
                );
              },
            ),
    );
  }
}
