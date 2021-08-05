import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_arti/app_string/app_routing.dart';
import 'package:flutter_arti/src/shared.dart';
import 'package:flutter_arti/src/DataProvider/single_PostProvider.dart';
import 'package:flutter_arti/src/DataProvider/postSearchProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<PostProvider>(
              builder: (context, notifier, child) {
                if (notifier.state == NotifierState.loading ||
                    notifier.state == NotifierState.initial) {
                  return Text('loading');
                } else {
                  return notifier.post.fold((failure) => Text(failure.message),
                          (post) => Text(post.body));
                }
              },
            ),
            SizedBox(height: 25.0),
            Consumer<PostSearchProvider>(
              builder: (context, notifier, child) {
                if (notifier.state == NotifierState.initial) {
                  return Text('press button Search');
                } else if (notifier.state == NotifierState.loading) {
                  return CircularProgressIndicator();
                } else {
                  return notifier.post.fold((failure) => Text(failure.message),
                          (post) => Text(post.title));
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<PostSearchProvider>().getPost(Random().nextInt(2));
                },
                child: Text('press me harder')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouting.secondPage,);
                },
                child: Text('Page One')),
          ],
        ),
      ),
    );
  }
}