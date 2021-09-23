class SnackBuilderAction {
  final String label;
  final void Function() action;

  SnackBuilderAction({
    required this.label,
    required this.action,
  });
}
