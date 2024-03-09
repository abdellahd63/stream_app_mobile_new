class SAV{
  String id;
  String Region;
  String Telephone;
  String Adresse;
  String Localisation;
  SAV({
    required this.id,
    required this.Region,
    required this.Telephone,
    required this.Adresse,
    required this.Localisation,
  });

  factory SAV.fromJson(Map<String, dynamic> json) {
    return SAV(
      id: json['id'].toString(),
      Region: json['Region'].toString(),
      Telephone: json['Telephone'].toString(),
      Adresse: json['Adresse'].toString(),
      Localisation: json['Localisation'].toString(),
    );
  }
}