import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget{
  final bool isDarkMode;
  const NotificationPage({super.key,required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    final List<Map<String,String>> notifications = [
      {
        "title": "Your Order Has Shipped!",
        "message": "Your Nike Air Max order has been shipped. Track it now.",
        "time": "2 hours ago"
      },
      {
        "title": "New Sneaker Drop!",
        "message": "The Yeezy Boost 350 V3 is now available.",
        "time": "Yesterday"
      },
      {
        "title": "Sale Alert 🔥",
        "message": "Flat 30% off on selected Jordans for 24 hours.",
        "time": "2 days ago"
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDarkMode ? Colors.white:Colors.black,
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: notifications.isEmpty
      ? Center(
        child: Text(
          "No notifications yet." ,
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.black54,
            fontSize: 16,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context,index){
          final notif = notifications[index];
          return Card(
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                Icons.notifications_active_outlined,
                color: isDarkMode ? Colors.orangeAccent:Colors.deepOrange,
              ),
              title: Text(
                notif["title"]!,
                style: TextStyle(
                  color: isDarkMode ? Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notif["message"]!,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    notif["time"]!,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white38:Colors.black45,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}