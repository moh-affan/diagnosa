class Penyakit {
  String _id;
  String _penyakit;
  String _deskripsi;

  Penyakit(this._id, this._penyakit, this._deskripsi);

  Penyakit.fromMap(Map<String, dynamic> obj) {
    this._id = obj["id"];
    this._penyakit = obj["penyakit"];
    this._deskripsi = obj["deskripsi"];
  }

  String get id => this._id;
  String get penyakit => this._penyakit;
  String get deskripsi => this._deskripsi;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["penyakit"] = _penyakit;
    map["deskripsi"] = _deskripsi;
    return map;
  }
}

class Gejala {
  String _id;
  String _gejala;
  Gejala(this._id, this._gejala);

  Gejala.fromMap(Map<String, dynamic> obj) {
    this._id = obj["id"];
    this._gejala = obj["gejala"];
  }

  String get id => this._id;
  String get gejala => this._gejala;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["gejala"] = _gejala;
    return map;
  }
}

class GejalaPenyakit {
  String _idGejala;
  String _listPenyakit;
  GejalaPenyakit(this._idGejala, this._listPenyakit);

  GejalaPenyakit.fromMap(Map<String, dynamic> obj) {
    this._idGejala = obj["idGejala"];
    this._listPenyakit = obj["penyakit"];
  }

  String get idGejala => this._idGejala;
  String get listPenyakit => this._listPenyakit;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["idGejala"] = _idGejala;
    map["penyakit"] = _listPenyakit;
    return map;
  }

  List<String> get penyakitToList => this._listPenyakit.split(",");
}
