import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';
  final Map<String, bool> currentFilters;
  final Function saveFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;
  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, bool val, String subTitle, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: val,
      subtitle: Text(subTitle),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };

                widget.saveFilters(selectedFilters);
              },
              icon: Icon(
                Icons.save,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildSwitchListTile(
                'Gluten-free', _isGlutenFree, 'Only include gluten-free meals.',
                (newValue) {
              setState(() => _isGlutenFree = newValue);
            }),
            _buildSwitchListTile('Lactose-free', _isLactoseFree,
                'Only include lactose-free meals', (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            }),
            _buildSwitchListTile('Vegan', _isVegan, 'Only include vegan meals.',
                (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', _isVegetarian, 'Only include vegetarian meals',
                (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            }),
          ],
        ),
      ),
    );
  }
}
