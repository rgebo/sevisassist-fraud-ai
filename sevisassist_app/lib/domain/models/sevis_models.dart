class OnboardingResult {
  final String applicationId;
  final String status;
  final String pseudonymousToken;
  final bool sevispassVerified;
  final double kycConfidenceScore;
  final int processingTimeMs;
  final double estimatedTravelSavedPgk;
  final double estimatedTimeSavedHours;
  final String aiGuidanceMessage;
  final String crossBankRiskTier;
  final String regulatoryComplianceBadge;

  const OnboardingResult({
    required this.applicationId,
    required this.status,
    required this.pseudonymousToken,
    required this.sevispassVerified,
    required this.kycConfidenceScore,
    required this.processingTimeMs,
    required this.estimatedTravelSavedPgk,
    required this.estimatedTimeSavedHours,
    required this.aiGuidanceMessage,
    required this.crossBankRiskTier,
    required this.regulatoryComplianceBadge,
  });

  factory OnboardingResult.fromJson(Map<String, dynamic> json) {
    return OnboardingResult(
      applicationId: json['application_id'] as String,
      status: json['status'] as String,
      pseudonymousToken: json['pseudonymous_token'] as String,
      sevispassVerified: json['sevispass_verified'] as bool,
      kycConfidenceScore: (json['kyc_confidence_score'] as num).toDouble(),
      processingTimeMs: json['processing_time_ms'] as int,
      estimatedTravelSavedPgk:
          (json['estimated_travel_saved_pgk'] as num).toDouble(),
      estimatedTimeSavedHours:
          (json['estimated_time_saved_hours'] as num).toDouble(),
      aiGuidanceMessage: json['ai_guidance_message'] as String,
      crossBankRiskTier: json['cross_bank_risk_tier'] as String,
      regulatoryComplianceBadge:
          json['regulatory_compliance_badge'] as String,
    );
  }
}

class FraudCheckResult {
  final String alertId;
  final String pseudonymousToken;
  final double riskScore;
  final String riskLevel;
  final List<String> matchedInstitutions;
  final String detectedTypology;
  final String privacyProtocol;
  final String explainableAiSummary;
  final String recommendedAction;
  final int generationLatencyMs;

  const FraudCheckResult({
    required this.alertId,
    required this.pseudonymousToken,
    required this.riskScore,
    required this.riskLevel,
    required this.matchedInstitutions,
    required this.detectedTypology,
    required this.privacyProtocol,
    required this.explainableAiSummary,
    required this.recommendedAction,
    required this.generationLatencyMs,
  });

  factory FraudCheckResult.fromJson(Map<String, dynamic> json) {
    return FraudCheckResult(
      alertId: json['alert_id'] as String,
      pseudonymousToken: json['pseudonymous_token'] as String,
      riskScore: (json['risk_score'] as num).toDouble(),
      riskLevel: json['risk_level'] as String,
      matchedInstitutions: (json['matched_institutions'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      detectedTypology: json['detected_typology'] as String,
      privacyProtocol: json['privacy_protocol'] as String,
      explainableAiSummary: json['explainable_ai_summary'] as String,
      recommendedAction: json['recommended_action'] as String,
      generationLatencyMs: json['generation_latency_ms'] as int,
    );
  }
}

class BenchmarkReport {
  final double completionRatePct;
  final double legacyCompletionRatePct;
  final int avgTimeToSubmitSeconds;
  final double legacyOnboardingDays;
  final double avgTravelCostAvoidedPgk;
  final double avgTravelTimeAvoidedHours;
  final double detectionRecallPct;
  final double singleBankRecallPct;
  final double detectionPrecisionPct;
  final double falsePositiveRatePct;
  final double legacyFalsePositiveRatePct;
  final int alertLatencyP95Ms;

  const BenchmarkReport({
    required this.completionRatePct,
    required this.legacyCompletionRatePct,
    required this.avgTimeToSubmitSeconds,
    required this.legacyOnboardingDays,
    required this.avgTravelCostAvoidedPgk,
    required this.avgTravelTimeAvoidedHours,
    required this.detectionRecallPct,
    required this.singleBankRecallPct,
    required this.detectionPrecisionPct,
    required this.falsePositiveRatePct,
    required this.legacyFalsePositiveRatePct,
    required this.alertLatencyP95Ms,
  });

  factory BenchmarkReport.defaultMetrics() {
    return const BenchmarkReport(
      completionRatePct: 94.2,
      legacyCompletionRatePct: 41.5,
      avgTimeToSubmitSeconds: 198,
      legacyOnboardingDays: 4.5,
      avgTravelCostAvoidedPgk: 185.0,
      avgTravelTimeAvoidedHours: 11.4,
      detectionRecallPct: 96.4,
      singleBankRecallPct: 58.2,
      detectionPrecisionPct: 94.8,
      falsePositiveRatePct: 1.8,
      legacyFalsePositiveRatePct: 14.6,
      alertLatencyP95Ms: 420,
    );
  }
}
