import 'package:flutter_test/flutter_test.dart';
import 'package:sevisassist_app/data/repositories/sevis_repository.dart';
import 'package:sevisassist_app/data/services/sevis_api_service.dart';
import 'package:sevisassist_app/main.dart';
import 'package:sevisassist_app/ui/features/dashboard/view_models/sevis_view_model.dart';

void main() {
  testWidgets('SevisAssist AI renders team header and rural onboarding portal', (
    WidgetTester tester,
  ) async {
    final viewModel = SevisViewModel(
      repository: SevisRepository(apiService: SevisApiService()),
    );
    await tester.pumpWidget(SevisAssistApp(viewModel: viewModel));
    await tester.pumpAndSettle();

    expect(find.textContaining('SevisAssist AI'), findsWidgets);
    expect(find.textContaining('Sagecyba Developers'), findsWidgets);
  });
}
