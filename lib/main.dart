// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Reminders());

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminders',
      home: new RemindersList()
    );
  }
}

class RemindersList extends StatefulWidget {
  @override
  createState() => new RemindersListState();
}

class RemindersListState extends State<RemindersList> {
  List<String> _reminderItems = [];

  void _addReminder(String reminder) {
    if (reminder.length > 0) {
      setState(() => _reminderItems.add(reminder));
    }
  }

  Widget _buildReminderList() { 
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _reminderItems.length) {
          return _buildReminderItem(_reminderItems[index]);
        }
      },
    );
  }

  void _pushAddScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Add a reminder')
            ),
            body: new TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addReminder(val);
                Navigator.pop(context);
              },
              decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)
              ),
            )
          );
        }
        )
    );
  }

  Widget _buildReminderItem(String todoText) {
    return new ListTile(
      title: new Text(todoText)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List')
      ),
      body: _buildReminderList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddScreen,
        tooltip: 'Add reminder',
        child: new Icon(Icons.add)
      )
    );
  }
}