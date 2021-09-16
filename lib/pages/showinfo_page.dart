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
    MaterialColor getIcon() {
      if (status == 'Alive')
        return Colors.green;
      else if (status == 'Dead') return Colors.red;
      return Colors.grey;
    }

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      color: getIcon(),
                    ),
                    Text(
                      ' $status',
                      style: myStyle,
                    ),
                  ],
                ),
                Center(
                    child: CircleAvatar(
                  backgroundImage: picture,
                  radius: 90,
                )),
              ],
            ),
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
                      'First seen in: $originName',
                      style: myStyle,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Last known location: $locationName',
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
