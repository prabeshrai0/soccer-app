import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:footballapp/model/player.dart';
import 'package:footballapp/services/soccer_service.dart';
import 'package:footballapp/ui/Screens/soccer_app.dart';

import 'package:http/http.dart' as http;

class PlayerInfo extends StatefulWidget {
  @override
  _PlayerInfoState createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var data= SoccerApi(). getAllPlayers(_editingController.text);
    //  print('--------------------hi i am ------------------- ');
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    String url = '';
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
                future: SoccerApi().getAllPlayers(_editingController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: TypeAheadField<Player>(
                          textFieldConfiguration: TextFieldConfiguration(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(),
                                  hintText: 'Search Username')),
                          suggestionsCallback: SoccerApi().getAllPlayers,
                          itemBuilder: (context, Player suggestion) {
                            final user = suggestion;

                            return ListTile(
                              leading: (user.playerPicture == null)
                                  ? Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDcHCi77WeaP5zq2SzZZwZd8eWEfeysZYFvw&usqp=CAU',
                                          fit: BoxFit.cover))
                                  : Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                        user.playerPicture,
                                        fit: BoxFit.cover,
                                      )),
                              title: Text(user.playerName),
                            );
                          },
                          onSuggestionSelected: (Player suggestion) {
                            final user = suggestion;
                            ScaffoldMessenger.of(context)
                              ..showSnackBar(SnackBar(
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                  duration: Duration(days: 1),
                                  behavior: SnackBarBehavior.floating,
                                  // padding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                                  content: SafeArea(
                                    child: SingleChildScrollView(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 80,
                                              ),
                                              Text(
                                                user.playerName,
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              Text(user.nationality),
                                              Image.network(user.playerPicture) ??
                                                  '',
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 8),
                                                child: Text(user.description),
                                              ),
                                            ],
                                          ),
                                        )),
                                  )));
                          },
                          noItemsFoundBuilder: (context) => Container(
                            height: 100,
                            child: Text(
                              'No Users Found',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }
}
