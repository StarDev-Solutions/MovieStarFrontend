import 'package:moviestar/src/base/domain/entities/rive_model.dart';

class NavItem {
  final String titulo;
  final RiveModel rive;

  NavItem({required this.titulo, required this.rive});
}

List<NavItem> bottomNavItems = [
  NavItem(
    titulo: 'Home',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'HOME',
      stateMachineName: 'HOME_Interactivity',
    ),
  ),
  NavItem(
    titulo: 'Search',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
    ),
  ),
  NavItem(
    titulo: 'Timer',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
    ),
  ),
  NavItem(
    titulo: 'Profile',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'USER',
      stateMachineName: 'USER_Interactivity',
    ),
  ),
];