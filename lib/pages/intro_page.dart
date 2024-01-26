import 'package:flutter/material.dart';
import 'package:astralbooking/ui/tapable_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.train,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
            const SizedBox(height: 25,),

            //title
            const Text(
              "Astral Train",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:20,
              ),
            ),

            const SizedBox(height: 10,),

            //Subtitle
            Text(
              "Anywhere in time and space",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 20,),

            TapableButton(
              onTap: () => Navigator.pushNamed(context, '/train_search_page'),
              child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}