import 'package:etsy_search_clone/home_screen.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  
  TextEditingController controller = TextEditingController();
  final HomeScreen homeScreen;
  SearchBar({ this.homeScreen});

  getSearch(){
    return controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'enter search',
                  hintStyle: TextStyle(
                    color: Colors.white38
                  )
                ),
                style: TextStyle(
                  color: Colors.white70
                ),
              ),
            ),
          ),
          MaterialButton(
            child: Text('Search', style: TextStyle(color: Colors.white70),),
            onPressed: (){
              homeScreen.state.setState(() {
                homeScreen.state.searched = true;
                homeScreen.state.search = controller.text;
              });
            },
          )
        ],
      ),
    );
  }
}