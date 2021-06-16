class CharactersResponse {
  List<Character> items = [];

  CharactersResponse();

  CharactersResponse.fromJsonList(List<dynamic>? jsonList){
    if(jsonList == null) return;

    for(var item in jsonList){
      final alert = new Character.fromJsonMap(item);
      items.add(alert); 
    }
  }
}

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

    Character.fromJsonMap(Map<String, dynamic> parsedJson) {

      var episodesFromJson = parsedJson['episode'];
      List<String> episodesList = new List<String>.from(episodesFromJson);

        id          = parsedJson['id'];
        name        = parsedJson['name'];
        status      = parsedJson['status'];
        species     = parsedJson['species'];
        type        = parsedJson['type'];
        gender      = parsedJson['gender'];
        origin      = Location.fromJson(parsedJson['origin']);
        location    = Location.fromJson(parsedJson['location']);
        image       = parsedJson['image'];
        episode     = episodesList;
        url         = parsedJson['url'];
        created     = parsedJson['created'];
    }
}

class Location {
  String? name;
  String? url;

  Location({
    this.name,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> parsedJson){
    return Location(
      name: parsedJson['name'],
      url : parsedJson['url']
    );
  }
}