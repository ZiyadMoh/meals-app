import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Icon icon, Function tapHandler) {
    return ListTile(
      leading: icon,
      onTap: tapHandler,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', const Icon(Icons.restaurant), () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', const Icon(Icons.settings), () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}
