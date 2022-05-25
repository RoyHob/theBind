import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:youseff/ui/screens/about.dart';
import 'package:youseff/ui/screens/contact.dart';
import 'package:youseff/ui/screens/services.dart';
import 'package:youseff/ui/screens/team.dart';
import 'package:youseff/ui/tabNavigation/content_view.dart';
import 'package:youseff/ui/tabNavigation/custom_tab.dart';
import 'package:youseff/ui/tabNavigation/custom_tab_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenWidth;
  late double screenHeight;
  late double topPadding;
  late double bottomPadding;

  late TabController tabController;

  List<ContentView> contentsViews = [
    ContentView(tab: const CustomTab(title: "about us"), content: const About()),
    ContentView(
      tab: const CustomTab(title: "services"),
      content: const Services(),
    ),
    ContentView(
      tab: const CustomTab(title: "our team"),
      content: const Team(),
    ),
    ContentView(
      tab: const CustomTab(title: "contact"),
      content: const Contact(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentsViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.01;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: drawer(),
      backgroundColor: Colors.black.withOpacity(0.5),
      //? persistentFooterButtons: [
      //   const Center(
      //     child: Text(
      //       'TheBind-Selfcare',
      //       style: TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //   )
      // ],
      //? body: FooterView(children: [
      //   Padding(
      //     padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      //     child: LayoutBuilder(builder: (context, constraints) {
      //       if (constraints.maxWidth > 715) {
      //         return desktopView();
      //       } else {
      //         return mobileView();
      //       }
      //     }),
      //   ),
      // ], footer: Footer(child: Text("Antelias"))));
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715) {
            return desktopView();
          } else {
            return mobileView();
          }
        }),
      ),
    );
  }

  Widget desktopView() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, children: [
      CustomTabBar(
        controller: tabController,
        tabs: contentsViews.map((e) => e.tab).toList(),
      ),
      Container(
        height: screenHeight * 0.8,
        child: TabBarView(
          controller: tabController,
          children: contentsViews.map((e) => e.content).toList(),
        ),
      ),
    ]);
  }

  Widget mobileView() {
    return Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              color: Colors.white,
            )
          ],
        ));
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: contentsViews
            .map(
              (e) => Container(
                child: ListTile(
                  title: Text(e.tab.title),
                  onTap: () {},
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
