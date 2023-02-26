import 'package:flutter/material.dart';

class CardTypeList extends StatefulWidget {
  final List<String> listTypes;
  const CardTypeList({Key? key, required this.listTypes}) : super(key: key);

  @override
  State<CardTypeList> createState() => _CardTypeListState();
}

class _CardTypeListState extends State<CardTypeList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(widget.listTypes.length, (index) {
          final type = widget.listTypes[index];
          return _cardType(type);
        }).toList(),
      ),
    );
  }

  Widget _cardType(String type) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
              type,
              style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
