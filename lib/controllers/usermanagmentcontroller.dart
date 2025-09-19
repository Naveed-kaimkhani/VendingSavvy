import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserControllerr extends GetxController {
  final RxList<Map<String, dynamic>> faqs = RxList<Map<String, dynamic>>([
    {
      'question': 'How do I reset my password?',
      'answer':
          'Go to the support center, click reset password, and follow the instructions.',
      'enabled': true,
      'expanded': false,
    },
    {
      'question': 'What is email support?',
      'answer': 'Email us at scamguard123@gamilcom for assistance.',
      'enabled': false,
      'expanded': false,
    },
    {
      'question': 'How to update my profile?',
      'answer': 'Visit profile settings and save changes.',
      'enabled': false,
      'expanded': false,
    },
  ]);

  final RxMap<String, dynamic> contactInfo = RxMap<String, dynamic>({
    'customerSupport': {
      'label': 'Customer Support',
      'icon': Icons.headset_mic,
      'details': 'Call us at +1-800-555-1234',
    },
    'emailSupport': {
      'label': 'Email Support',
      'icon': Icons.email,
      'details': 'support@scamguard.com',
    },
    'facebook': {
      'label': 'Facebook',
      'icon': Icons.facebook,
      'details': 'Visit facebook.com/scamguard',
    },
  });

  final RxString selectedSection = RxString('faqs'); // Default to FAQs

  void toggleSection(String section) {
    selectedSection.value = section;
  }

  void toggleFaqExpansion(int index) {
    faqs[index]['expanded'] = !faqs[index]['expanded'];
    update();
  }

  final RxList<Map<String, dynamic>> users = RxList<Map<String, dynamic>>([
    {
      'name': 'Jessica',
      'status': 'Active',
      'plan': 'premium',
      'memberSince': '2023-01-15',
      'createdOn': '2023-01-15',
      'totalLogins': 25,
      'verificationStatus': 'Verified',
      'activityLogs': [
        {
          'description': 'Logged in',
          'date': '2025-07-08',
          'time': '10:00 AM',
          'device': 'iPhone',
          'address': 'San Francisco, California',
        },
        {
          'description': 'Updated profile',
          'date': '2025-07-07',
          'time': '2:00 PM',
          'device': 'MacBook Pro',
          'address': 'San Francisco, California',
        },
        {
          'description': 'Password Changed',
          'date': '2025-07-07',
          'time': '2:05 PM',
          'device': 'MacBook Pro',
          'address': 'San Francisco, California',
        },
      ],
    },
    {
      'name': 'John',
      'status': 'Banned',
      'plan': 'Free',
      'memberSince': '2023-02-10',
      'createdOn': '2023-02-10',
      'totalLogins': 10,
      'verificationStatus': 'Pending',
      'activityLogs': [
        {
          'description': 'Logged in',
          'date': '2025-07-08',
          'time': '9:00 AM',
          'device': 'iPhone',
          'address': 'Los Angeles, California',
        },
      ],
    },
    {
      'name': 'Jessica Chen',
      'status': 'Active',
      'plan': 'premium',
      'memberSince': '2023-01-15',
      'createdOn': '2023-01-15',
      'totalLogins': 25,
      'verificationStatus': 'Verified',
      'activityLogs': [
        {
          'description': 'Logged in',
          'date': '2025-07-08',
          'time': '10:00 AM',
          'device': 'iPhone',
          'address': 'San Francisco, California',
        },
        {
          'description': 'Updated profile',
          'date': '2025-07-07',
          'time': '2:00 PM',
          'device': 'MacBook Pro',
          'address': 'San Francisco, California',
        },
      ],
    },
    {
      'name': 'Daniel Kim',
      'status': 'Active',
      'plan': 'premium',
      'memberSince': '2023-01-15',
      'createdOn': '2023-01-15',
      'totalLogins': 25,
      'verificationStatus': 'Verified',
      'activityLogs': [
        {
          'description': 'Logged in',
          'date': '2025-07-08',
          'time': '10:00 AM',
          'device': 'iPhone',
          'address': 'San Francisco, California',
        },
        {
          'description': 'Password Changed',
          'date': '2025-07-07',
          'time': '2:00 PM',
          'device': 'MacBook Pro',
          'address': 'San Francisco, California',
        },
      ],
    },
  ]);
  final RxList<Map<String, dynamic>> notifications =
      RxList<Map<String, dynamic>>([
        {
          'date': 'Today',
          'title': 'New Scam Alert',
          'subtitle': 'A new scam number was reported.',
          'time': '04:00 AM',
        },
        {
          'date': 'Today',
          'title': 'Account Update',
          'subtitle': 'Your profile has been updated.',
          'time': '03:30 AM',
        },
        {
          'date': 'Yesterday',
          'title': 'System Maintenance',
          'subtitle': 'Scheduled maintenance completed.',
          'time': '10:00 PM',
        },
        {
          'date': 'Yesterday',
          'title': 'User Report',
          'subtitle': 'A user reported a suspicious activity.',
          'time': '09:15 PM',
        },
      ]);
  // New list for scam numbers
  final RxList<Map<String, dynamic>> scamNumbers = RxList<Map<String, dynamic>>(
    [
      {
        'number': '+1234567890',
        'reportedDate': '2025-07-08',
        'status': 'Confirmed',
      },
      {
        'number': '+9876543210',
        'reportedDate': '2025-07-07',
        'status': 'Suspected',
      },
      {
        'number': '+5555555555',
        'reportedDate': '2025-07-06',
        'status': 'Confirmed',
      },
      {
        'number': '+1111111111',
        'reportedDate': '2025-07-05',
        'status': 'Suspected',
      },
    ],
  );

  final RxString searchText = RxString('');

  final RxInt selectedUserIndex = RxInt(0); // Default to first user

  void updateSearchText(String text) {
    searchText.value = text;
  }

  void setSelectedUserIndex(int index) {
    if (index >= 0 && index < users.length) {
      selectedUserIndex.value = index;
    } else {
      selectedUserIndex.value = 0; // Default to first user if index is invalid
    }
  }

  // Method to update user status (e.g., for Mute, Ban, Edit actions)
  void updateUserStatus(int index, String newStatus) {
    if (index >= 0 && index < users.length) {
      users[index]['status'] = newStatus;
      users.refresh(); // Notify listeners of the change
    }
  }

  // Method to update user plan (e.g., for Edit action)
  void updateUserPlan(int index, String newPlan) {
    if (index >= 0 && index < users.length) {
      users[index]['plan'] = newPlan;
      users.refresh(); // Notify listeners of the change
    }
  }

  // Method to search scam numbers
  List<Map<String, dynamic>> searchScamNumbers(String query) {
    return scamNumbers
        .where(
          (scam) => scam['number'].toString().toLowerCase().contains(
            query.toLowerCase(),
          ),
        )
        .toList();
  }

  // Method to update scam status (e.g., for Remove action)
  void updateScamStatus(int index, String newStatus) {
    if (index >= 0 && index < scamNumbers.length) {
      scamNumbers[index]['status'] = newStatus;
      scamNumbers.refresh(); // Notify listeners of the change
    }
  }

  // Method to remove a scam number
  void removeScamNumber(int index) {
    if (index >= 0 && index < scamNumbers.length) {
      scamNumbers.removeAt(index);
      scamNumbers.refresh(); // Notify listeners of the change
      if (selectedUserIndex.value >= scamNumbers.length) {
        selectedUserIndex.value = scamNumbers.length > 0
            ? scamNumbers.length - 1
            : 0;
      }
    }
  }

  // call and messages montoring
  RxBool noCallerID = true.obs;
  RxBool nocallid2 = true.obs;
  RxBool international = true.obs;
  // RxBool scamNumbers = true.obs;
  TextEditingController numberController = TextEditingController();

  RxList<String> blockList = <String>[
    '+1 (555) 123-4567',

    '+1 (555) 123-3223',
    '+1 (555) 123-4567',
    '+1 (555) 123-2342',
    '+1 (555) 123-4351',
    '+1 (555) 123-5435',
    '+1 (555) 123-6453',
    '+1 (555) 123-2344',
    '+1 (555) 123-6565',
  ].obs;

  void toggleProtection(bool val) {
    isProtectionEnabled.value = val;
  }

  RxBool isProtectionEnabled = true.obs;
  void addToBlockList() {
    final trimmed = numberController.text.trim();
    if (trimmed.isNotEmpty) {
      blockList.insert(0, trimmed);
      numberController.clear();
    }
  }

  void deleteFromBlockList(int index) {
    if (index >= 0 && index < blockList.length) {
      blockList.removeAt(index);
    }
  }
}
