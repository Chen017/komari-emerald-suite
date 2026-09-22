# Komari Emerald Ecosystem - GitHub Metadata Updater
# Run this script with an authenticated GitHub CLI (gh auth login)

Write-Host "Updating GitHub Repository Metadata for Komari Emerald Ecosystem..." -ForegroundColor Cyan

# 1. Theme
Write-Host "`n1. Updating Chen017/komari-theme-emerald..." -ForegroundColor Green
gh repo edit Chen017/komari-theme-emerald `
  --description "Modern Komari theme with Resource Insights, traffic trends, exact availability, IPQA visualization, cost and renewal analytics." `
  --homepage "https://github.com/Chen017/komari-emerald-suite" `
  --add-topic "komari" `
  --add-topic "komari-theme" `
  --add-topic "server-monitoring" `
  --add-topic "dashboard" `
  --add-topic "vue" `
  --add-topic "vite" `
  --add-topic "tailwindcss" `
  --add-topic "resource-insights" `
  --add-topic "ipqa" `
  --add-topic "uptime-monitoring"

# 2. Availability Plugin
Write-Host "`n2. Updating Chen017/komari-plugin-availability-history..." -ForegroundColor Green
gh repo edit Chen017/komari-plugin-availability-history `
  --description "Event-based availability history and 30-day uptime API for Komari, with first-class Komari Emerald integration." `
  --homepage "https://github.com/Chen017/komari-emerald-suite" `
  --add-topic "komari" `
  --add-topic "komari-plugin" `
  --add-topic "availability" `
  --add-topic "uptime" `
  --add-topic "uptime-monitoring" `
  --add-topic "server-monitoring" `
  --add-topic "websocket" `
  --add-topic "komari-emerald"

# 3. IPQA Plugin
Write-Host "`n3. Updating Chen017/komari-plugin-ipqa-alert-report..." -ForegroundColor Green
gh repo edit Chen017/komari-plugin-ipqa-alert-report `
  --description "Komari plugin for IP-Quality-Archive sync, history APIs, semantic change tracking and aggregated IP quality alerts. First-class Komari Emerald integration." `
  --homepage "https://github.com/Chen017/komari-emerald-suite" `
  --add-topic "komari" `
  --add-topic "komari-plugin" `
  --add-topic "ipqa" `
  --add-topic "ip-quality" `
  --add-topic "server-monitoring" `
  --add-topic "network-quality" `
  --add-topic "ip-quality-archive" `
  --add-topic "komari-emerald"

# 4. Suite (once created on GitHub)
Write-Host "`n4. Updating Chen017/komari-emerald-suite..." -ForegroundColor Green
gh repo edit Chen017/komari-emerald-suite `
  --description "Coordinated theme and plugin ecosystem for Komari server monitoring." `
  --homepage "https://github.com/Chen017/komari-theme-emerald" `
  --add-topic "komari" `
  --add-topic "komari-theme" `
  --add-topic "komari-plugin" `
  --add-topic "komari-emerald" `
  --add-topic "server-monitoring" `
  --add-topic "dashboard" `
  --add-topic "uptime-monitoring" `
  --add-topic "ipqa"

Write-Host "`nAll metadata updated successfully!" -ForegroundColor Cyan
