import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

class DevelopersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Project Developers :",
              style: theme(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20,
            ),
            makeADeveloperView(
                context: context,
                name: "Hawkar Asaad",
                age:23,
                hobby:
                    "Educating yourself doesn’t have to be boring. What are you passionate about? It could be science, the oceans, or even horror films. Google your interests and become as knowledgeable as you can about your passions.",
                image:
                    "https://image.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg"),
            SizedBox(
              height: 8,
            ),
            makeADeveloperView(
                context: context,
                name: "Mohammed Ahmad",
                age: 22,
                hobby:
                    "Look for new music on music websites or Youtube or Spotify by searching for your favorite genre. You could find a band you love!",
                image:
                    "https://image.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg"),
            SizedBox(
              height: 8,
            ),
            makeADeveloperView(
                context: context,
                name: "Nohammed Qadir",
                age: 22,
                hobby:
                    "Drawing is a really enjoyable way of expressing yourself. There are lots of different ways to draw, from painting to sketching to doodling, so choose one you are comfortable with and give it a go!",
                image:
                    "https://image.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg"),
          ],
        ),
      ),
    );
  }

  Widget makeADeveloperView(
      {required BuildContext context,
      required String name,
      required int age,
      required String image,
      required String hobby}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme(context).textTheme.headline5,
                  ),
                  Text(
                    "Age: ${age.toString()}",
                    style: theme(context).textTheme.button,
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30,left: 8,bottom: 8,top: 8),
              child: Text(
                hobby,
                style: theme(context).textTheme.bodyText1,
              ),
            ),
            Positioned(
              child: RotationTransition(
                turns: new AlwaysStoppedAnimation(25 / 360),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: theme(context).accentColor,
                  ),
                  child: Text("Hobby",style: theme(context).textTheme.button,),
                ),
              ),
              right: 0,
              top: 0,
            )
          ],
        ),
      ],
    );
  }
}
