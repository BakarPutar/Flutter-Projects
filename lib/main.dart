import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Welcome to the Home Page'),
          ],
        ),
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaLengkap = "";
  String jenjang = '';
  double umur = 0;
  String kelasPBP = 'A';
  List<String> listKelasPBP = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  bool _nilaiSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Pak Dengklek",
                      labelText: "Nama Lengkap",
                      icon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: Icon(Icons.school),
                        title: Text("Jenjang"),
                      ),
                      RadioListTile(
                        title: const Text('Sarjana'),
                        value: 'Sarjana',
                        groupValue: jenjang,
                        onChanged: (String? value) {
                          setState(() {
                            jenjang = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Diploma'),
                        value: 'Diploma',
                        groupValue: jenjang,
                        onChanged: (String? value) {
                          setState(() {
                            jenjang = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Magister'),
                        value: 'Magister',
                        groupValue: jenjang,
                        onChanged: (String? value) {
                          setState(() {
                            jenjang = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Doktor'),
                        value: 'Doktor',
                        groupValue: jenjang,
                        onChanged: (String? value) {
                          setState(() {
                            jenjang = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.co_present),
                  title: Row(
                    children: [
                      Text('Umur: ${umur.round()}'),
                    ],
                  ),
                  subtitle: Slider(
                    value: umur,
                    max: 100,
                    divisions: 100,
                    label: umur.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        umur = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text('Kelas PBP'),
                  trailing: DropdownButton<String>(
                    value: kelasPBP,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listKelasPBP.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        kelasPBP = newValue!;
                      });
                    },
                  ),
                ),
                SwitchListTile(
                  title: const Text('Practice Mode'),
                  value: _nilaiSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      _nilaiSwitch = value;
                    });
                  },
                  secondary: const Icon(Icons.run_circle_outlined),
                ),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Center(child: Text('Informasi Data')),
                                  const SizedBox(height: 20),
                                  ListTile(
                                    title: Text("Nama Lengkap: $_namaLengkap"),
                                  ),
                                  ListTile(
                                    title: Text("Jenjang: $jenjang"),
                                  ),
                                  ListTile(
                                    title: Text("Umur: ${umur.round()}"),
                                  ),
                                  ListTile(
                                    title: Text("Kelas PBP: $kelasPBP"),
                                  ),
                                  ListTile(
                                    title: Text("Practice Mode: ${_nilaiSwitch ? 'Aktif' : 'Nonaktif'}"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}