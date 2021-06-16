
import 'package:flutter/material.dart';
import 'package:flutter_webservice_test/api/character_api.dart';
import 'package:flutter_webservice_test/models/character_model.dart';
import 'package:flutter_webservice_test/pages/characters/widgets/card_character_widget.dart';

class CharacterListPage extends StatelessWidget {

  final  _charactersList = CharacterAPI();

  @override
  Widget build(BuildContext context) {

    _charactersList.getAllCharacters();

    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: Column(
        children: [
          _listCard()
        ],
      ),
    );
  }

  Widget _listCard() {
    return Flexible(
      child: StreamBuilder(
      stream: _charactersList.allDataStream,
      builder:  (BuildContext context, AsyncSnapshot<List<Character>> snapshot){
          if(snapshot.hasData){
            return CardCharacter(
              items: snapshot.data, 
              nextPage: _charactersList.getAllCharacters,
            );
          }
        return Container(
          height: 400.0,
          child: Center(
            child: CircularProgressIndicator()
          ),
        );
      }
      )
    );
  }
}