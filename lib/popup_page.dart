import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PopUpPage extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool? safeAreaTop;
  final bool? safeAreaBottom;
  final bool? safeAreaNavBar;
  final Color? backgroundColor;
  final Widget body;
  final bool hasAppBar;
  final double? appbarElevation;
  final double? appbarHeight;
  final Color? appBarColor;
  final Color? statusBarColor;
  final String? title;
  final bool centerTitle;
  final bool appBarWithBack;
  final dynamic result;
  final bool appBarWithMenu;
  final Widget? customLeading;
  final List<Widget>? trailingActions;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final Widget? drawer;
  final PlatformNavBar? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Future<bool> Function()? onWillPop;

  const PopUpPage({
    Key? key,
    this.scaffoldKey,
    this.safeAreaTop,
    this.safeAreaBottom,
    this.safeAreaNavBar,
    this.backgroundColor,
    this.body = const SizedBox(),
    this.hasAppBar = false,
    this.appbarElevation,
    this.appbarHeight,
    this.appBarColor,
    this.statusBarColor,
    this.title,
    this.centerTitle = false,
    this.appBarWithBack = false,
    this.result,
    this.appBarWithMenu = false,
    this.customLeading,
    this.trailingActions,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onWillPop,
  })  : assert(appBarWithMenu ^ (scaffoldKey == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? () => Future.value(true),
      child: SafeArea(
        top: safeAreaTop ?? false,
        bottom: safeAreaBottom ?? false,
        child: PlatformScaffold(
          widgetKey: scaffoldKey,
          backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          appBar: hasAppBar ? PlatformAppBar() : null,
          bottomNavBar: bottomNavigationBar,
          body: SafeArea(
            top: false,
            bottom: safeAreaNavBar ?? false,
            child: body,
          ),
          material: (_, __) {
            return MaterialScaffoldData(
              drawer: drawer,
              floatingActionButton: floatingActionButton,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
            );
          },
          cupertino: (_, __) {
            return CupertinoPageScaffoldData(
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            );
          },
        ),
      ),
    );
  }
}
