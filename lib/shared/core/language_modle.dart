class LanguageModel {
  LanguageModel({
    required this.flagPath,
    required this.name,
    this.code,
  });

  String flagPath;
  String name;
  String? code;

  String getFlagPath() {
    return flagPath;
  }

  String getName() {
    return name;
  }

  String? getCode() {
    return code;
  }
}
