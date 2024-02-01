import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    super.key,
    required this.child,
    this.onRefresh,
    required this.bottomNavigationBar,
    required this.floatingActionButton,
  });

  final Future<void> Function()? onRefresh;
  final Widget child;
  final Widget bottomNavigationBar;
  final Widget floatingActionButton;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(top: 18, left: 12, right: 12);
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: onRefresh != null
              ? RefreshIndicator(
                  onRefresh: onRefresh!,
                  child: Padding(
                    padding: padding,
                    child: child,
                  ),
                )
              : Padding(
                  padding: padding,
                  child: child,
                ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
