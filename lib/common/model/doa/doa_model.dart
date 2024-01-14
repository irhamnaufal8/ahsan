class DoaItem {
  final String? judul;
  final String? arab;
  final String? latin;
  final String? arti;
  final String? keutamaan;

  DoaItem({
    this.judul,
    this.arab,
    this.latin,
    this.arti,
    this.keutamaan,
  });

  factory DoaItem.fromJson(Map<String, dynamic> json) {
    return DoaItem(
      judul: json['judul'],
      arab: json['arab'],
      latin: json['latin'],
      arti: json['arti'] ?? '',
      keutamaan: json['keutamaan'],
    );
  }
}
