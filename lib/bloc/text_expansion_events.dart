abstract class TextExpansionEvent{}

class ToggleExpansion extends TextExpansionEvent {
  final bool isExpanded;
  ToggleExpansion(this.isExpanded);
}