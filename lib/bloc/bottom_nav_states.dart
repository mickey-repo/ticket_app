abstract class BottomNavState{}

class BottomNavBarSelected extends BottomNavState {
  final int selectedIndex;
  BottomNavBarSelected(this.selectedIndex);
}