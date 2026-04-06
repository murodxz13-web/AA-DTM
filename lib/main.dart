import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AA DTM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameCtrl = TextEditingController();
  final familyCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AA DTM')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 50),
            const SizedBox(height: 20),
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Ism')),
            const SizedBox(height: 10),
            TextField(controller: familyCtrl, decoration: const InputDecoration(labelText: 'Familiya')),
            const SizedBox(height: 10),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Telefon')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TestScreen())),
              child: const Text('Boshlash'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int idx = 0;
  int score = 0;
  String? selected;

  final questions = [
    {'q': 'Flutter nima?', 'opts': ['Tili', 'Framework', 'DB'], 'ans': 1},
    {'q': 'Dart nima?', 'opts': ['Backend', 'Tili', 'Web'], 'ans': 1},
    {'q': 'FastAPI?', 'opts': ['Mobile', 'Python', 'DB'], 'ans': 1},
    {'q': 'MongoDB?', 'opts': ['SQL', 'NoSQL', 'Server'], 'ans': 1},
    {'q': 'REST API?', 'opts': ['DB', 'Architecture', 'Mobile'], 'ans': 1},
  ];

  @override
  Widget build(BuildContext context) {
    final q = questions[idx];
    return Scaffold(
      appBar: AppBar(title: Text('${idx + 1}/${questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: (idx + 1) / questions.length),
            const SizedBox(height: 20),
            Text(q['q'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ...List.generate((q['opts'] as List).length, (i) => RadioListTile(
              title: Text((q['opts'] as List)[i]),
              value: i,
              groupValue: selected != null ? int.parse(selected!) : null,
              onChanged: (v) => setState(() => selected = v.toString()),
            )),
            const Spacer(),
            ElevatedButton(
              onPressed: selected != null ? () {
                if (int.parse(selected!) == q['ans']) score++;
                if (idx < questions.length - 1) {
                  setState(() { idx++; selected = null; });
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(score: score, total: questions.length)));
                }
              } : null,
              child: const Text('Davom'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score, total;
  const ResultScreen({required this.score, required this.total, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Natija')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$score/$total', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('${((score / total) * 100).toStringAsFixed(1)}%'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LeaderboardScreen())),
              child: const Text('Leaderboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = [
      {'rank': 1, 'name': 'Ali', 'score': 100},
      {'rank': 2, 'name': 'Fatima', 'score': 80},
      {'rank': 3, 'name': 'Sardor', 'score': 80},
      {'rank': 4, 'name': 'Maryam', 'score': 60},
      {'rank': 5, 'name': 'Shoxjon', 'score': 60},
      {'rank': 6, 'name': 'Dilbar', 'score': 60},
      {'rank': 7, 'name': 'Kamol', 'score': 40},
      {'rank': 8, 'name': 'Nazira', 'score': 40},
      {'rank': 9, 'name': 'Jamshid', 'score': 40},
      {'rank': 10, 'name': 'Gulnora', 'score': 20},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          final u = users[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: u['rank'] == 1 ? Colors.amber : u['rank'] == 2 ? Colors.grey : u['rank'] == 3 ? Colors.orange : Colors.blue,
              child: Text('${u['rank']}'),
            ),
            title: Text(u['name']),
            trailing: Text('${u['score']}%'),
          );
        },
      ),
    );
  }
}