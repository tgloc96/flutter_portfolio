import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {

  const ActivityIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CupertinoActivityIndicator(
              radius: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
