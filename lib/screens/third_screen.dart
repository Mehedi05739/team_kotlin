import 'package:flutter/material.dart';
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              // Header Section
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      height: 50, width: 50, fit: BoxFit.cover,
                      'https://www.shutterstock.com/image-photo/profile-picture-smiling-successful-young-260nw-2040223583.jpg'),
                ),
                SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      'Livia Vaccaro',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),

                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.notifications, color: Colors.grey[700]),
                ),
              ]),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 20),

                      // Task Progress Section
                      Column(children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your today's task\nalmost done!",
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'View Task',
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                  ),
                                ],
                              ),
                              CircularProgressIndicator(
                                value: 0.85,
                                strokeWidth: 6,
                                backgroundColor: Colors.white54,
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(height: 20),

                      // In Progress Section
                      Text(
                        'In Progress',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: ProgressCard(
                              title: 'Grocery shopping app design',
                              progress: 0.7,
                              color: Colors.blue.withValues(alpha: 0.3),
                              vlueColor: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: ProgressCard(
                              title: 'Uber Eats redesign challenge',
                              progress: 0.5,
                              color: Colors.orange.withValues(alpha: 0.2),
                              vlueColor: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Task Groups Section
                      Text(
                        'Task Groups',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

                      ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return TaskGroupCard(
                              title: 'Office Project',
                              tasks: 23,
                              progress: 0.7,
                              color: Colors.grey[200]!,
                              valueColor: Colors.purple,
                            );
                          })

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Custom Widgets for Reusability
class ProgressCard extends StatelessWidget {
  final String title;
  final double progress;
  final Color color;
  final Color vlueColor;

  const ProgressCard({
    required this.title,
    required this.progress,
    required this.color, required this.vlueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title, maxLines: 2, overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white54,
            valueColor: AlwaysStoppedAnimation(vlueColor),
          ),
        ],
      ),
    );
  }
}

class TaskGroupCard extends StatelessWidget {
  final String title;
  final int tasks;
  final double progress;
  final Color color;
  final Color valueColor;

  const TaskGroupCard({
    required this.title,
    required this.tasks,
    required this.progress,
    required this.color, required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.task, color: valueColor),
          ),
          SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('$tasks Tasks'),
            ],
          ),
          Spacer(),

          CircularProgressIndicator(
            value: progress,
            strokeWidth: 6,
            backgroundColor: Colors.white54,
            valueColor: AlwaysStoppedAnimation(valueColor),
          ),
        ],
      ),
    );
  }
}