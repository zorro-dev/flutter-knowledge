import 'dart:async';
import 'package:flutter/material.dart';

class AutomaticCollapseExpandSliverAppBar extends StatelessWidget {
  final _controller = ScrollController();

  AutomaticCollapseExpandSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.depth == 0) {
                  final minExtent = scrollNotification.metrics.minScrollExtent;
                  final maxExtent = scrollNotification.metrics.maxScrollExtent;
                  final middle = (maxExtent - minExtent) / 2;
                  final pos = scrollNotification.metrics.pixels;

                  late double? scrollTo;
                  if (minExtent < pos && pos <= middle)
                    scrollTo = minExtent;
                  else if (middle < pos && pos < maxExtent)
                    scrollTo = maxExtent;
                  if (scrollTo != null)
                    Timer(Duration(milliseconds: 1),
                            () => _controller.animateTo(scrollTo!,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease));
                }
                return false;
              },
              child: NestedScrollView(
                  controller: _controller,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        sliver: SliverAppBar(
                            expandedHeight: 200.0,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(title: const Text("Hello world"))),
                      ),
                    ];
                  },
                  body: Builder(builder: (BuildContext context) {
                    return CustomScrollView(
                      slivers: [
                        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                        SliverToBoxAdapter(
                            child: Container(
                                height: 200,
                                child: Center(child: const Text("Slivers"))))
                      ],
                    );
                  })),
            )));
  }
}
