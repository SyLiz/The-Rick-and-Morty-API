import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rickandmortyapi/models/character_model.dart';
import 'character_list_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCharData();
  }

  void getCharData() async {
    var characterData;
    try {
      characterData = await CharacterModel().getCharacterListData(1);
    } catch (e) {
      print(e);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CharListPage(
        firstData: characterData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
