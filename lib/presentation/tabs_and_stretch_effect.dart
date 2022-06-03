import 'package:flutter/material.dart';

// https://github.com/flutter/flutter/issues/54059
// https://github.com/idootop/scroll_master

class TabsAndStretchEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                          pinned: true,
                          stretch: true,
                          title: Text('username'),
                          expandedHeight: 325,
                          flexibleSpace: FlexibleSpaceBar(
                              stretchModes: <StretchMode>[
                                StretchMode.zoomBackground,
                                StretchMode.blurBackground,
                              ],
                              background: Image.network(
                                  'https://i.imgur.com/QCNbOAo.png',
                                  fit: BoxFit.cover)),
                          bottom: TabBar(
                              tabs: <Widget>[Text('test1'), Text('test2')])),
                    )
                  ],
              body: TabBarView(children: [
                Center(
                  child: Builder(
                    builder: (context) => CustomScrollView(
                      slivers: <Widget>[
                        SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context)),
                        SliverFixedExtentList(
                            delegate: SliverChildBuilderDelegate(
                                (_, index) => Text('not working'),
                                childCount: 100),
                            itemExtent: 25)
                      ],
                    ),
                  ),
                ),
                Center(child: Text('working'))
              ])),
        ));
  }
}