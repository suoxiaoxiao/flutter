#### flutter学习笔记

学习源码：https://flutterchina.club/tutorials/layout/

学习目标： flutter布局

- Flutter的布局机制如何工作.
- 如何垂直和水平布局widget.
- 如何构建一个Flutter布局.

###**目标页面**

![lakes](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/lakes.jpg)

##### 1. 创建空项目

终端命令

```ruby
flutter create easyFrame
```

##### 2. 分析布局

整个界面是有4部分组成

可以看到整个界面是竖向布局

> 1. banner图片
> 2. 文章的标题，作者，点赞数和点赞
> 3. 操作按钮
> 4. 大段文案

##### 3. 第一部分， banner

这一部分就一个banner图片， 这里使用的是本地图片， 首先需要把本地图片配置到项目中

- 在工程根目录创建一个 `images` 文件夹.

- 添加 [`lake.jpg`](https://raw.githubusercontent.com/flutter/website/master/examples/layout/lakes/step5/images/lake.jpg). (请注意，wget不能保存此二进制文件。)

- 更新 [`pubspec.yaml`](https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/pubspec.yaml) 文件以包含 `assets` 标签. 这样才会使您的图片在代码中可用。

![image-20210315225456081](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/image-20210315225456081.png)

接下里开始编写代码

这里使用的是静态UI， 采用StatelessWidget

```dart
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
   };
 }
```

##### 4. 标题内容

这一块内容可以看做是横着的两大块东西组成

![WeChatc6039e638f6ffa93708327a104788c31](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/WeChatc6039e638f6ffa93708327a104788c31.png)

采用Row的方式做布局， 左侧采用Column方式布局上下两个标题

![WeChataa2ca0f838d861696e002cc006df6bf7](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/WeChataa2ca0f838d861696e002cc006df6bf7.png)

可以看到外界包装一层Container 是为了设置周边的布局

里面一层Row包含了两部分，左边是Column，右边是一个Container, 采用的布局方式是MainAxisAlignment.spaceBetween 

有几部分代码合起来为了更加好看整个结构布局

代码

```dart
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
```



##### 4. 按钮

![button-section-diagram](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/button-section-diagram.png)

可以分析到按钮也是一个row布局， 但是是平均分布且里面的内容是一个icon和一行文案， 

可以猜到，打算采用外界是Row布局， 内部是3个Column布局

![WeChatcb560e102c709df5108358dfe521e185](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/WeChatcb560e102c709df5108358dfe521e185.png)

由于内部按钮的样式一样， 就把同样的代码抽离出来做一个方法

Row采用mainAxisAlignment: MainAxisAlignment.spaceEvenly 布局， 可以均匀布局

代码

```dart
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
```



##### 5. 大段文案

这个就简单了

```dart
    // 长文本
    Widget longText = new Container(
      margin: EdgeInsets.all(32),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );
```



测试一下

代码

```dart
    return Scaffold(
      // 这里用Scaffold 是为了这个是一个page
      body: new ListView(
        // 这里如果使用Column模式展示, , 使用Column会占用全屏的布局, 但是Column不能滑动, 导致如果内容过长,则不能展示全部， 所以采用ListView来进行展示， 但是ListView不能占用全屏展示， StateBar会漏出来
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
```

效果图

![Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-15 at 23.19.42](/Users/suoxiaoxiao/Desktop/flutter_pro/easyFrame/resource/Simulator Screen Shot - iPhone 12 Pro Max - 2021-03-15 at 23.19.42.png)