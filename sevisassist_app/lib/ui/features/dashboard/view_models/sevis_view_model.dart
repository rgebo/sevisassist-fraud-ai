import 'package:flutter/foundation.dart';
import '../../../../data/repositories/sevis_repository.dart';
import '../../../../domain/models/sevis_models.dart';

class SevisViewModel extends ChangeNotifier {
  SevisViewModel({required this._repository}) {
    _benchmarks = _repository.getBenchmarkReport();
    _initializeDemoState();
  }

  final SevisRepository _repository;

  int _selectedNavIndex = 0;
  int get selectedNavIndex => _selectedNavIndex;

  // 'split' (Mobile + Console side-by-side), 'mobile' (Dedicated Mobile Phone Frame), 'console' (Full Widescreen Console)
  String _displayMode = 'split';
  String get displayMode => _displayMode;

  int _mobileStepIndex = 0;
  int get mobileStepIndex => _mobileStepIndex;

  // Onboarding Form State
  String _applicantName = 'Michael Somare Kila';
  String get applicantName => _applicantName;

  String _sevispassId = 'SP-PNG-2026-88412';
  String get sevispassId => _sevispassId;

  String _nidNumber = 'NID-99201844';
  String get nidNumber => _nidNumber;

  String _selectedProvince = 'Eastern Highlands (Goroka / Kainantu)';
  String get selectedProvince => _selectedProvince;

  String _selectedBank = 'BSP Financial Group';
  String get selectedBank => _selectedBank;

  String _selectedService = 'Rural Micro-Savings & SME Agri-Loan';
  String get selectedService => _selectedService;

  String _selectedLanguage = 'Tok Pisin';
  String get selectedLanguage => _selectedLanguage;

  bool _consentKyc = true;
  bool get consentKyc => _consentKyc;

  bool _consentFraudMesh = true;
  bool get consentFraudMesh => _consentFraudMesh;

  final double _biometricLiveness = 0.98;
  double get biometricLiveness => _biometricLiveness;

  // Cross-Bank Fraud Simulator State
  String _fraudSevispassId = 'SP-PNG-2026-77309';
  String get fraudSevispassId => _fraudSevispassId;

  final String _fraudNid = 'NID-40192831';
  String get fraudNid => _fraudNid;

  String _originatingBank = 'Kina Bank';
  String get originatingBank => _originatingBank;

  double _transactionAmountPgk = 16500.0;
  double get transactionAmountPgk => _transactionAmountPgk;

  int _velocity24hBanks = 3;
  int get velocity24hBanks => _velocity24hBanks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  OnboardingResult? _onboardingResult;
  OnboardingResult? get onboardingResult => _onboardingResult;

  FraudCheckResult? _fraudResult;
  FraudCheckResult? get fraudResult => _fraudResult;

  late BenchmarkReport _benchmarks;
  BenchmarkReport get benchmarks => _benchmarks;

  static const List<String> pngProvinces = [
    'Eastern Highlands (Goroka / Kainantu)',
    'Morobe (Markham / Menyamya)',
    'East Sepik (Maprik / Angoram)',
    'Western Highlands (Tambul / Baiyer)',
    'Autonomous Region of Bougainville (Buin)',
    'Milne Bay (Kiriwina / Esa\'ala)',
    'Central Province (Rigo / Abau)',
  ];

  static const List<String> pngBanks = [
    'BSP Financial Group',
    'Kina Bank',
    'MiBank (Nationwide Microbank)',
    'TISA Bank',
  ];

  static const List<String> bankingServices = [
    'Rural Micro-Savings & SME Agri-Loan',
    'Zero-Branch Personal Everyday Account',
    'Cocoa & Coffee Cooperative Credit Line',
    'SevisPass KYC Account Recovery & Update',
  ];

  static const List<String> supportedLanguages = [
    'Tok Pisin',
    'English',
    'Hiri Motu',
  ];

  Future<void> _initializeDemoState() async {
    await runOnboardingVerification();
    await runFraudIntelligenceCheck();
  }

  void setNavIndex(int index) {
    _selectedNavIndex = index;
    notifyListeners();
  }

  void setDisplayMode(String mode) {
    _displayMode = mode;
    notifyListeners();
  }

  void setMobileStepIndex(int index) {
    _mobileStepIndex = index;
    notifyListeners();
  }

  void updateLanguage(String lang) {
    _selectedLanguage = lang;
    notifyListeners();
    runOnboardingVerification();
  }

  void updateProvince(String province) {
    _selectedProvince = province;
    notifyListeners();
    runOnboardingVerification();
  }

  void updateBank(String bank) {
    _selectedBank = bank;
    notifyListeners();
    runOnboardingVerification();
  }

  void updateService(String service) {
    _selectedService = service;
    notifyListeners();
    runOnboardingVerification();
  }

  void toggleConsentKyc(bool val) {
    _consentKyc = val;
    notifyListeners();
  }

  void toggleConsentFraudMesh(bool val) {
    _consentFraudMesh = val;
    notifyListeners();
  }

  void updateApplicantProfile({String? name, String? spId, String? nid}) {
    if (name != null) _applicantName = name;
    if (spId != null) _sevispassId = spId;
    if (nid != null) _nidNumber = nid;
    notifyListeners();
  }

  void updateFraudScenario({
    int? velocityBanks,
    double? amountPgk,
    String? bank,
    String? spId,
  }) {
    if (velocityBanks != null) _velocity24hBanks = velocityBanks;
    if (amountPgk != null) _transactionAmountPgk = amountPgk;
    if (bank != null) _originatingBank = bank;
    if (spId != null) _fraudSevispassId = spId;
    notifyListeners();
    runFraudIntelligenceCheck();
  }

  Future<void> runOnboardingVerification() async {
    _isLoading = true;
    notifyListeners();
    try {
      _onboardingResult = await _repository.submitOnboarding(
        fullName: _applicantName,
        sevispassId: _sevispassId,
        nidNumber: _nidNumber,
        province: _selectedProvince,
        targetBank: _selectedBank,
        serviceType: _selectedService,
        language: _selectedLanguage,
        consentKycSharing: _consentKyc,
        consentFraudNetwork: _consentFraudMesh,
        biometricLivenessScore: _biometricLiveness,
        documentClarityScore: 0.96,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> runFraudIntelligenceCheck() async {
    _isLoading = true;
    notifyListeners();
    try {
      _fraudResult = await _repository.checkCrossBankFraud(
        sevispassId: _fraudSevispassId,
        nidNumber: _fraudNid,
        originatingBank: _originatingBank,
        eventType: 'Simultaneous Multi-Bank Account Opening & Rapid Cash-Out',
        amountPgk: _transactionAmountPgk,
        deviceFingerprintHash: 'dev_fp_8891a4c_png',
        velocity24hInstitutions: _velocity24hBanks,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
