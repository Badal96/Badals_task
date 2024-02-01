import 'package:badal_task/config/colors.dart';
import 'package:badal_task/view/calls_page/calls_screen.dart';
import 'package:badal_task/view/contacts_page/contacts_screen.dart';
import 'package:badal_task/view/home_page/home_screen.dart';
import 'package:badal_task/view/messages_page/messages_screen.dart';
import 'package:flutter/material.dart';

import '../../../config/assets.dart';
import '../../config/sizes.dart';

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
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int currentIndex = 0;
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        color: UIColors.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...MainMenu.values.map(
              (e) => NavbarItem(
                  index: e.index,
                  selected: currentIndex == e.index,
                  icon: Image.asset(e.asset,
                      color: currentIndex == e.index
                          ? UIColors.textBold
                          : UIColors.textLight),
                  label: e.label,
                  onTap: changePage),
            )
          ],
        ),
      ),
      body: _body(currentIndex),
    );
  }
}

Widget _body(int index) {
  switch (index) {
    case 0:
      return const HomeScreen();

    case 1:
      return const CallsScreen();

    case 2:
      return const MessagesScreen();
    case 3:
      return const ContactsScreen();
  }
  return const HomeScreen();
}

class NavbarItem extends StatelessWidget {
  final int index;
  final Widget icon;
  final String label;
  final bool selected;
  final void Function(int index) onTap;
  const NavbarItem(
      {super.key,
      required this.index,
      required this.selected,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: AnimatedCrossFade(
        reverseDuration: const Duration(milliseconds: 200),
        duration: const Duration(milliseconds: 200),
        crossFadeState:
            selected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        secondChild: Container(
          height: 50,
          constraints: const BoxConstraints(minWidth: 60, maxWidth: 100),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: UIColors.appGreen),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            icon,
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: UIColors.textBold,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ]),
        ),
        firstChild: Container(
          width: 70,
          constraints: const BoxConstraints(maxWidth: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: UIColors.background),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            icon,
            UISize.xsmVertical,
            Text(
              label,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: UIColors.textLight),
            )
          ]),
        ),
      ),
    );
  }
}

// Navigation with TabBar

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _HomeScaffoldWithNavbar();
// }

// class _HomeScaffoldWithNavbar extends State<MainScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   final double toolBarHeight = 90;

//   @override
//   void initState() {
//     tabController = TabController(length: MainMenu.values.length, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const Drawer(),
//       bottomNavigationBar: Container(
//         color: UIColors.background,
//         height: toolBarHeight,
//         child: Theme(
//           data: Theme.of(context).copyWith(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent),
//           child: TabBar(
//             padding: const EdgeInsets.only(left: 8),
//             controller: tabController,
//             indicator: _CustomIndicator(
//               indicatorColor: UIColors.appGreen,
//               padding: const EdgeInsets.only(bottom: 40),
//             ),
//             tabs: MainMenu.values
//                 .map(
//                   (e) => _TabNavigationButton(
//                     tabController: tabController,
//                     item: e,
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: const [
//           HomeScreen(),
//           CallsScreen(),
//           MessagesScreen(),
//           ContactsScreen(),
//         ],
//       ),
//     );
//   }
// }

// class _TabNavigationButton extends StatelessWidget {
//   final TabController tabController;
//   final MainMenu item;
//   const _TabNavigationButton({
//     required this.tabController,
//     required this.item,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: tabController,
//         builder: (context, child) {
//           final selected = tabController.index == item.index;
//           final label = AutoSizeText(
//             item.label,
//             maxLines: 1,
//             minFontSize: 9,
//             style: TextStyle(
//               fontSize: 13,
//               color: selected ? UIColors.textBold : UIColors.textLight,
//               fontWeight: FontWeight.w700,
//             ),
//           );
//           final icon = Image.asset(
//             item.asset,
//             color: UIColors.textBold,
//           );

//           if (selected) {
//             return Row(
//               children: [
//                 icon,
//                 const Spacer(flex: 1),
//                 Flexible(
//                   flex: 10,
//                   child: label,
//                 )
//               ],
//             );
//           }
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon,
//               label,
//             ],
//           );
//         });
//   }
// }

// class _CustomIndicator extends Decoration {
//   final BoxPainter _painter;
//   final Color indicatorColor;
//   @override
//   final EdgeInsets padding;

//   _CustomIndicator({
//     required this.indicatorColor,
//     this.padding = EdgeInsets.zero,
//   }) : _painter = _IndicatorBox(
//           indicatorColor,
//           padding,
//         );

//   @override
//   BoxPainter createBoxPainter([void Function()? onChanged]) {
//     return _painter;
//   }
// }

// class _IndicatorBox extends BoxPainter {
//   final EdgeInsets padding;
//   final Color indicatorColor;

//   _IndicatorBox(this.indicatorColor, this.padding);

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     Paint paint = Paint()
//       ..color = indicatorColor
//       ..strokeWidth = 3.5;

//     canvas.translate(
//       offset.dx,
//       offset.dy,
//     );
//     final height = configuration.size!.height - padding.vertical;
//     final width = configuration.size!.width - padding.horizontal;

//     canvas.drawRRect(
//         RRect.fromRectAndRadius(
//             Rect.fromCenter(
//                 center: Offset(configuration.size!.width / 2,
//                     configuration.size!.height / 2),
//                 width: width,
//                 height: height),
//             const Radius.circular(100)),
//         paint);
//   }
// }
