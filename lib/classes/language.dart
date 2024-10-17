class Language {
  final int id;
  final String languageCode;

  Language(this.id, this.languageCode);

  static List<Language> languageList() {
    return <Language>[Language(0, "en"), Language(1, "ru"), Language(2, "de")];
  }
}
