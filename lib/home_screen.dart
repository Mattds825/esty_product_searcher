import 'package:etsy_search_clone/result_list.dart';
import 'package:etsy_search_clone/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState state = _HomeScreenState();
  @override
  _HomeScreenState createState() => state;
}

class _HomeScreenState extends State<HomeScreen> {
  bool searched = false;
  String search = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              SearchBar(homeScreen: widget,),
              (searched)
                  ? Expanded(
                      child: ResultList(
                        search: search,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 100),
                      child: Text('Please enter a search',),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
