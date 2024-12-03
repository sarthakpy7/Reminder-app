import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReminderPage(),
    );
  }
}

class Reminder {
  String title;
  bool isCompleted;

  Reminder({required this.title, this.isCompleted = false});
}

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  // List of dummy reminders
  List<Reminder> reminders = [
    Reminder(title: 'Buy groceries'),
    Reminder(title: 'Complete Flutter project'),
    Reminder(title: 'Call mom'),
    Reminder(title: 'Prepare dinner'),
  ];

  // Function to toggle the completion status of a reminder
  void toggleCompletion(int index) {
    setState(() {
      reminders[index].isCompleted = !reminders[index].isCompleted;
    });
  }

  // Function to add a new reminder (dummy function for now)
  void addReminder() {
    setState(() {
      reminders.add(Reminder(title: 'New Reminder'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder App'),
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: reminders[index].isCompleted,
              onChanged: (value) {
                toggleCompletion(index);
              },
            ),
            title: Text(
              reminders[index].title,
              style: TextStyle(
                decoration: reminders[index].isCompleted
                    ? TextDecoration.lineThrough
                    : null,
                color: reminders[index].isCompleted ? Colors.grey : null,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addReminder, // Call the function to add a new reminder
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
