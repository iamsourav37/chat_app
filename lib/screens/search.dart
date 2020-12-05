import 'package:chat_app/helper/databaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  bool haveUserSearch = false;
  QuerySnapshot searchResult;

  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  initiateSearch() async {
    String searchText = searchController.text.trim();
    if (searchText.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await databaseHelper.getUserByUsername(searchText).then((value) {
        debugPrint("Search result : $value");
        searchResult = value;
        setState(() {
          isLoading = false;
          haveUserSearch = true;
        });
      });
    }
  }

  Widget getSearchResult() {
    return haveUserSearch
        ? ListView.builder(
            itemCount: searchResult.docs.length,
            itemBuilder: (context, index) {
              var data = searchResult.docs[index].data();
              return SearchResultTile(
                email: data['email'],
                username: data['username'],
              );
            },
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 60.0,
                width: double.infinity,
                color: Colors.white10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search ...',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: MaterialButton(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          initiateSearch();
                          print("search functionality");
                        },
                        child: Icon(
                          Icons.search,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: getSearchResult()),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultTile extends StatelessWidget {
  final String username, email;

  SearchResultTile({this.username, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(23.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Spacer(),
          RaisedButton(
            onPressed: () {
              print("Go to chat room for that user");
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.0),
            color: Colors.redAccent,
            child: Text(
              "Message",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
