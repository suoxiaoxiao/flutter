import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EasyFrame(),
    );
  }
}

class EasyFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 顶部banner图片
    Widget banner = new Container(
        child: Image.asset(
      "images/banner.png",
      // 填充模式
      fit: BoxFit.fitHeight,
      // 获取当前父类的宽度
      width: MediaQuery.of(context).size.width,
    ));

    // 中间标题
    Widget title = new Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(10),
      color: Colors.grey,
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Text(
                    "Oeschinen Lake Campground",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Container(
                  child: new Text(
                    "Kandersteg, Switzerland",
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              padding: EdgeInsets.only(left: 0, right: 15, top: 0, bottom: 0),
              child: new Row(
                children: <Widget>[
                  new Image.asset(
                    "images/icon.png",
                    width: 20,
                    height: 20,
                    fit: BoxFit.fitWidth,
                  ),
                  new Container(
                    padding: EdgeInsets.only(left: 5),
                    child: new Text("41"),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  
    // 按钮
    Column buttonItem(String iconName, String label) {
      Color color = Colors.black;
      return new Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Image.asset(
            iconName,
            width: 30,
            height: 30,
            fit: BoxFit.fitWidth,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    // 按钮
    Widget btns = new Container(
      padding: EdgeInsets.only(left: 35, top: 5, right: 35, bottom: 5),
      color: Colors.red,
      child: new Container(
        padding: EdgeInsets.all(15),
        color: Colors.orange,
        child: new Row(
          //在行的主轴方向通过 MainAxisAlignment.spaceEvenly 平均的分配每个列占据的行空间
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buttonItem('images/iconone.png', 'CALL'),
            buttonItem('images/icontwo.png', 'CALL'),
            buttonItem('images/iconthree.png', 'CALL'),
          ],
        ),
      ),
    );

    // 长文本
    Widget longText = new Container(
      margin: EdgeInsets.all(32),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );

    // return new Scaffold(
    //   body: new ListView(
    //     // 直接使用listView会造成没有背景颜色, 就是当前的View就是当前ListView的高度,如果内容不足,会造成内容短缺,黑屏
    //     children: <Widget>[
    //       banner,
    //     ],
    //   ),
    // );
    // return Scaffold(
    //   // 这里用Scaffold 是为了这个是一个page
    //   body: new Column(
    //     // 这里用这个是为了使用Column模式展示, 使用ListView界面会把navi漏出来, 使用Column展示不会漏出来navi, 但是Column不能滑动, 导致如果内容过长,则不能展示全部
    //     children: <Widget>[
    //       banner,
    //       title,
    //       btns,
    //       longText,
    //       banner,
    //       title,
    //       btns,
    //       longText,
    //       banner,
    //       title,
    //       btns,
    //       longText,
    //     ],
    //   ),
    // );
    return Scaffold(
      // 这里用Scaffold 是为了这个是一个page
      body: new ListView(
        // 这里用这个是为了使用Column模式展示, 使用ListView界面会把navi漏出来, 使用Column展示不会漏出来navi, 但是Column不能滑动, 导致如果内容过长,则不能展示全部
        children: <Widget>[
          banner,
          title,
          btns,
          longText,
          banner,
          title,
          btns,
          longText,
          banner,
          title,
          btns,
          longText,
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
