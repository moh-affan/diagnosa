import 'package:diagnosa/models.dart';
import 'package:diagnosa/providers.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Master {
  PenyakitProvider penyakitProvider = new PenyakitProvider();
  GejalaProvider gejalaProvider = new GejalaProvider();
  GejalaPenyakitProvider gejalaPenyakitProvider = new GejalaPenyakitProvider();

  Future<Map<String, String>> penyakit() async {
    var databasePath = await getDatabasesPath();
    await penyakitProvider.open(join(databasePath, 'main.db'));
    var p = await penyakitProvider.getAllPenyakit();
    Map<String, String> penyakit = new Map<String, String>();
    p.forEach((px) => penyakit[px.id] = px.penyakit);
    await penyakitProvider.close();
    return penyakit;
  }

  Future<Penyakit> getPenyakit(id) async {
    var databasePath = await getDatabasesPath();
    await penyakitProvider.open(join(databasePath, 'main.db'));
    var p = await penyakitProvider.getPenyakit(id);
    return p;
  }

  Future<Map<String, String>> gejala() async {
    var databasePath = await getDatabasesPath();
    await gejalaProvider.open(join(databasePath, 'main.db'));
    var p = await gejalaProvider.getAllGejala();
    Map<String, String> gejala = new Map<String, String>();
    p.forEach((px) => gejala[px.id] = px.gejala);
    await gejalaProvider.close();
    return gejala;
  }

  Future<Map<String, String>> getGejalaPenyakit(idPenyakit) async {
    var databasePath = await getDatabasesPath();
    await penyakitProvider.open(join(databasePath, 'main.db'));
    var p = await penyakitProvider.getGejalaPenyakit(idPenyakit);
    Map<String, String> gejala = new Map<String, String>();
    p.forEach((px) => gejala[px.id] = px.gejala);
    await penyakitProvider.close();
    return gejala;
  }

  Future<Map<String, List<String>>> gejalaPenyakit() async {
    var databasePath = await getDatabasesPath();
    await gejalaPenyakitProvider.open(join(databasePath, 'main.db'));
    var p = await gejalaPenyakitProvider.getAllGejalaPenyakit();
    Map<String, List<String>> gejala = new Map<String, List<String>>();
    p.forEach((px) => gejala[px.idGejala] = px.listPenyakit.split(","));
    await gejalaPenyakitProvider.close();
    return gejala;
  }
}