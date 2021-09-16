import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapi/pages/showinfo_page.dart';

class NameCardModel extends StatelessWidget {
  final id;
  final String name;
  final NetworkImage picture;
  final allData;
  NameCardModel(
      {required this.id,
      required this.name,
      required this.picture,
      this.allData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        onTap: () {
          print(allData);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ShowCharacterInfo(
              name: allData['name'],
              picture: NetworkImage(allData['image']),
              status: allData['status'],
              species: allData['species'],
              gender: allData['gender'],
              originName: allData['origin']['name'],
              locationName: allData['location']['name'],
            );
          }));
        },
        title: Text(
          name,
          style: TextStyle(fontSize: 24.0),
        ),
        leading: Image(
          image: picture,
        ),
      ),
    );
  }
}
