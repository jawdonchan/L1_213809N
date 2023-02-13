import 'package:SnapUp_Project/screens/fooddetail.dart';
import 'package:SnapUp_Project/widgets/sidenav.dart';
import 'package:SnapUp_Project/widgets/PopularFoods.dart';
import 'package:SnapUp_Project/data/fooditem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FoodItem> _filteredFoodItems = [];
  List<String> _priceRange = ['All', '0-10', '10-20', '20-30', '30+'];
  String _selectedPriceRange = 'All';
  double _minRating = 0.0;

  @override
  void initState() {
    super.initState();
    _filteredFoodItems = filtered;
  }

  void _filterFoodItems() {
    setState(() {
      _filteredFoodItems = filtered
          .where((filter) => double.parse(filter.rating) >= _minRating)
          .toList();
      if (_selectedPriceRange != 'All') {
        List<String> priceRange = _selectedPriceRange.split('-');
        double minPrice = double.parse(priceRange[0]);
        double maxPrice = double.parse(priceRange[1]);
        _filteredFoodItems = _filteredFoodItems
            .where((filtered) =>
                double.parse(filtered.price) >= minPrice &&
                double.parse(filtered.price) <= maxPrice)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilteredResultPage(
                    filteredFoodItems: _filteredFoodItems,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Price Range",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              value: _selectedPriceRange,
              onChanged: (value) {
                setState(() {
                  _selectedPriceRange = value;
                });
              },
              items: _priceRange.map((price) {
                return DropdownMenuItem(
                  child: Text(price),
                  value: price,
                );
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Minimum rating",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Slider(
              value: _minRating,
              onChanged: (value) {
                setState(() {
                  _minRating = value;
                });
              },
              min: 0.0,
              max: 5.0,
              divisions: 5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Food items",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final filter = filtered[index];
                return CheckboxListTile(
                  value: _filteredFoodItems.contains(filter),
                  onChanged: (value) {
                    setState(() {
                      if (value)
  {
    _filteredFoodItems.add(filter);
      } else {
          _filteredFoodItems.remove(filter);
              }
                  });
                    },
                      title: Text(filter.name),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

class FilteredResultPage extends StatelessWidget {
  final List<FoodItem> filteredFoodItems;

  const FilteredResultPage({Key key, @required this.filteredFoodItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Filtered Results"),
      ),
      body: ListView.builder(
        itemCount: filteredFoodItems.length,
        itemBuilder: (context, index) {
          final filter = filteredFoodItems[index];
          return ListTile(
            leading: Image.asset('images/' + filter.imageUrl + '.png'),
            title: Text(filter.name),
            subtitle: Text("\$${filter.price}"),
            trailing: Text(filter.rating),
            onTap: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodDetailsPage(detail: filter,)));
            },
          );
        },
      ),
    );
  }
}

