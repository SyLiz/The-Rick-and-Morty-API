import 'package:rickandmortyapi/controllers/networking.dart';

const url = 'https://rickandmortyapi.com/api/character?page=';
const apiKey = '';

class CharacterModel {
  Future<dynamic> getCharacterListData(var page) async {
    NetworkHelper networkHelper = NetworkHelper('$url$page');
    var charData;
    try {
      charData = await networkHelper.fetchData();
    } catch (e) {
      print(e);
    }
    return charData;
  }
}
