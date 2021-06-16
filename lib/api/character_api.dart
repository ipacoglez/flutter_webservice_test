
import 'package:flutter/services.dart';
import 'package:flutter_webservice_test/common/constants.dart';
import 'package:flutter_webservice_test/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
// import 'package:alerta_acapulco_app/models/post_model.dart';

class CharacterAPI {

  final _url = '${Constants.BASE_URL}';
  
  int _page     = 0;
  bool _loading = false;

  List<Character> _allData = [];

  final _allDataStreamController = StreamController<List<Character>>.broadcast();

  Function(List<Character>) get allDataSink => _allDataStreamController.sink.add;

  Stream<List<Character>> get allDataStream => _allDataStreamController.stream;

  void disposeStreams(){
    _allDataStreamController.close();
  }

  Future<dynamic> getAllCharacters() async {
    
    if(_loading) return [];

    _loading = true;

    _page++;

    final uri = Uri.http(_url, "api/character", {
      'page'  : _page.toString(),
    });
    
    final headers = {
      "Content-Type" : "application/json",
    };

    try{

    final response = await http.get(uri, headers: headers);

      if(response.statusCode == 200){
        
        final decodeData = json.decode(response.body);
        
        final data = new CharactersResponse.fromJsonList(decodeData['results']);

        _allData.addAll(data.items);
        allDataSink(_allData); 

        _loading = false;

        return data.items;

      }else if(response.statusCode == 500){
        throw PlatformException(code: "500", message: "Ocurrió un error con el servidor");
      }
        throw PlatformException(code: "201", message: "Ocurrió un error inesperado. Intenta de nuevo.");

    }on PlatformException{
      return null;
    } 
    
  }

}