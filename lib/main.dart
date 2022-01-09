import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          color: Colors.blue[500],
          border: Border.all(color: Colors.black, width: 5)),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
        // Column is a vertical, linear layout.
        child: Container(
      decoration: BoxDecoration(
          color: Colors.yellow[500],
          border: Border.all(color: Colors.red, width: 10)),
      child: Column(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.blueAccent)
        // ),
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .headline6,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    ));
  }
}

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

class MyGrid extends StatelessWidget {
  const MyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500.0,
        width: 500.0,
        decoration: BoxDecoration(
            color: Colors.blue[500],
            border: const Border(
              top: BorderSide(width: 16.0, color: Colors.red),
              bottom: BorderSide(width: 16.0, color: Colors.black),
              left: BorderSide(width: 16.0, color: Colors.yellow),
              right: BorderSide(width: 16.0, color: Colors.green),
            )),
        //border: Border.all(color: Colors.black, width: 5)
        // child: Column(
        //   children: [
        //     Container(
        //       height: 200,
        //       decoration: BoxDecoration(
        //           color: Colors.blue[500],
        //           border: Border.all(color: Colors.black, width: 1)),
        //       child: Row(
        //         children: [],
        //       ),
        //     ),
        //     Container(
        //       height: 200,
        //       decoration: BoxDecoration(
        //           color: Colors.blue[500],
        //           border: Border.all(color: Colors.black, width: 1)),
        //     ),
        //     Container(
        //       height: 200,
        //       decoration: BoxDecoration(
        //           color: Colors.blue[500],
        //           border: Border.all(color: Colors.black, width: 1)),
        //     ),
        //   ],
        // )
      ),
    );
  }
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
      border: TableBorder.all(color: Colors.black),
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
            // child: TextField(
            //   keyboardType: TextInputType.number,
            //   inputFormatters: <TextInputFormatter>[
            //     FilteringTextInputFormatter.digitsOnly
            //   ],
            // ),
            child: Text('$_counter'),
          ),
        ),
        onTap: _incrementCounter,
      ),
    );
  }
}
