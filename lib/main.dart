import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:materialdesignlogo/materialdesignlogo.dart';
import 'sample/logos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'Material Design Logo Sample',
        home: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(""),
                backgroundColor: Colors.white30,
                elevation: 2,
                pinned: true,
                collapsedHeight: 70,
                floating: false,
                expandedHeight: 120.0,
                flexibleSpace: Flexible(
                  child: Center(child: MdiLogo.materialDesignLogo()),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: Wrap(spacing: 23, runSpacing: 23,
                    children: [
//                      ...shapedLogos(BoxShape.rectangle),
//                      ...shapedLogos(BoxShape.circle),
//                      ...textShapes(),
//                      ...textList(),
                      for (var i = 0; i < 30; ++i) MdiLogo.microsoftXBox(), //
                    ],
                  ),
                )
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (i) {
                setState(() {
                  index = i;
                });
              },
              items: [
                BottomNavigationBarItem(
                  title: Text("Text"),
                  icon: Icon(MdiIcons.text),
                ),
                BottomNavigationBarItem(
                  title: Text("Icon"),
                  icon: Icon(MdiIcons.shapeSquarePlus),
                ),
                BottomNavigationBarItem(
                  title: Text("Shape"),
                  icon: Icon(MdiIcons.shape),
                ),
              ]),
//          body: IndexedStack(
//            index: index,
//            children: [
//              TextScreen(),
//              ShapeScreen(),
//              IconScreen(),
//            ],
//          ),
        ),
      );
}
