import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
          child: Center(
        child: MyTable3(),
      )),
    ),
  );
}

class MyTable extends StatelessWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 32,
              color: Colors.green,
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyTable2 extends StatelessWidget {
  const MyTable2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      defaultColumnWidth: const FixedColumnWidth(32.00),
      children: const <TableRow>[
        TableRow(children: <Widget>[
          MyCell(),
          MyCell(),
          MyCell(),
        ]),
        TableRow(children: <Widget>[
          MyCell(),
          MyCell(),
          MyCell(),
        ]),
        TableRow(children: <Widget>[
          MyCell(),
          MyCell(),
          MyCell(),
        ])
      ],
    );
  }
}

class MyTable3 extends StatelessWidget {
  const MyTable3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.blue, width: 3),
      // border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.blue, style: BorderStyle.solid)),
      defaultColumnWidth: const FixedColumnWidth(96.00),
      children: const <TableRow>[
        TableRow(children: <Widget>[
          MyTable2(),
          MyTable2(),
          MyTable2(),
        ]),
        TableRow(children: <Widget>[
          MyTable2(),
          MyTable2(),
          MyTable2(),
        ]),
        TableRow(children: <Widget>[
          MyTable2(),
          MyTable2(),
          MyTable2(),
        ])
      ],
    );
  }
}

class MyCell extends StatefulWidget {
  const MyCell({Key? key}) : super(key: key);

  @override
  _MyCellState createState() => _MyCellState();
}

class _MyCellState extends State<MyCell> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: 32,
          width: 32,
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            // child: Text('$_counter'),
          ),
        ),
        onTap: _incrementCounter,
      ),
    );
  }
}
