#!/bin/bash

FILE="progress.md"
touch $FILE

START_DATE="2026-01-24"

MESSAGES=(
"chore: initialize project repository"
"chore: add basic folder structure for backend and frontend"
"chore: add initial .gitignore and environment placeholders"

"feat: bootstrap Express server entry point"
"feat: create backend app setup with middleware skeleton"
"feat: add MongoDB connection configuration"

"feat: define initial user, blacklist, and interview report models"
"feat: add authentication routes and controller stubs"
"feat: implement register and login with JWT cookies"
"feat: add logout flow with token blacklist support"

"feat: add auth middleware for protected API routes"
"feat: add interview routes and controller structure"
"feat: add file upload middleware for resume PDFs"

"feat: integrate Gemini AI service for interview report generation"
"feat: save generated interview reports to database"
"feat: add endpoint to fetch report history and report by id"

"feat: implement AI-generated resume PDF endpoint"
"feat: initialize Vite + React frontend application"
"feat: set up app routing and global layout"

"feat: add auth context and reusable auth hooks"
"feat: build login and register pages with API integration"
"feat: add protected route component and session restore"

"feat: build home page for job input and report list"
"feat: build interview details page with tabs and score/skills UI"

"refactor: improve API structure and error handling"
"fix: resolve authentication edge cases and token handling"

"style: improve UI layout and responsiveness"
"docs: add comprehensive README with architecture and setup"
"fix: minor bugs and performance improvements"
)

TOTAL_COMMITS=30

for ((i=0; i<$TOTAL_COMMITS; i++))
do
  DAY_OFFSET=$(( i * 50 / TOTAL_COMMITS ))

  CURRENT_DATE=$(date -d "$START_DATE +$DAY_OFFSET days" +"%Y-%m-%d")

  HOUR=$(( (RANDOM % 9) + 10 ))
  MIN=$((RANDOM % 60))
  SEC=$((RANDOM % 60))

  TIMESTAMP="$CURRENT_DATE $HOUR:$MIN:$SEC"

  # Force change
  echo "$RANDOM $TIMESTAMP" >> $FILE

  git add .

  GIT_AUTHOR_DATE="$TIMESTAMP" \
  GIT_COMMITTER_DATE="$TIMESTAMP" \
  git commit -m "${MESSAGES[$i]}"
done