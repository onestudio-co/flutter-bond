/// Model class used for defining commands
class NyCommand {
  String? name;
  int? options;
  List<String>? arguments;
  String? category;
  Function? action;

  NyCommand(
      {this.name, this.options, this.arguments, this.category, this.action});
}
