import 'package:flutter/material.dart';

class PairsParent extends StatefulWidget {
  final Object startingPair;

  PairsParent(this.startingPair);

  @override
  State<StatefulWidget> createState() {
    return _PairsParentState();
  }
}

class _PairsParentState extends State<PairsParent> {
  List<Object> _pairs = [];
  @override
  void initState() {
    _pairs.add(widget.startingPair);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _pairs.add('test2');
              });
            },
            child: Text('Add pair'),
          ),
        ),
        Pairs(_pairs)
      ],
    );
  }
}

class Pairs extends StatelessWidget {
  final List<Object> pairs;

  Pairs(this.pairs);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pairs
          .map(
            (elem) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/test.jpg'),
                      Text('test')
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
