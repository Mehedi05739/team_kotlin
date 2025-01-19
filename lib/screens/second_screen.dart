import 'package:flutter/material.dart';
import 'package:team_kotlin/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // Selected tab index
  int selectedTabIndex = 0;

  // Selected date index
  int selectedDateIndex = 2; // Initially selected date is 25th

  // Dummy data for the date tiles
  final List<Map<String, String>> dates = [
    {'month': 'May', 'date': '23', 'day': 'Fri'},
    {'month': 'May', 'date': '24', 'day': 'Sat'},
    {'month': 'May', 'date': '25', 'day': 'Sun'},
    {'month': 'May', 'date': '26', 'day': 'Mon'},
    {'month': 'May', 'date': '27', 'day': 'Tue'},
  ];

  // Tab labels
  final List<String> tabs = ['All', 'To do', 'In Progress', 'Completed'];


  final List<Task> tasks = [
    Task(
      title: 'Market Research',
      subtitle: 'Grocery shopping app design',
      time: '10:00 AM',
      status: 'Done',
      statusColor: Colors.purple,
      icon: Icons.cake,
    ),
    Task(
      title: 'Competitive Analysis',
      subtitle: 'Grocery shopping app design',
      time: '12:00 PM',
      status: 'In Progress',
      statusColor: Colors.orange,
      icon: Icons.search,
    ),
    Task(
      title: 'Create Low-fidelity Wireframe',
      subtitle: 'Uber Eats redesign challenge',
      time: '07:00 PM',
      status: 'To-do',
      statusColor: Colors.blue,
      icon: Icons.wifi,
    ),
    Task(
      title: 'How to pitch a Design Sprint',
      subtitle: 'About design sprint',
      time: '09:00 PM',
      status: 'To-do',
      statusColor: Colors.blue,
      icon: Icons.book,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan_outlined),
        onPressed: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const ThirdScreen()),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Text(
                    "Today's Tasks",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.notifications, color: Colors.black),
                ],
              ),
              SizedBox(height: 20),
              // Calendar
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (context, index) {
                    final date = dates[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      },
                      child: DateTile(
                        month: date['month']!,
                        date: date['date']!,
                        day: date['day']!,
                        isSelected: selectedDateIndex == index,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  tabs.length,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    child: TabWidget(
                      label: tabs[index],
                      isSelected: selectedTabIndex == index,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Task Cards
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskCard(
                      title: task.title,
                      subtitle: task.subtitle,
                      time: task.time,
                      status: task.status,
                      statusColor: task.statusColor,
                      icon: task.icon,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateTile extends StatelessWidget {
  final String month;
  final String date;
  final String day;
  final bool isSelected;

  const DateTile({
    required this.month,
    required this.date,
    required this.day,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabWidget({super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String status;
  final Color statusColor;
  final IconData icon;

  const TaskCard({super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.purple),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class Task {
  final String title;
  final String subtitle;
  final String time;
  final String status;
  final Color statusColor;
  final IconData icon;

  Task({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.icon,
  });
}