import 'package:bloc_api_flutter/app/models/user_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(this.user);
  UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 35),
              child: CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage(user == null ? '' : user.avatar),
              ),
            ),
            Text(user.firstName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            Text(user.email,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
