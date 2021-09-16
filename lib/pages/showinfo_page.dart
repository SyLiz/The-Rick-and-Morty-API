import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCharacterInfo extends StatelessWidget {
  final String name;
  final NetworkImage picture;
  final String status;
  final String species;
  final String gender;
  final String originName;
  final String locationName;

  ShowCharacterInfo(
      {required this.name,
      required this.picture,
      required this.status,
      required this.species,
      required this.gender,
      required this.originName,
      required this.locationName});

  @override
  Widget build(BuildContext context) {
    final myStyle = TextStyle(fontSize: 24);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Character'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: CircleAvatar(
              backgroundImage: picture,
              radius: 90,
            )),
          ),
          Card(
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name: $name', style: myStyle),
                  ),
                  ListTile(
                    title: Text(
                      'Species: $species',
                      style: myStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Gender: $gender',
                      style: myStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Origin name: $originName',
                      style: myStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Location name: $locationName',
                      style: myStyle,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
