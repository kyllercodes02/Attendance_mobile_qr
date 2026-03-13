import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminSectionPage extends StatelessWidget {
  const AdminSectionPage({
    super.key,
    required this.title,
    required this.description,
    required this.email,
  });

  final String title;
  final String description;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            tooltip: 'Dashboard',
            onPressed: () => context.go('/admin/dashboard', extra: email),
            icon: const Icon(Icons.dashboard_outlined),
          ),
          IconButton(
            tooltip: 'Logout',
            onPressed: () => context.go('/login'),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 12),
                      Text(description),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          FilledButton.icon(
                            onPressed: () =>
                                context.go('/admin/scanner', extra: email),
                            icon: const Icon(Icons.qr_code_scanner),
                            label: const Text('Open Scanner'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () =>
                                context.go('/admin/dashboard', extra: email),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Back to Dashboard'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
