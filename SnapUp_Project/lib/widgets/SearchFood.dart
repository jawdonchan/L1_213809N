import 'package:SnapUp_Project/screens/fooddetail.dart';

import 'PopularFoods.dart';
import 'package:SnapUp_Project/data/fooditem.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'SearchBar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<FoodItem> _filteredFoodItems = [];

  @override
  void initState() {
    super.initState();
    _filteredFoodItems = foodItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            showSearch(
            context: context, delegate: FoodItemSearchDelegate(_searchController.text));
            },
            )
            ],
            ),
            body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
            children: [
            Container(
            decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(10.0)),
            child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
            hintText: "Search food item...",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16.0),
            ),
            onChanged: (value) {
            setState(() {
            _filteredFoodItems = foodItems
            .where((foodItem) => foodItem.name
            .toLowerCase()
            .contains(value.toLowerCase()))
            .toList();
            });
            },
            ),
            ),
            Expanded(
            child: ListView.builder(
            itemCount: _filteredFoodItems.length,
            itemBuilder: (context, index) {
            return ListTile(
            title: Text(_filteredFoodItems[index].name),
            leading: Image.asset(
            "images/${_filteredFoodItems[index].imageUrl}.png",
            width: 50.0,
            height: 50.0,
            ),
            trailing: Text(_filteredFoodItems[index].price),
            );
            },
            ),
            )
            ],
            ),
            ),
            );
            }
            }
/*!!!!!*/
class FoodItemSearchDelegate extends SearchDelegate<FoodItem> {
final String _searchTerm;

FoodItemSearchDelegate(this._searchTerm);

@override
List<Widget> buildActions(BuildContext context) {
return [
IconButton(
icon: Icon(Icons.clear),
onPressed: () {
query = "";
},
)
];
}

@override
Widget buildLeading(BuildContext context) {
return IconButton(
icon: Icon(Icons.arrow_back),
onPressed: () {
close(context, null);
},
);
}

@override
Widget buildResults(BuildContext context) {
  final results = foodItems
    .where((foodItem) => foodItem.name
    .toLowerCase()
    .contains(query.toLowerCase()))
    .toList();
  return ListView.builder(
    itemCount: results.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailsPage(detail: results[index]),
            ),
          );
        },
        child: ListTile(
          title: Text(results[index].name),
          leading: Image.asset(
            "images/${results[index].imageUrl}.png",
            width: 50.0,
            height: 50.0,
          ),
          trailing: Text(results[index].price),
        ),
      );
    },
  );
}


@override
  Widget buildSuggestions(BuildContext context) {
      List<FoodItem> _filteredFoodItems = [];
        return ListView.builder(
          itemCount: _filteredFoodItems.length,
            itemBuilder: (context, index) {
              final foodItem = _filteredFoodItems[index];
                return ListTile(
                  leading: Image.asset(
                    "images/${foodItem.imageUrl}.png",
                      width: 50,
                        height: 50,
                          ),
                          title: Text(foodItem.name),
                          subtitle: Text("\$${foodItem.price}"),
                          onTap: () {
                          // navigate to food item detail page
                          Navigator.push(
                      context,
                  MaterialPageRoute(
                builder: (context) => FoodDetailsPage(detail: foodItem,),
              ),
            );
          },
        );
      },
    );
  }
}



