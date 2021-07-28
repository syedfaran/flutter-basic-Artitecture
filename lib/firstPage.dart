import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tex = Theme.of(context).textTheme;
    final butt = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello Theme'),
      ),
      body: Wrap(
        children: [
          Text('Text headline1 Theme',style: tex.headline1,),
          Text('Text headline2 Theme',style: tex.headline2,),
          Text('Text headline3 Theme',style: tex.headline3,),
          Text('Text headline4 Theme',style: tex.headline4,),
          Text('Text headline5 Theme',style: tex.headline5,),
          Text('Text headline6 Theme',style: tex.headline6,),
          Text('Text TextBody1 Theme',style: tex.bodyText1),
          Text('Text TextBody2 Theme',style: tex.bodyText2),
          Text('Text subtitle1 Theme',style: tex.subtitle1),
          Text('Text subtitle2 Theme',style: tex.subtitle2),
          ElevatedButton(onPressed: (){}, child: Text('ElevatedButton'),),
          OutlinedButton(onPressed: (){}, child: Text('Oulined Button')),
          TextButton(onPressed: (){}, child: Text('Text Button')),
          TextButtonTheme(data: butt.textButtonTheme, child: Text('TextButtonTheme')),
        ],
      ),
    );
  }
}
