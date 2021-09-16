import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/character_model.dart';
import 'package:rickandmortyapi/models/namecard_model.dart';

var characterData;

class CharListPage extends StatefulWidget {
  final firstData;
  CharListPage({this.firstData});
  @override
  _CharListPageState createState() => _CharListPageState();
}

class _CharListPageState extends State<CharListPage> {
  var selectedPage = '1';
  List<DropdownMenuItem<String>> createDropdownMenuItem() {
    List<DropdownMenuItem<String>> listDropdownMenuItem = [];

    for (int i = 1; i <= characterData['info']['pages']; i++) {
      var newItem = new DropdownMenuItem(
        child: Text(i.toString()),
        value: i.toString(),
      );
      listDropdownMenuItem.add(newItem);
    }
    return listDropdownMenuItem;
  }

  Future getCharData(page) async {
    var apiData = await CharacterModel().getCharacterListData(page);
    //print(apiData);
    characterData = apiData;
  }

  List<Widget> getCharList() {
    List<NameCardModel> charList = [];
    characterData['results'].forEach((element) {
      var newItem = NameCardModel(
          allData: element,
          id: element['id'],
          name: element['name'],
          picture: NetworkImage(element['image']));
      charList.add(newItem);
      //print(element['name']);
    });
    return charList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    characterData = widget.firstData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Rick and Morty Character'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Pages',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                DropdownButton<String>(
                  value: selectedPage,
                  items: createDropdownMenuItem(),
                  onChanged: (value) async {
                    selectedPage = value.toString();
                    await getCharData(value);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(children: getCharList()),
          )
        ],
      ),
    );
  }
}
