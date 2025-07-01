import 'package:flutter/material.dart';
import 'class.dart'; // Your Expense model file

class HistoryPage extends StatefulWidget {
  final List<Expense> expenseList;

  const HistoryPage({Key? key, required this.expenseList}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense History'),
      ),
      body: widget.expenseList.isEmpty
          ? const Center(child: Text("No expenses added yet."))
          : ListView.builder(
        itemCount: widget.expenseList.length,
        itemBuilder: (context, index) {
          final item = widget.expenseList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(item.title),
              subtitle: Text("Rs. ${item.amount} • ${item.date}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Delete Expense"),
                      content: const Text("Are you sure you want to delete this expense?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              widget.expenseList.removeAt(index);
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Delete", style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
