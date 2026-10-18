param(
    [string]$ProjectId = "sevisassist-ai-png",
    [string]$Region = "asia-southeast1"
)

Write-Host "=== Deploying SevisAssist AI (Team Sagecyba Developers) to Google Cloud ===" -ForegroundColor Cyan

gcloud config set project $ProjectId
gcloud services enable aiplatform.googleapis.com run.googleapis.com cloudbuild.googleapis.com cloudkms.googleapis.com

Write-Host "1. Deploying FastAPI + Gemini 2.5 Multi-Agent Backend to Cloud Run..." -ForegroundColor Green
gcloud run deploy sevisassist-ai-api `
    --source ./backend `
    --region $Region `
    --allow-unauthenticated `
    --set-env-vars="GOOGLE_GENAI_USE_VERTEXAI=true,GOOGLE_CLOUD_PROJECT=$ProjectId,GOOGLE_CLOUD_LOCATION=us-central1"

Write-Host "2. Building Flutter Web Prototype for Firebase / Cloud Run Hosting..." -ForegroundColor Green
Push-Location ./sevisassist_app
flutter build web --release
Pop-Location

Write-Host "=== Deployment Complete! ===" -ForegroundColor Cyan
