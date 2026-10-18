import '../../domain/models/sevis_models.dart';
import '../services/sevis_api_service.dart';

class SevisRepository {
  SevisRepository({required this._apiService});

  final SevisApiService _apiService;

  Future<OnboardingResult> submitOnboarding({
    required String fullName,
    required String sevispassId,
    required String nidNumber,
    required String province,
    required String targetBank,
    required String serviceType,
    required String language,
    required bool consentKycSharing,
    required bool consentFraudNetwork,
    required double biometricLivenessScore,
    required double documentClarityScore,
  }) {
    return _apiService.verifyAndOnboard(
      fullName: fullName,
      sevispassId: sevispassId,
      nidNumber: nidNumber,
      province: province,
      targetBank: targetBank,
      serviceType: serviceType,
      language: language,
      consentKycSharing: consentKycSharing,
      consentFraudNetwork: consentFraudNetwork,
      biometricLivenessScore: biometricLivenessScore,
      documentClarityScore: documentClarityScore,
    );
  }

  Future<FraudCheckResult> checkCrossBankFraud({
    required String sevispassId,
    required String nidNumber,
    required String originatingBank,
    required String eventType,
    required double amountPgk,
    required String deviceFingerprintHash,
    required int velocity24hInstitutions,
  }) {
    return _apiService.runCrossBankFraudCheck(
      sevispassId: sevispassId,
      nidNumber: nidNumber,
      originatingBank: originatingBank,
      eventType: eventType,
      amountPgk: amountPgk,
      deviceFingerprintHash: deviceFingerprintHash,
      velocity24hInstitutions: velocity24hInstitutions,
    );
  }

  BenchmarkReport getBenchmarkReport() {
    return BenchmarkReport.defaultMetrics();
  }
}
