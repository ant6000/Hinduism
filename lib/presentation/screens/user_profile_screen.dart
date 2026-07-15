import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hinduism/presentation/providers/login_controller.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsync = ref.watch(userProfileControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: userProfileAsync.when(
          data: (data) => RefreshIndicator(
            onRefresh: () => ref.refresh(userProfileControllerProvider.future),
            child: ListView(
                  children: [
                    Text(data.name ?? 'N/A'),
                    Text(data.customerId ?? ''),
                    Text(data.contactNumber ?? 'N/A'),
                    Text(data.address ?? 'N/A'),
                  ],
                ),
          ),
          skipLoadingOnRefresh: false,
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text("Error: $e"))),
    );
  }
}
