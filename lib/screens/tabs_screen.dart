import 'package:flutter/material.dart';
import './filters_screen.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../Widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsScreen(this.favoritesMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  

  @override
  initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoritesMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
   List<Map<String, Object>> _pages;

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}



// this is how to make the tabs on the upper side
// DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Meals'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 text: 'Category',
//                 icon: Icon(Icons.category),
//               ),
//               Tab(
//                 text: 'Favorites',
//                 icon: Icon(Icons.star),
//               ),
//             ],
//           ),
//         ), body: TabBarView(children: [
//           CategoriesScreen(),
//           FavoriteScreen(),
//         ],),
//       ),
//     )