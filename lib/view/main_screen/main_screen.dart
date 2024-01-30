import 'package:auto_size_text/auto_size_text.dart';
import 'package:badal_task/config/colors.dart';
import 'package:badal_task/view/calls_page/calls_screen.dart';
import 'package:badal_task/view/contacts_page/contacts_screen.dart';
import 'package:badal_task/view/home_page/home_screen.dart';
import 'package:badal_task/view/messages_page/messages_screen.dart';
import 'package:flutter/material.dart';

import '../../../config/assets.dart';

enum MainMenu {
  home('Home', Assets.home),
  calls('Calls', Assets.phone),
  messages('Messages', Assets.message),
  contacts('Contacts', Assets.contacts);

  final String label;
  final String asset;
  const MainMenu(this.label, this.asset);
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScaffoldWithNavbar();
}

class _HomeScaffoldWithNavbar extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final double toolBarHeight = 90;

  @override
  void initState() {
    tabController = TabController(length: MainMenu.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      bottomNavigationBar: Container(
        color: UIColors.background,
        height: toolBarHeight,
        child: Theme(
          data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: TabBar(
            padding: const EdgeInsets.only(left: 8),
            controller: tabController,
            indicator: _CustomIndicator(
              indicatorColor: UIColors.appGreen,
              padding: const EdgeInsets.only(bottom: 40),
            ),
            tabs: MainMenu.values
                .map(
                  (e) => _TabNavigationButton(
                    tabController: tabController,
                    item: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          HomeScreen(),
          CallsScreen(),
          MessagesScreen(),
          ContactsScreen(),
        ],
      ),
    );
  }
}

class _TabNavigationButton extends StatelessWidget {
  final TabController tabController;
  final MainMenu item;
  const _TabNavigationButton({
    required this.tabController,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: tabController,
        builder: (context, child) {
          final selected = tabController.index == item.index;
          final label = AutoSizeText(
            item.label,
            maxLines: 1,
            minFontSize: 9,
            style: TextStyle(
              fontSize: 13,
              color: selected ? UIColors.textBold : UIColors.textLight,
              fontWeight: FontWeight.w700,
            ),
          );
          final icon = Image.asset(
            item.asset,
            color: UIColors.textBold,
          );

          if (selected) {
            return Row(
              children: [
                icon,
                const Spacer(flex: 1),
                Flexible(
                  flex: 10,
                  child: label,
                )
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              label,
            ],
          );
        });
  }
}

class _CustomIndicator extends Decoration {
  final BoxPainter _painter;
  final Color indicatorColor;
  @override
  final EdgeInsets padding;

  _CustomIndicator({
    required this.indicatorColor,
    this.padding = EdgeInsets.zero,
  }) : _painter = _IndicatorBox(
          indicatorColor,
          padding,
        );

  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) {
    return _painter;
  }
}

class _IndicatorBox extends BoxPainter {
  final EdgeInsets padding;
  final Color indicatorColor;

  _IndicatorBox(this.indicatorColor, this.padding);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint()
      ..color = indicatorColor
      ..strokeWidth = 3.5;

    canvas.translate(
      offset.dx,
      offset.dy,
    );
    final height = configuration.size!.height - padding.vertical;
    final width = configuration.size!.width - padding.horizontal;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(configuration.size!.width / 2,
                    configuration.size!.height / 2),
                width: width,
                height: height),
            const Radius.circular(100)),
        paint);
  }
}
