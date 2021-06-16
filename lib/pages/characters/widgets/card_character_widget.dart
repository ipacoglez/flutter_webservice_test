import 'package:flutter/material.dart';
import 'package:flutter_webservice_test/models/character_model.dart';

class CardCharacter extends StatelessWidget {
  
  final List<Character>? items;
  final Function nextPage;

  CardCharacter({required this.items, required this.nextPage});

  final _pageController = new PageController(initialPage: 0, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        nextPage();
      }
    });

    return Container(
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: items!.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return _card(context, items![index]);
          }
        ),
    );
  }

  Widget _card(BuildContext context, Character data){
  
    final card = Card (
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListTile(
        title: Text("${data.name}"),
        subtitle: Text("${data.status} - ${data.species} "),
        leading: CircleAvatar(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
              child: FadeInImage(
                image: NetworkImage(data.image!),
                placeholder: AssetImage('assets/no-image.png'),
                height: 200.0,
                width: 700,
                fit: BoxFit.cover
          ),
        ),
      )
      )
    );

  return GestureDetector(
    child: card,
    onTap: (){},
    );
  }
}