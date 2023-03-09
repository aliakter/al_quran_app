// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, sort_child_properties_last

class SurahTranslationList{
  final List<SurahTranslation> translationList;
  SurahTranslationList({required this.translationList});

  factory SurahTranslationList.fromJson(Map<String, dynamic> map) {
    Iterable translation = map['result'];
    List<SurahTranslation> list = translation.map((e) => SurahTranslation.fromJson(e)).toList();
    print(list.length);
    return SurahTranslationList(translationList: list);
  }
}

class SurahTranslation{
  String? sura;
  String? aya;
  String? arabic_text;
  String? translation;

  SurahTranslation({required this.sura, required this.aya, required this.arabic_text, required this.translation});

  factory SurahTranslation.fromJson(Map<String, dynamic> json) {
    return SurahTranslation(
      sura: json['sura'],
      aya: json['aya'],
      arabic_text: json['arabic_text'],
      translation: json['translation'],
    );
  }
}