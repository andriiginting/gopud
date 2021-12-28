import 'package:flutter/material.dart';

class DetailRestaurantButtonCounter extends StatefulWidget {
  const DetailRestaurantButtonCounter({Key? key}) : super(key: key);

  @override
  _DetailRestaurantButtonCounterState createState() =>
      _DetailRestaurantButtonCounterState();
}

class _DetailRestaurantButtonCounterState
    extends State<DetailRestaurantButtonCounter> {
  int _counter = 0;
  String _notes = "";

  void add() {
    setState(() {
      _counter++;
    });
  }

  void delete() {
    setState(() {
      if (_counter != 0) _counter--;
    });
  }

  bool _hasOrder() => _counter > 0;

  bool _hasNotes() => _notes.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [_addButton(context), _counterButton(context)],
      ),
    );
  }

  Widget _counterButton(BuildContext context) {
    return Visibility(
        visible: _hasOrder(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _notesButton(context),
            _counterItemButton(
              context,
              Icons.remove,
              delete,
            ),
            Text('$_counter',
                style: new TextStyle(fontSize: 14, color: Colors.black)),
            _counterItemButton(
              context,
              Icons.add,
              add,
            ),
          ],
        ));
  }

  Widget _addButton(BuildContext context) {
    return Visibility(
        visible: !_hasOrder(),
        child: InkWell(
          onTap: () {
            add();
          },
          child: Container(
            margin: EdgeInsets.only(right: 8, bottom: 16, top: 8),
            padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                border: Border.all(
                  color: Colors.green,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Add",
                    style: new TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ));
  }

  Widget _counterItemButton(
      BuildContext context, IconData icon, VoidCallback action) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: new Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: Colors.green)),
            child: Icon(
              icon,
              color: Colors.green,
              size: 20,
            ),
          )),
    );
  }

  Widget _notesButton(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                color: Colors.black12,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                !_hasNotes() ? Icons.rate_review : Icons.create_sharp,
                color: Colors.black87,
                size: 16,
              ),
              SizedBox(width: 5),
              Text("Notes",
                  style: new TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }
}
