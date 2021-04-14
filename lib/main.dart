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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Section { HOME, PAGE_1, PAGE_2 }

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
        body = Page1Section(context);
        break;

      case Section.PAGE_2:
        body = Page2Section(context);
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
              subtitle: Text("Modular Power"),
              onTap: () {
                setState(() {
                  section = Section.PAGE_2;
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

Widget Page2Section(BuildContext context) {
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
              'a^b mod n',
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

Widget Page1Section(BuildContext context) {
  TextEditingController aC = new TextEditingController();
  TextEditingController nC = new TextEditingController();
  String a;
  String n;
  String result = '';
  String checkInverse(int a, int n) {
    var temp = n.gcd(a);
    // if temp==1:

    // def MultiplicativeInverse(n, a):
    // r1 = int(n)
    // t1 = 0
    // r2 = int(a)
    // t2 = 1
    // while(r2 > 0):
    //     q = r1//r2
    //     r = r1-q*r2
    //     r1 = r2
    //     r2 = r
    //     t = t1-q*t2
    //     t1 = t2
    //     t2 = t
    // gcd = r1
    // result = t1
    // if gcd != 1:
    //     return False, 0
    // else:
    //     result = result % n
    //     return True, result
  }

  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("A: "),
        TextField(
          controller: aC,
          keyboardType: TextInputType.number,
          onChanged: (value) => a = aC.text.trim(),
        ),
        Divider(),
        Text("N: "),
        TextField(
          controller: nC,
          keyboardType: TextInputType.number,
          onChanged: (value) => a = nC.text.trim(),
        ),
        Divider(),
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.blue,
          child: Text("Calculate"),
          onPressed: () {},
        ),
        Divider(),
      ],
    ),
  );
}

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
