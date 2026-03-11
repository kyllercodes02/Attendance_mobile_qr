import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Welcome Admin',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Text('Logged in email: $email'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/login'),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
