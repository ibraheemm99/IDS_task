import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: appBar(context, size),
        body: Stack(fit: StackFit.expand, children: <Widget>[

          SingleChildScrollView(
            child: Body(),
          ),
        ]));
  }

  Widget appBar(context, Size size) {
    return AppBar(
      bottom: PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(8.0),),
      elevation: 4,

      title: Text("Zait & Zatar"),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24))),
      // titleSpacing: 30,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.home_outlined),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ),
      ],
      leadingWidth: size.width * 0.3,
      leading: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {},
          ),
          // SizedBox(width: 10,),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
