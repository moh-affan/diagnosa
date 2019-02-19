import 'package:diagnosa/models.dart';
import 'package:sqflite/sqflite.dart';

class PenyakitProvider {
  Database db;

  initDb(Database db) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS Penyakit(id TEXT PRIMARY KEY, penyakit TEXT, deskripsi TEXT)");
    await db.rawDelete("DELETE FROM Penyakit");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P001','Gingivitas (Radang Gusi)','aaa')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P002','Glositis (Radang Lidah)','bbb')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P003','Gigi Hipersensitif','gunakan pasta gigi')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P004','Abses Gigi','bbb')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P005','Pulpitis Akut (Peradangan pada Pulpa Gigi)','aaa')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P006','Periodintitis','bbb')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P007','Pericoronitis Akut (Peradangan jaringan lunak sekitar mahkota gigi)','gunakan pasta gigi')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P008','Trauma gigi dan jaringan Penyangga','bbb')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P009','Karies Gigi','aaa')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P010','Kanker Gigi','bbb')");
    await db.rawInsert(
        "INSERT INTO Penyakit(id,penyakit,deskripsi) VALUES('P011','Cheilitis (Peradangan pada sudut mulut)','gunakan pasta gigi')");
  }

  Future open(String path) async {
    this.db =
        await openDatabase(path, version: 1, onConfigure: (Database db) async {
      await initDb(db);
    }, onCreate: (Database db, int version) async {
      await initDb(db);
    });
  }

  Future<Penyakit> insert(Penyakit penyakit) async {
    await db.insert("Penyakit", penyakit.toMap());
    return penyakit;
  }

  Future<Penyakit> getPenyakit(String id) async {
    List<Map> maps = await db.query("Penyakit",
        columns: ["id", "penyakit", "deskripsi"],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Penyakit.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Penyakit>> getAllPenyakit() async {
    List<Map> maps =
        await db.query("Penyakit", columns: ["id", "penyakit", "deskripsi"]);
    if (maps.length > 0) {
      return maps.map((gj) => Penyakit.fromMap(gj)).toList();
    }
    return null;
  }

  Future<List<Gejala>> getGejalaPenyakit(String id) async {
    List<Map> maps = await db.rawQuery(
        "SELECT id,gejala FROM GejalaPenyakit INNER JOIN Gejala ON GejalaPenyakit.idGejala = Gejala.id AND GejalaPenyakit.penyakit LIKE '%$id%'");
    List<Gejala> lstGejala = new List();
    if (maps.length > 0) {
      maps.forEach((g) {
        lstGejala.add(Gejala.fromMap(g));
      });
      return lstGejala;
    }
    return null;
  }

  Future<int> delete(String id) async {
    return await db.delete("Penyakit", where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Penyakit penyakit) async {
    return await db.update("Penyakit", penyakit.toMap(),
        where: 'id = ?', whereArgs: [penyakit.id]);
  }

  Future close() async => await db.close();
}

class GejalaProvider {
  Database db;

  initDb(Database db) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS Gejala(id TEXT PRIMARY KEY, gejala TEXT)");
    await db.rawDelete("DELETE FROM Gejala");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G001','Gusi Bengkak')");
    await db
        .rawInsert("INSERT INTO Gejala(id,gejala) VALUES('G002','Gusi Nyeri')");
    await db
        .rawInsert("INSERT INTO Gejala(id,gejala) VALUES('G003','Gusi Turun')");
    await db
        .rawInsert("INSERT INTO Gejala(id,gejala) VALUES('G004','Bau Mulut')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G005','Perubahan Warna Gusi')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G006','Gusi Berdarah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G007','Lidah Membesar')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G008','Lidah Nyeri')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G009','Sulit Bicara, Makan, Menelan')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G010','Warna Lidah kemerah-merahan')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G011','Lidah Licin dan Halus')");
    await db
        .rawInsert("INSERT INTO Gejala(id,gejala) VALUES('G012','Gigi Nyeri')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G013','Penumpukan Karang gigi')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G014','Pusing dan demam')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G015','Gigi berisi  nanah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G016','Sakit saat mengunyah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G017','Pulpitis Nyeri, berdenyut')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G018','Gigi Lubang')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G019','Pulpa terbuka')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G020','Perubahan warna gigi')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G021','Pendarahan pada gusi')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G022','Gingiva kemerahan')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G023','Gigi erupsi')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G024','Luka pada gingiva')");
    await db
        .rawInsert("INSERT INTO Gejala(id,gejala) VALUES('G025','Fraktur')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G026','Bengkak/ luka pada wajah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G027','Timbul bercak coklat, kehitaman/ putih pada permukaan gigi')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G028','Sariawan tak kunjung sembuh')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G029','Bercak merah/putih dalam mulut')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G030','Sakit pada lidah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G031','Suara berubah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G032','Bengkak pada kelenjar getah bening')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G033','Rahang kaku / sakit')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G034','Tenggorokan sakit')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G035','Sudut bibir kering dan pecah-pecah')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G036','Luka pada sudut bibir')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G037','Sakit saat membuka mulut')");
    await db.rawInsert(
        "INSERT INTO Gejala(id,gejala) VALUES('G038','Sudut bibir berdarah')");
  }

  Future open(String path) async {
    this.db = await openDatabase(
      path,
      version: 1,
      onConfigure: (Database db) async {
        await initDb(db);
      },
      onCreate: (Database db, int version) async {
        await initDb(db);
      },
    );
  }

  Future<Gejala> insert(Gejala gejala) async {
    await db.insert("Gejala", gejala.toMap());
    return gejala;
  }

  Future<Gejala> getGejala(String id) async {
    List<Map> maps = await db.query("Gejala",
        columns: ["id", "gejala"], where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Gejala.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Gejala>> getAllGejala() async {
    List<Map> maps = await db.query("Gejala", columns: ["id", "gejala"]);
    // List<Map> maps = await db.rawQuery("SELECT * FROM Gejala");
    if (maps.length > 0) {
      return maps.map((gj) => Gejala.fromMap(gj)).toList();
    }
    return null;
  }

  Future<int> delete(String id) async {
    return await db.delete("Gejala", where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Gejala gejala) async {
    return await db.update("Gejala", gejala.toMap(),
        where: 'id = ?', whereArgs: [gejala.id]);
  }

  Future close() async => await db.close();
}

class GejalaPenyakitProvider {
  Database db;

  initDb(Database db) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS GejalaPenyakit(idGejala TEXT PRIMARY KEY, penyakit TEXT)");
    await db.rawDelete("DELETE FROM GejalaPenyakit");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G001','P001,P003,P004,P007')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G002','P001')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G003','P001')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G004','P001,P006')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G005','P001,P003')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G006','P001')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G007','P002')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G008','P002')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G009','P002')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G010','P002')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G011','P002')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G012','P003,P009')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G013','P003,P006')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G014','P003,P004')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G015','P004')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G016','P004,P005,P009')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G017','P005')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G018','P005,P009')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G019','P005')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G020','P006')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G021','P006,P008')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G022','P007')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G023','P007')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G024','P008')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G025','P008')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G026','P008')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G027','P009')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G028','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G029','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G030','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G031','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G032','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G033','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G034','P010')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G035','P011')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G036','P011')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G037','P011')");
    await db.rawInsert(
        "INSERT INTO GejalaPenyakit(idGejala,penyakit) VALUES('G038','P011')");
  }

  Future open(String path) async {
    db = await openDatabase(path, version: 1, onConfigure: (Database db) async {
      await initDb(db);
    }, onCreate: (Database db, int version) async {
      await initDb(db);
    });
  }

  Future<GejalaPenyakit> insert(GejalaPenyakit gejalaPenyakit) async {
    await db.insert("GejalaPenyakit", gejalaPenyakit.toMap());
    return gejalaPenyakit;
  }

  Future<GejalaPenyakit> getGejalaPenyakit(String id) async {
    List<Map> maps = await db.query("GejalaPenyakit",
        columns: ["idGejala", "penyakit"], where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return GejalaPenyakit.fromMap(maps.first);
    }
    return null;
  }

  Future<List<GejalaPenyakit>> getAllGejalaPenyakit() async {
    List<Map> maps =
        await db.query("GejalaPenyakit", columns: ["idGejala", "penyakit"]);
    if (maps.length > 0) {
      return maps.map((gj) => GejalaPenyakit.fromMap(gj)).toList();
    }
    return null;
  }

  Future<int> delete(String id) async {
    return await db.delete("GejalaPenyakit", where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(GejalaPenyakit gejalaPenyakit) async {
    return await db.update("GejalaPenyakit", gejalaPenyakit.toMap(),
        where: 'id = ?', whereArgs: [gejalaPenyakit.idGejala]);
  }

  Future close() async => await db.close();
}
