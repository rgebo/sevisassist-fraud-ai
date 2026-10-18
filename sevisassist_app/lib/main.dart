import 'package:flutter/material.dart';
import 'data/repositories/sevis_repository.dart';
import 'data/services/sevis_api_service.dart';
import 'ui/features/dashboard/view_models/sevis_view_model.dart';
import 'ui/features/dashboard/views/sevis_dashboard_view.dart';

void main() {
  final apiService = SevisApiService();
  final repository = SevisRepository(apiService: apiService);
  final viewModel = SevisViewModel(repository: repository);

  runApp(SevisAssistApp(viewModel: viewModel));
}

class SevisAssistApp extends StatelessWidget {
  const SevisAssistApp({super.key, required this.viewModel});

  final SevisViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SevisAssist AI — Sagecyba Developers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A2E24),
          primary: const Color(0xFF0A2E24),
          secondary: const Color(0xFFFFB300),
        ),
        useMaterial3: true,
      ),
      home: SevisDashboardView(viewModel: viewModel),
    );
  }
}
