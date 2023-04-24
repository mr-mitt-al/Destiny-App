import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() {
  runApp(MyDestiny());
}

class MyDestiny extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        storyBrain.getStory(),
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      child: Text(
                        storyBrain.getChoice1(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Visibility(visible:storyBrain.buttonShouldBeVisible(),
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {setState(() {
                          storyBrain.nextStory(2);
                        });
                        },
                        child: Text(
                          storyBrain.getChoice2(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
