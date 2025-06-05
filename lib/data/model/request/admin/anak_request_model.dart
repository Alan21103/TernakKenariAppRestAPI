import 'dart:convert';

class AnakRequestModel {
    final String? noRing;
    final DateTime? tanggalLahir;
    final String? jenisKelamin;
    final String? jenisKenari;
    final String? ayahId;
    final String? ibuId;
    final String? gambarAnak;

    AnakRequestModel({
        this.noRing,
        this.tanggalLahir,
        this.jenisKelamin,
        this.jenisKenari,
        this.ayahId,
        this.ibuId,
        this.gambarAnak,
    });

    factory AnakRequestModel.fromJson(String str) => AnakRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AnakRequestModel.fromMap(Map<String, dynamic> json) => AnakRequestModel(
        noRing: json["no_ring"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        jenisKenari: json["jenis_kenari"],
        ayahId: json["ayah_id"],
        ibuId: json["ibu_id"],
        gambarAnak: json["gambar_anak"],
    );

    Map<String, dynamic> toMap() => {
        "no_ring": noRing,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "jenis_kenari": jenisKenari,
        "ayah_id": ayahId,
        "ibu_id": ibuId,
        "gambar_anak": gambarAnak,
    };
}
