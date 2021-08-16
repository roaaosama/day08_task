import 'package:day08/models/users.dart';
import 'package:day08/ut.dart';
import 'package:day08/screens/widget/card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('heloooooooo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(9),
        children: [
          MyCard(
            content: "${widget.user.name}",
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                launchURL("mailto:${widget.user.email}");
              },
              child: Text("Email: ${widget.user.email}")),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                launchURL("tel:${widget.user.phone}");
              },
              child: Text("phone: ${widget.user.phone}")),
          SizedBox(
            height: 15,
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                launchURL("https://${widget.user.website}");
              },
              child: Text("web: ${widget.user.website}"))
        ],
      ),
    );
  }
}
