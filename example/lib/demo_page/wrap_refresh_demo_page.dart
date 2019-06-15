import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_tableview/flutter_tableview.dart';

//tool
import 'package:example/demo_tool/route_tool.dart';

//easyrefresh
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class WrapRefreshDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple demo'),
      ),
      body: WrapRefreshDemoPageBody(),
    );
  }
}

class WrapRefreshDemoPageBody extends StatefulWidget {
  @override
  _WrapRefreshDemoPageBodyState createState() =>
      _WrapRefreshDemoPageBodyState();
}

class _WrapRefreshDemoPageBodyState extends State<WrapRefreshDemoPageBody> {
  //key for flutter_easyrefresh
  //about flutter_easyrefresh : https://github.com/xuelongqy/flutter_easyrefresh
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  //if dataSourceList data changed, must call setState(() {});
  List<List<String>> dataSourceList = [
    [
      'images/icon_00.png',
      'images/icon_01.png',
      'images/icon_02.png',
      'images/icon_03.png',
    ],
    [
      'images/icon_04.png',
      'images/icon_05.png',
      'images/icon_06.png',
      'images/icon_07.png',
      'images/icon_08.png',
    ],
  ];
  final double widthHeightRatio = 700.0 / 310.0;
  final double extraPaddingBottom = 30.0;

  //============
  //  functions
  //============
  int _rowCountAtSection(int section) {
    return this.dataSourceList[section].length;
  }

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    String message = section == 0 ? 'HOT SELL' : 'NEW';

    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: Container(
        color: Color.fromRGBO(220, 220, 220, 1),
        alignment: Alignment.center,
        height: 100,
        child: Text(
          '$message',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _cellBuilder(BuildContext context, int section, int row) {
    List<String> sectionDataList = this.dataSourceList[section];
    double paddingBottom =
        row != (sectionDataList.length - 1) ? 0 : this.extraPaddingBottom;

    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, paddingBottom),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              '${sectionDataList[row]}',
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  double _sectionHeaderHeight(BuildContext context, int section) {
    return 60;
  }

  double _cellHeight(BuildContext context, int section, int row) {
    List<String> sectionDataList = this.dataSourceList[section];
    double cellHeight = screenWidth / this.widthHeightRatio;
    cellHeight = row != (sectionDataList.length - 1)
        ? cellHeight
        : cellHeight + this.extraPaddingBottom;
    return cellHeight;
  }

  Widget _listViewFatherWidgetBuilder(BuildContext context, Widget listView) {
    return EasyRefresh(
      key: _easyRefreshKey,
      limitScroll: true,
      refreshHeader: MaterialHeader(key: _headerKey),
      refreshFooter: MaterialFooter(key: _footerKey),
      onRefresh: () async {
        print('onrefresh');
        await Future.delayed(Duration(seconds: 2));
        this.dataSourceList = this.dataSourceList.reversed.toList();
        setState(() {});
      },
      loadMore: () async {
        print('loadMore');
        setState(() {});
      },
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterTableView(
        sectionCount: this.dataSourceList.length,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
        listViewFatherWidgetBuilder: _listViewFatherWidgetBuilder,
      ),
    );
  }
}
