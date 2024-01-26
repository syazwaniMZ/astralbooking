import 'package:flutter/material.dart';
import 'package:practice_flutter_project/ui/list_tile_component.dart';

class  MenuDrawer extends StatelessWidget{
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: 
        
        [
          Column(children: [
            DrawerHeader(
            child: Icon(
              Icons.train_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,)
              ),

            const SizedBox(height: 25,),

            ListTileWidget(
              text: "Search",
              icon: Icons.search,
              onTap: () {
                //pop drawer first
                Navigator.pop(context);

                //go to booking page
                Navigator.pushNamed(context, '/train_search_page');

                }
              ),

            ListTileWidget(
              text: "Booking",
              icon: Icons.confirmation_number,
              onTap: ()
              {
                //pop drawer first
                Navigator.pop(context);

                //go to booking page
                Navigator.pushNamed(context, '/train_search_page');

              }
              ),
            ],
          ),
          //Drawer Header: Logo
          
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ListTileWidget(
              text: "Exit",
              icon: Icons.logout,
              onTap: (){}),
            )
                
        ],
      )
    );
  }
  
}