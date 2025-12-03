import 'package:flutter/material.dart';
import '../../data/repositories/history_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    history = await HistoryService.loadHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('History'),
      ),
      body: history.isEmpty
          ? const Center(child: Text("No history yet"))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, i) {
                final h = history[i];
                return ListTile(
                  title: Text("${h['quiz']} - ${h['score']}/${h['total']}"),
                  subtitle: Text(h['time']),
                );
              },
            ),
    );
  }
}
