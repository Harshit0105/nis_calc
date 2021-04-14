import 'dart:math';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NIS Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Section { HOME, PAGE_1, PAGE_2, PAGE_3 }

class _MyHomePageState extends State<MyHomePage> {
  Section section;

  @override
  @override
  void initState() {
    super.initState();
    section = Section.HOME;
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (section) {
      case Section.HOME:
        body = HomeSection(context);
        break;

      case Section.PAGE_1:
        body = PageSection1(); //Multiplicative Inverse
        break;

      case Section.PAGE_2:
        body = PageSection2(); //Modulcar Exponential
        break;

      case Section.PAGE_3:
        body = PageSection3(); //Modulcar Exponential
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Choose formula',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  section = Section.HOME;
                });
                Navigator.of(context).pop();
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'a^(-1) mod n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "(Multiplicative Inverse)\nExtended Euclidean Algorithm"),
              onTap: () {
                setState(() {
                  section = Section.PAGE_1;
                });
                Navigator.of(context).pop();
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'a^b mod n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Modular Exponential"),
              onTap: () {
                setState(() {
                  section = Section.PAGE_2;
                });
                Navigator.of(context).pop();
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'a mod n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Modulo"),
              onTap: () {
                setState(() {
                  section = Section.PAGE_3;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}

//Modulo
class PageSection3 extends StatefulWidget {
  PageSection3({Key key}) : super(key: key);

  @override
  _PageSection3State createState() => _PageSection3State();
}

class _PageSection3State extends State<PageSection3> {
  TextEditingController aC = new TextEditingController();
  TextEditingController nC = new TextEditingController();
  String a, n;
  String result = '';
  String doModulo(int a, int n) {
    var temp1 = a ~/ n;
    var temp2 = a - temp1 * n;
    var temp3 = a % n;
    return "Quo = $temp1 \nRem= $temp2 \n$a % $n = $temp3";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A mod N",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text("A: "),
            TextField(
              controller: aC,
              keyboardType: TextInputType.number,
              onChanged: (value) => a = aC.text.trim(),
              onSubmitted: (value) => a = aC.text.trim(),
            ),
            Divider(),
            Text("N: "),
            TextField(
              controller: nC,
              keyboardType: TextInputType.number,
              onChanged: (value) => a = nC.text.trim(),
              onSubmitted: (value) => a = nC.text.trim(),
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.blue,
              child: Text("Calculate"),
              onPressed: () {
                var temp1 = doModulo(int.parse(aC.text.toString()),
                    int.parse(nC.text.toString()));
                print(temp1);
                setState(() {
                  result = temp1;
                });
              },
            ),
            Divider(),
            Text(
              result,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Moduler Exponential
class PageSection2 extends StatefulWidget {
  PageSection2({Key key}) : super(key: key);

  @override
  _PageSection2State createState() => _PageSection2State();
}

class _PageSection2State extends State<PageSection2> {
  TextEditingController aC = new TextEditingController();
  TextEditingController bC = new TextEditingController();
  TextEditingController nC = new TextEditingController();
  String a, b, n;
  String result = '';

  String doPower(int a, int b, int n) {
    var y = 1;
    int x = a;
    int z = b;
    var binary = b.toRadixString(2);
    print(binary);
    var len = binary.length;
    for (int i = 0; i < len; i++) {
      print("$y ^ 2 * $x ^ ${binary[i]}");
      y = (y * y * pow(x, int.parse(binary[i]))) % n;
    }
    print(y);
    return "$x ^ $z % $n = $y";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A^B mod N",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              color: Colors.grey,
              height: 5,
            ),
            Text("A: "),
            TextField(
              controller: aC,
              keyboardType: TextInputType.number,
              onChanged: (value) => a = aC.text.trim(),
              onSubmitted: (value) => a = aC.text.trim(),
            ),
            Divider(),
            Text("B: "),
            TextField(
              controller: bC,
              keyboardType: TextInputType.number,
              onChanged: (value) => b = bC.text.trim(),
              onSubmitted: (value) => b = bC.text.trim(),
            ),
            Divider(),
            Text("N: "),
            TextField(
              controller: nC,
              keyboardType: TextInputType.number,
              onChanged: (value) => a = nC.text.trim(),
              onSubmitted: (value) => a = nC.text.trim(),
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.blue,
              child: Text("Calculate"),
              onPressed: () {
                var temp1 = doPower(
                    int.parse(aC.text.toString()),
                    int.parse(bC.text.toString()),
                    int.parse(nC.text.toString()));
                print(temp1);
                setState(() {
                  result = temp1;
                });
              },
            ),
            Divider(),
            Text(
              result,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Multiplicative Inverse
class PageSection1 extends StatefulWidget {
  PageSection1({Key key}) : super(key: key);

  @override
  PageSection1State createState() => PageSection1State();
}

class PageSection1State extends State<PageSection1> {
  TextEditingController aC = new TextEditingController();
  TextEditingController nC = new TextEditingController();
  String a;
  String n;
  String result = '';
  String checkInverse(int a, int n) {
    var temp = n.gcd(a);
    if (temp == 1) {
      int r1 = n;
      int t1 = 0;
      int r2 = a;
      int t2 = 1;
      int q, t, r;
      while (r2 > 0) {
        q = r1 ~/ r2;
        r = r1 - q * r2;
        r1 = r2;
        r2 = r;
        t = t1 - q * t2;
        t1 = t2;
        t2 = t;
      }
      int inverse = t1 % n;
      result = "$a ^ -1 mod $n = $inverse";
    } else {
      result = "Inverse not possible gcd!=1";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A^(-1) mod N",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text("A: "),
            TextField(
              controller: aC,
              keyboardType: TextInputType.number,
              onChanged: (value) => a = aC.text.trim(),
              onSubmitted: (value) => a = aC.text.trim(),
            ),
            Divider(),
            Text("N: "),
            TextField(
              controller: nC,
              keyboardType: TextInputType.number,
              onChanged: (value) => a = nC.text.trim(),
              onSubmitted: (value) => a = nC.text.trim(),
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.blue,
              child: Text("Calculate"),
              onPressed: () {
                var temp1 = checkInverse(int.parse(aC.text.toString()),
                    int.parse(nC.text.toString()));
                print(temp1);
                setState(() {
                  result = temp1;
                });
              },
            ),
            Divider(),
            Text(
              result,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Homepage
Widget HomeSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'NIS Calculator',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ),
  );
}
