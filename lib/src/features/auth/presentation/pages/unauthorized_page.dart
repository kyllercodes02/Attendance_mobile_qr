import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_controller.dart';

class UnauthorizedPage extends StatelessWidget {
  const UnauthorizedPage({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Access blocked')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.block, size: 56, color: Colors.red),
                    const SizedBox(height: 12),
                    Text(
                      message ?? 'You are not allowed to open this page.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {
                        if (authController.isAdmin) {
                          context.go('/admin/dashboard');
                          return;
                        }
                        if (authController.isTeacher) {
                          context.go('/teacher/dashboard');
                          return;
                        }
                        context.go('/login');
                      },
                      child: const Text('Back'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
