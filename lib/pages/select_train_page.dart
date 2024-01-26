import 'package:astralbooking/models/trainSearchData.dart';
import 'package:flutter/material.dart';

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

class SelectTrain extends StatelessWidget {
  const SelectTrain(SearchData searchData, {super.key, required this.items});


  final SearchData items;

  @override
  Widget build(BuildContext context) {
  const items = 4;
  final List<Widget> _widget = List.generate(
    20,
        (index) => Container(
          child: Text('My title is $index'),
        )
  );  

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Milky Way to Whirpool"), //Placeholderr
            Text("28 JAN")
          ],
        ),
      ),

      body: LayoutBuilder(builder: (context, constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    items, (index) => ItemWidget(text: 'Item $index')
                  ),
                )
            )
          );
        }
      )
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}