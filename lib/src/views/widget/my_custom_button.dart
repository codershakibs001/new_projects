import 'package:flutter/material.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  bool showActiveGroups = true;
  int selectedButtonIndex = 0;

  // --- Active groups data
  final List<Map<String, dynamic>> activeGroups = [
    {
      'title': 'Savings Circle',
      'members': '10 members',
      'amount': '\$500 monthly',
      'round': '3 of 10',
      'nextPayment': 'May 15, 2023',
      'currentReceiver': 'Emily W.',
    },
    {
      'title': 'Monthly Boost',
      'members': '6 members',
      'amount': '\$250 monthly',
      'round': '2 of 6',
      'nextPayment': 'May 20, 2023',
      'currentReceiver': 'Michael T.',
    },
  ];

  // --- Completed groups data
  final List<Map<String, dynamic>> completedGroups = [
    {
      'title': 'Family Savings',
      'members': '8 members',
      'amount': '\$400 monthly',
      'round': 'Completed',
      'duration': 'Jan - Oct 2022',
    },
    {
      'title': 'Vacation Fund',
      'members': '5 members',
      'amount': '\$300 monthly',
      'round': 'Completed',
      'duration': 'Mar - Aug 2022',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Groups'), elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Toggle buttons
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    _buildToggleButton('Active', 0),
                    SizedBox(width: 8),
                    _buildToggleButton('Completed', 1),
                  ],
                ),
              ),
              Divider(height: 1, thickness: 1, color: Colors.grey[200]),

              // Group cards - Expanded will take remaining space
              Expanded(
                flex: 3,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:
                      showActiveGroups
                          ? activeGroups.length
                          : completedGroups.length,
                  itemBuilder: (context, index) {
                    final group =
                        showActiveGroups
                            ? activeGroups[index]
                            : completedGroups[index];
                    return _buildGroupItem(group, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index) {
    final isSelected = selectedButtonIndex == index;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          elevation: isSelected ? 2 : 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {
          setState(() {
            selectedButtonIndex = index;
            showActiveGroups = index == 0;
          });
        },
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildGroupItem(Map<String, dynamic> group, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    group['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  if (showActiveGroups)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Active',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                '${group['members']} - ${group['amount']}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Round',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        group['round'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showActiveGroups ? 'Next Payment' : 'Duration',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        showActiveGroups
                            ? group['nextPayment']
                            : group['duration'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (showActiveGroups)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Receiver',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          group['currentReceiver'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        if (index <
            (showActiveGroups ? activeGroups.length : completedGroups.length) -
                1)
          Divider(height: 1, thickness: 1, color: Colors.grey[200]),
      ],
    );
  }
}
