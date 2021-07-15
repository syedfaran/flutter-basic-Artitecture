import 'package:flutter/material.dart';
import 'package:flutter_arti/src/DataProvider/postProvider.dart';
import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/resources/networkClient.dart';
import 'package:flutter_arti/src/resources/repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>PostProvider()),
  ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<PostProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                pro.updateData();
              },
              child:Text('get request'),

            ),
            if(pro.loading)CircularProgressIndicator(),
            if(pro.singlePost==null)Text('dad'),
          ],
        ),
      ),
    );
  }
}
