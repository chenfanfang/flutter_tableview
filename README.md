# flutter_tableview
[![pub package](https://img.shields.io/badge/pub-v1.0.1-orange.svg)](https://github.com/chenfanfang/flutter_tableView)

A flutter widget like iOS UITableview. let listView with section header and each section header will hover at the top.

## Installing:

Add the following to your `pubspec.yaml` file:

    dependencies:
      flutter_tableView: ^1.0.1

## How to use

```dart
class SimpleDemoPageBody extends StatefulWidget {
  @override
  _SimpleDemoPageBodyState createState() => _SimpleDemoPageBodyState();
}

class _SimpleDemoPageBodyState extends State<SimpleDemoPageBody> {
  // How many section.
  int sectionCount = 3;

  // Get row count.
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 5;
    } else if (section == 1) {
      return 10;
    } else {
      return 20;
    }
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text('I am section header -> section:$section'),
      ),
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color.fromRGBO(240, 240, 240, 1),
        ))),
        height: 50.0,
        child: Text('I am cell -> section:$section  row$row'),
      ),
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //FlutterTableView
      child: FlutterTableView(
        sectionCount: sectionCount,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
      ),
    );
  }
}
```


![demo_picture](https://raw.githubusercontent.com/chenfanfang/flutter_tableView/master/example/demo_picture/simpleDemo.png)





##### If you want to wrap listView with other widget (such as [flutter_easyrefresh](https://github.com/xuelongqy/flutter_easyrefresh))



```dart
FlutterTableView(
        sectionCount: this.dataSourceList.length,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
        listViewFatherWidgetBuilder: (BuildContext context, Widget listView) {
          return EasyRefresh(
            key: _easyRefreshKey,
            limitScroll: true,
            refreshHeader: MaterialHeader(key: _headerKey),
            refreshFooter: MaterialFooter(key: _footerKey),
            onRefresh: () async {},
            loadMore: () async {},
            child: listView,
          );
        },
      ),
      
// detail usage please download demo
```



## License
MIT License

Copyright (c) 2019 chenfanfang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.