import 'package:dotted_line/dotted_line.dart';
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
  int _currentNoteLimit = 0;
  int _noteMaxLimit = 200;
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

  bool _isMoreThanNotesLimit() => _currentNoteLimit > 0;

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
            margin: EdgeInsets.only(bottom: 16, top: 8),
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
        onTap: () {
          _showNotesBottomSheet();
        },
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

  void _showNotesBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height - 50,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  "Add notes to your dish",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                DottedLine(
                  lineThickness: 0.2,
                  dashColor: Colors.grey,
                ),
                _notesTextArea(context),
                SizedBox(height: 16),
                DottedLine(
                  lineThickness: 0.2,
                  dashColor: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$_currentNoteLimit/$_noteMaxLimit",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _saveNoteButton(context)
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget _saveNoteButton(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor:
                _isMoreThanNotesLimit() ? Colors.green : Colors.grey,
            side: BorderSide(
                color: _isMoreThanNotesLimit() ? Colors.green : Colors.grey),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }

  Widget _notesTextArea(BuildContext context) {
    return Container(
      height: 200.0,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            _notes = value;
            _currentNoteLimit = value.length;
          });
        },
        maxLines: 7,
        cursorColor: Colors.black87,
        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 16, top: 16),
            hintText: "Example: Make my food spicy!"
        ),
        initialValue: _hasNotes() ? _notes : "",
      )
    );
  }
}
