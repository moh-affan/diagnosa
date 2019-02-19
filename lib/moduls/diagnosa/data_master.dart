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

final penyakit_ = {
  'P001': 'Gingivitas (Radang Gusi)',
  'P002': 'Glositis (Radang Lidah)',
  'P003': 'Gigi Hipersensitif',
  'P004': 'Abses Gigi',
  'P005': 'Pulpitis Akut (Peradangan pada Pulpa Gigi)',
  'P006': 'Periodintitis',
  'P007': 'Pericoronitis Akut (Peradangan jaringan lunak sekitar mahkota gigi)',
  'P008': 'Trauma gigi dan jaringan Penyangga',
  'P009': 'Karies Gigi',
  'P010': 'Kanker Gigi',
  'P011': 'Cheilitis (Peradangan pada sudut mulut)'
};
final gejala_ = {
  'G001': 'Gusi Bengkak',
  'G002': 'Gusi Nyeri',
  'G003': 'Gusi Turun',
  'G004': 'Bau Mulut',
  'G005': 'Perubahan Warna Gusi',
  'G006': 'Gusi Berdarah',
  'G007': 'Lidah Membesar',
  'G008': 'Lidah Nyeri',
  'G009': 'Sulit Bicara, Makan, Menelan',
  'G010': 'Warna Lidah kemerah-merahan',
  'G011': 'Lidah Licin dan Halus',
  'G012': 'Gigi Nyeri',
  'G013': 'Penumpukan Karang gigi',
  'G014': 'Pusing dan demam',
  'G015': 'Gigi berisi  nanah',
  'G016': 'Sakit saat mengunyah',
  'G017': 'Pulpitis Nyeri, berdenyut',
  'G018': 'Gigi Lubang',
  'G019': 'Pulpa terbuka',
  'G020': 'Perubahan warna gigi',
  'G021': 'Pendarahan pada gusi',
  'G022': 'Gingiva kemerahan',
  'G023': 'Gigi erupsi',
  'G024': 'Luka pada gingiva',
  'G025': 'Fraktur',
  'G026': 'Bengkak/ luka pada wajah',
  'G027': 'Timbul bercak coklat, kehitaman/ putih pada permukaan gigi',
  'G028': 'Sariawan tak kunjung sembuh',
  'G029': 'Bercak merah/putih dalam mulut',
  'G030': 'Sakit pada lidah',
  'G031': 'Suara berubah',
  'G032': 'Bengkak pada kelenjar getah bening',
  'G033': 'Rahang kaku / sakit',
  'G034': 'Tenggorokan sakit',
  'G035': 'Sudut bibir kering dan pecah-pecah',
  'G036': 'Luka pada sudut bibir',
  'G037': 'Sakit saat membuka mulut',
  'G038': 'Sudut bibir berdarah',
};
final gejalaPenyakit_ = {
  'G001': ['P001', 'P003', 'P004', 'P007'],
  'G002': ['P001'],
  'G003': ['P001'],
  'G004': ['P001', 'P006'],
  'G005': ['P001', 'P003'],
  'G006': ['P001'],
  'G007': ['P002'],
  'G008': ['P002'],
  'G009': ['P002'],
  'G010': ['P002'],
  'G011': ['P002'],
  'G012': ['P003', 'P009'],
  'G013': ['P003', 'P006'],
  'G014': ['P003', 'P004'],
  'G015': ['P004'],
  'G016': ['P004', 'P005', 'P009'],
  'G017': ['P005'],
  'G018': ['P005', 'P009'],
  'G019': ['P005'],
  'G020': ['P006'],
  'G021': ['P006', 'P008'],
  'G022': ['P007'],
  'G023': ['P007'],
  'G024': ['P008'],
  'G025': ['P008'],
  'G026': ['P008'],
  'G027': ['P009'],
  'G028': ['P010'],
  'G029': ['P010'],
  'G030': ['P010'],
  'G031': ['P010'],
  'G032': ['P010'],
  'G033': ['P010'],
  'G034': ['P010'],
  'G035': ['P011'],
  'G036': ['P011'],
  'G037': ['P011'],
  'G038': ['P011'],
};
