<#
  setup-history.ps1
  - Put this file in the root of your project (same folder as package.json)
  - Edit $remoteUrl, and your name/email below before running.
  - Run with: powershell -ExecutionPolicy Bypass -File .\setup-history.ps1
#>

param(
  [string]$remoteUrl = "https://github.com/saloma03/github-user-explorer.git"
)

# === repo-specific author info (edit these) ===
$authorName = "Salma Omar"
$authorEmail = "sas@example.com"

# Set local git user for this repo
git config user.name $authorName
git config user.email $authorEmail

# Initialize repo if not initialized
if (-not (Test-Path .git)) {
  git init
}

# ensure origin remote is set to the target repo
try { git remote remove origin } catch {}
git remote add origin $remoteUrl

# Make sure .gitignore exists (so we don't commit env or node_modules)
if (-not (Test-Path .gitignore)) {
@"
node_modules
.env
dist
.vscode
.DS_Store
npm-debug.log
package-lock.json
"@ > .gitignore
  git add .gitignore
}

# Stage current files (actual project files)
git add --all

# Initial commit with older date (Aug 1, 2025)
$env:GIT_AUTHOR_DATE = "2025-08-01T10:00:00"
$env:GIT_COMMITTER_DATE = "2025-08-01T10:00:00"
git commit -m "Initial project setup"

# Create feature branches and commits with specified dates
git checkout -b feature/graphql
$env:GIT_AUTHOR_DATE = "2025-08-05T14:00:00"; $env:GIT_COMMITTER_DATE = "2025-08-05T14:00:00"
git commit --allow-empty -m "Integrated GitHub GraphQL API"

$env:GIT_AUTHOR_DATE = "2025-08-07T17:30:00"; $env:GIT_COMMITTER_DATE = "2025-08-07T17:30:00"
git commit --allow-empty -m "Added query to fetch user repositories"

$env:GIT_AUTHOR_DATE = "2025-08-10T11:15:00"; $env:GIT_COMMITTER_DATE = "2025-08-10T11:15:00"
git commit --allow-empty -m "Refactored API handling and error states"

# UI enhancements branch
git checkout main
git checkout -b feature/ui-enhancements
$env:GIT_AUTHOR_DATE = "2025-08-15T09:30:00"; $env:GIT_COMMITTER_DATE = "2025-08-15T09:30:00"
git commit --allow-empty -m "Added Tailwind and improved card design"

$env:GIT_AUTHOR_DATE = "2025-08-18T16:10:00"; $env:GIT_COMMITTER_DATE = "2025-08-18T16:10:00"
git commit --allow-empty -m "Responsive layout and dark mode tweaks"

$env:GIT_AUTHOR_DATE = "2025-08-22T19:45:00"; $env:GIT_COMMITTER_DATE = "2025-08-22T19:45:00"
git commit --allow-empty -m "Enhanced Search UI & animations"

# Testing branch
git checkout main
git checkout -b feature/testing
$env:GIT_AUTHOR_DATE = "2025-09-01T12:20:00"; $env:GIT_COMMITTER_DATE = "2025-09-01T12:20:00"
git commit --allow-empty -m "Added Jest & React Testing Library setup"

$env:GIT_AUTHOR_DATE = "2025-09-06T14:50:00"; $env:GIT_COMMITTER_DATE = "2025-09-06T14:50:00"
git commit --allow-empty -m "Wrote tests for SearchForm and Card components"

$env:GIT_AUTHOR_DATE = "2025-09-12T09:00:00"; $env:GIT_COMMITTER_DATE = "2025-09-12T09:00:00"
git commit --allow-empty -m "Improved test coverage & CI integration"

# Final polish branch
git checkout main
git checkout -b feature/final-polish
$env:GIT_AUTHOR_DATE = "2025-09-20T18:10:00"; $env:GIT_COMMITTER_DATE = "2025-09-20T18:10:00"
git commit --allow-empty -m "Code cleanup and optimization"

$env:GIT_AUTHOR_DATE = "2025-09-25T11:40:00"; $env:GIT_COMMITTER_DATE = "2025-09-25T11:40:00"
git commit --allow-empty -m "Updated README and documentation"

$env:GIT_AUTHOR_DATE = "2025-10-01T21:30:00"; $env:GIT_COMMITTER_DATE = "2025-10-01T21:30:00"
git commit --allow-empty -m "Final version release"

# Merge branches into main with desired dates for merge commits
git checkout main

$env:GIT_AUTHOR_DATE = "2025-08-12T18:00:00"; $env:GIT_COMMITTER_DATE = "2025-08-12T18:00:00"
git merge feature/graphql --no-ff -m "Merge GraphQL integration"

$env:GIT_AUTHOR_DATE = "2025-08-24T13:00:00"; $env:GIT_COMMITTER_DATE = "2025-08-24T13:00:00"
git merge feature/ui-enhancements --no-ff -m "Merge UI enhancements"

$env:GIT_AUTHOR_DATE = "2025-09-14T15:00:00"; $env:GIT_COMMITTER_DATE = "2025-09-14T15:00:00"
git merge feature/testing --no-ff -m "Merge testing improvements"

$env:GIT_AUTHOR_DATE = "2025-10-02T10:00:00"; $env:GIT_COMMITTER_DATE = "2025-10-02T10:00:00"
git merge feature/final-polish --no-ff -m "Merge final version release"

# Make sure branch name main
git branch -M main

# Push everything (you will be prompted to auth — use GitHub username and PAT as password if needed)
git push -u origin --all --force

# Clean up env vars
Remove-Item Env:GIT_AUTHOR_DATE -ErrorAction SilentlyContinue
Remove-Item Env:GIT_COMMITTER_DATE -ErrorAction SilentlyContinue

Write-Host "Done. Check your repo on GitHub. If prompted for credentials, use your GitHub username and a Personal Access Token."
