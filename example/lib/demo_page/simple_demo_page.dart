import 'package:flutter/material.dart';
import 'package:flutter_tableview/flutter_tableview.dart';

class SimpleDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple demo'),
      ),
      body: SimpleDemoPageBody(),
    );
  }
}

class SimpleDemoPageBody extends StatefulWidget {
  @override
  _SimpleDemoPageBodyState createState() => _SimpleDemoPageBodyState();
}

class _SimpleDemoPageBodyState extends State<SimpleDemoPageBody> {
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 5;
    } else if (section == 1) {
      return 10;
    } else {
      return 20;
    }
  }

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      onTap: (){
        print('click section header. -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text('I am section header -> section:$section'),
      ),
    );
  }

  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: (){
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color.fromRGBO(240, 240, 240, 1),
        ))),
        height: 50,
        child: Text('I am cell -> section:$section  row$row'),
      ),
    );
  }

  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  double _cellHeight(BuildContext context, int section, int row) {
    return 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterTableView(
        sectionCount: 3,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
      ),
    );
  }
}
