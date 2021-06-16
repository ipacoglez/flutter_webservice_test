import 'package:flutter/material.dart';
import 'package:flutter_webservice_test/models/character_model.dart';

class CharacterDetailsPage extends StatefulWidget {
  @override
  _CharacterDetailsPageState createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {

  @override
  Widget build(BuildContext context) {

    final Character data = ModalRoute.of(context)!.settings.arguments as Character;

    final screnSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("About ${data.name}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                  radius: 100.0,
                  child: Container(
                    child: ClipOval(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: CircleAvatar(
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
                      ),
                    ),
                  ),
                  ),
                  )
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: screnSize.height * 0.32),
                  Center(
                    child: Text(
                      "${data.name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("About"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Status"),
                          subtitle: Text("${data.status}"),
                        ),
                        ListTile(
                          title: Text("Specie"),
                          subtitle: Text("${data.species}"),
                        ),
                        ListTile(
                          title: Text("Last known location"),
                          subtitle: Text("${data.location}"),
                        ),
                        ListTile(
                          title: Text("First seen in"),
                          subtitle: Text("${data.origin!.name}"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}