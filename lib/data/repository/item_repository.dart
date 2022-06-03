
import 'package:knowledge/presentation/animation/animation.dart';
import 'package:knowledge/presentation/canvas/canvas_painter.dart';
import 'package:knowledge/presentation/list/reorderable_list.dart';
import 'package:knowledge/presentation/util/get_size.dart';
import 'package:knowledge/presentation/util/material_theme.dart';
import 'package:knowledge/presentation/sliver_app_bar/automatic_collapse_expand_sliverappbar.dart';
import 'package:knowledge/presentation/sliver_app_bar/sliver_list_with_stretch_effect.dart';

import '../../domain/model/item.dart';
import '../../presentation/sliver_app_bar/collapsed_sliverappbar_with_small_content_list.dart';
import '../../presentation/sliver_app_bar/collapsed_sliverappbar_with_tabbar.dart';
import '../../presentation/tabs_and_stretch_effect.dart';

class ItemRepository {

  static ItemRepository itemRepository = ItemRepository();

  final List<Item> list = [
    Item(title: "Автоматически скрывающийся и раскрывающий SliverAppBar", route: AutomaticCollapseExpandSliverAppBar()),
    Item(title: "Скрывающийся SliverAppBar с TabBar", route: CollapsedSliverAppBarWithTabBar()),
    Item(title: "Скрывающийся SliverAppBar с проматывающимся списком с маленьким контентом", route: const CollapsedSliverAppBarWithSmallContentList()),
    Item(title: "SliverList с Stretch эффектом", route: const SliverListWithStretchEffect()),
    Item(title: "Лист с перетягиванием", route: const ReorderableList()),
    Item(title: "Табы и Stretch эффект", route: TabsAndStretchEffect()),
    Item(title: "Включение MaterialTheme3", route: const MaterialTheme3()),
    Item(title: "Получение размера виджетов", route: const GetSize()),
    Item(title: "Простая анимация", route: const FadeAnimation()),
    Item(title: "Paint", route: CanvasPainter()),
  ];

  Item getItem(int pos) {
    return list[pos];
  }

}