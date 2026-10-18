# SevisAssist AI — Papua New Guinea 🇵🇬
**AI-Powered SevisPass Digital Identity, Inclusive Rural Banking & Privacy-Preserving Cross-Bank Fraud Intelligence Platform**

- **Competition:** Google Cloud AI Builder Cup 2026 (JAPAC — BFSI Track)
- **Team Name:** Sagecyba Developers
- **Team Leader:** Raunu Gebo Sarsoruo

---

## 🌟 Overview
**SevisAssist AI** connects Papua New Guinea's **SevisPass Digital ID** ecosystem with participating financial institutions (**BSP Financial Group, Kina Bank, MiBank, TISA Bank**) on **Google Cloud**. It solves two interconnected challenges:
1. **Inclusive Rural Banking & Zero-Branch eKYC:** Guides rural citizens through multimodal SevisPass verification and account/loan onboarding in **Tok Pisin, English, and Hiri Motu**, avoiding costly PMV/dinghy travel (**saving an average of PGK 185 and 11.4 hours per applicant**).
2. **Privacy-Preserving Cross-Bank Fraud Intelligence:** Enables participating banks to detect synthetic identity rings, velocity attacks, and rapid multi-bank mule openings in **420 ms (p95)** using **Cloud KMS-salted `HMAC-SHA256` pseudonymous blind indexes**—exchanging **zero bytes of raw PII**.

---

## 🏗️ Repository Structure
```text
sevisassist-ai/
├── backend/                     # Google Cloud Run FastAPI + Vertex AI (Gemini 2.5) Service
│   ├── main.py                  # Multi-Agent KYC, Tok Pisin Copilot & Cross-Bank Fraud API
│   ├── requirements.txt         # google-genai, fastapi, uvicorn, pydantic
│   └── Dockerfile               # Production container for Google Cloud Run
├── sevisassist_app/             # Cross-Platform Flutter 3.x App (Mobile & Web)
│   ├── lib/
│   │   ├── domain/models/       # Immutable Domain Models
│   │   ├── data/services/       # Cloud Run HTTP Client + Offline Rural Fallback
│   │   ├── data/repositories/   # Clean Repository Layer
│   │   └── ui/features/         # Adaptive Material 3 Views & ChangeNotifier ViewModel
│   └── test/                    # Automated Widget & Unit Tests
└── deploy_cloud_run.ps1         # One-command deployment to Google Cloud Run & Firebase
```

---

## 🚀 Quick Start (Local Development)

### 1. Run the Cloud Run FastAPI + Gemini Backend
```powershell
cd backend
pip install -r requirements.txt
# Optional: set your Gemini API key or Vertex AI project
$env:GEMINI_API_KEY="YOUR_GEMINI_API_KEY"
uvicorn main:app --reload --port 8080
```
- API Docs (Swagger UI): `http://localhost:8080/docs`
- Benchmarks Endpoint: `http://localhost:8080/api/v1/benchmarks`

### 2. Run the Cross-Platform Flutter App (Web / Desktop / Android)
```powershell
cd sevisassist_app
flutter run -d chrome
```

---

## ☁️ Deploying to Google Cloud Run & Firebase Hosting
Run the included [`deploy_cloud_run.ps1`](deploy_cloud_run.ps1) script or execute:
```bash
# 1. Deploy Backend to Google Cloud Run
gcloud run deploy sevisassist-ai-api \
  --source ./backend \
  --region asia-southeast1 \
  --allow-unauthenticated

# 2. Build Flutter Web & Deploy to Firebase Hosting
cd sevisassist_app
flutter build web --release
firebase deploy --only hosting
```
