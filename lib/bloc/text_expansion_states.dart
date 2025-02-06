abstract class TextExpansionState{}

class TextExpansionExpanded extends TextExpansionState{
  final bool isExpanded;
  TextExpansionExpanded(this.isExpanded);
}