import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robodash/app/router.dart';
import 'package:robodash/core/dependency_injection/service_locator.dart';
import 'package:robodash/core/l10n/app_localizations.dart';
import 'package:robodash/core/utils/responsive.dart';
import 'package:robodash/presentation/features/bottom_nav_bar/cubit/nav_bar_cubit.dart';

class BottomNavBarView extends StatelessWidget {
  BottomNavBarView({super.key});

  final List<String> _routes = [
    '/home',
    '/control',
    '/voice',
    '/vision',
    '/more',
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> appBarTitles = [
      AppLocalizations.of(context)!.dashboard,
      AppLocalizations.of(context)!.control,
      AppLocalizations.of(context)!.voice,
      AppLocalizations.of(context)!.vision,
      AppLocalizations.of(context)!.more,
    ];

    final responsive = Responsive.of(context);
    return BlocProvider(
      create: (_) => getIt<NavBarCubit>(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          final cubit = context.read<NavBarCubit>();
          final currentIndex = cubit.currentIndex;

          final routeSettings = RouteSettings(name: _routes[currentIndex]);
          final route = AppRouter.generateRoute(routeSettings);

          Widget currentScreen = const SizedBox();
          if (route is MaterialPageRoute) {
            currentScreen = route.builder(context);
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(
                appBarTitles[currentIndex],
                style: TextStyle(
                  fontSize: responsive.font(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedFontSize: responsive.font(18),
              unselectedFontSize: responsive.font(15),

              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppLocalizations.of(context)!.bottomNavHome,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gamepad),
                  label: AppLocalizations.of(context)!.bottomNavControl,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mic),
                  label: AppLocalizations.of(context)!.bottomNavVoice,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt),
                  label: AppLocalizations.of(context)!.bottomNavVision,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: AppLocalizations.of(context)!.bottomNavMore,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
