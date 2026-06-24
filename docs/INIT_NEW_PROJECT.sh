#!/bin/bash

# ============================================================================
# 🚀 Nuxt3 + Tailwind + DaisyUI + Zustand + Vitest Project Initializer
# ============================================================================
# Interactive script to initialize a new project from this scaffold
# ============================================================================

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ============================================================================
# Helper Functions
# ============================================================================

print_header() {
    echo ""
    echo -e "${BOLD}${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}${BLUE}  $1${NC}"
    echo -e "${BOLD}${BLUE}═══════════════════════════════════════════════════════════${NC}"
    echo ""
}

print_step() {
    echo -e "${BOLD}${CYAN}→ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

confirm() {
    local prompt="$1"
    local response
    echo -e "${BOLD}$prompt${NC} ${YELLOW}(y/n)${NC} "
    read -r response
    case "$response" in
        [yY][eE][sS] | [yY])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# ============================================================================
# Main Script
# ============================================================================

print_header "🚀 Nuxt3 Scaffold Project Initializer"

# ============================================================================
# Step 1: Get Project Name
# ============================================================================

print_step "What is your project name?"
read -p "  Project name: " PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
    print_error "Project name cannot be empty!"
    exit 1
fi

PROJECT_SLUG=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

if [ -z "$PROJECT_SLUG" ]; then
    print_error "Project slug is empty after processing!"
    print_info "Please use only alphanumeric characters and spaces"
    exit 1
fi

echo ""

# ============================================================================
# Step 2: Display Stack
# ============================================================================

print_step "Project Stack Includes:"
echo ""
echo -e "  ${BOLD}Frontend:${NC}"
echo -e "    📦 Nuxt3 v3.14+          (Full-stack framework)"
echo -e "    🎨 Vue3 v3.5+            (UI library)"
echo -e "    🔷 TypeScript 5.3+       (Type safety)"
echo ""
echo -e "  ${BOLD}Styling:${NC}"
echo -e "    🎨 Tailwind CSS 3.4+     (Utility-first CSS)"
echo -e "    🌸 DaisyUI 4.12+         (Component library)"
echo ""
echo -e "  ${BOLD}State Management:${NC}"
echo -e "    🏪 Zustand 4.5+          (State management)"
echo ""
echo -e "  ${BOLD}Testing & Quality:${NC}"
echo -e "    ✅ Vitest 1.6+           (Test framework)"
echo -e "    📊 Coverage (70% threshold)"
echo -e "    🪝 Husky 9.1+            (Git hooks)"
echo -e "    📝 Pre-commit: tests"
echo -e "    📤 Pre-push: build"
echo ""
echo -e "  ${BOLD}Database:${NC}"
echo -e "    🗄️  NeonDB/PostgreSQL     (Serverless)"
echo -e "    📋 Migrations included"
echo ""
echo -e "  ${BOLD}Documentation:${NC}"
echo -e "    📚 Design System         (Tailwind + DaisyUI)"
echo -e "    📚 Testing Guide         (Vitest patterns)"
echo -e "    📚 Git Hooks Guide       (Husky automation)"
echo -e "    📚 Quick Reference       (Copy-paste ready)"
echo ""

# ============================================================================
# Step 3: Display Project Details
# ============================================================================

print_info "Project details:"
echo -e "  📦 ${BOLD}Project Name:${NC} $PROJECT_NAME"
echo -e "  📁 ${BOLD}Project Slug:${NC} $PROJECT_SLUG"
echo ""

# ============================================================================
# Step 4: Confirmation
# ============================================================================

if ! confirm "Continue with initialization?"; then
    print_warning "Initialization cancelled"
    exit 0
fi

echo ""

# ============================================================================
# Step 5: Update Files
# ============================================================================

print_header "Configuring Project Files"

print_step "Updating package.json..."
if sed -i '' "s/\"name\": \"project-name\"/\"name\": \"$PROJECT_SLUG\"/" package.json 2>/dev/null; then
    print_success "package.json updated"
else
    print_error "Failed to update package.json"
    exit 1
fi

print_step "Updating CLAUDE.md..."
if sed -i '' "s/Project Name - Development Guide/$PROJECT_NAME - Development Guide/" CLAUDE.md 2>/dev/null && \
   sed -i '' "s/> This is a Nuxt3/> $PROJECT_NAME is a Nuxt3/" CLAUDE.md 2>/dev/null; then
    print_success "CLAUDE.md updated"
else
    print_error "Failed to update CLAUDE.md"
    exit 1
fi

print_step "Updating README.md..."
if sed -i '' "s/^# Project Name$/# $PROJECT_NAME/" README.md 2>/dev/null && \
   sed -i '' "s/> Replace \"Project Name\"//" README.md 2>/dev/null && \
   sed -i '' "s/Brief description of what this project does./[Add project description here]/" README.md 2>/dev/null; then
    print_success "README.md updated"
else
    print_error "Failed to update README.md"
    exit 1
fi

echo ""

# ============================================================================
# Step 6: Clean Up Scaffold Files
# ============================================================================

print_header "Cleaning Up Scaffold Files"

print_step "Removing scaffold-specific files..."
rm -f README_SCAFFOLD.md
rm -f SCAFFOLD_CONTENTS.md
rm -f INIT_NEW_PROJECT.sh
print_success "Scaffold files removed"

echo ""

# ============================================================================
# Step 7: Initialize Git
# ============================================================================

print_header "Initializing Git Repository"

print_step "Creating git repository..."
if git init > /dev/null 2>&1; then
    print_success "Git repository created"
else
    print_error "Failed to initialize git"
    exit 1
fi

print_step "Creating initial commit..."
if git add . > /dev/null 2>&1 && \
   git commit -m "🚀 Initial commit: $PROJECT_NAME scaffold" > /dev/null 2>&1; then
    print_success "Initial commit created"
else
    print_error "Failed to create initial commit"
    # Don't exit - this might fail if git is not configured
    print_warning "You may need to configure git: git config user.email & git config user.name"
fi

echo ""

# ============================================================================
# Step 8: Verify Git Hooks
# ============================================================================

print_step "Verifying Git hooks..."
if [ -d ".git/hooks" ]; then
    print_success "Git hooks directory exists"
else
    mkdir -p .git/hooks
    print_success "Git hooks directory created"
fi

echo ""

# ============================================================================
# Step 9: Summary
# ============================================================================

print_header "✅ Project Initialization Complete!"

echo -e "${GREEN}Your project ${BOLD}\"$PROJECT_NAME\"${NC}${GREEN} is ready! 🎉${NC}"
echo ""

print_info "Project created with:"
echo "  ✓ Nuxt3 + Vue3 + TypeScript"
echo "  ✓ Tailwind CSS + DaisyUI"
echo "  ✓ Zustand state management"
echo "  ✓ Vitest (70% coverage threshold)"
echo "  ✓ Husky Git hooks (pre-commit, pre-push)"
echo "  ✓ NeonDB/PostgreSQL support"
echo "  ✓ Complete documentation"
echo ""

# ============================================================================
# Step 10: Next Steps
# ============================================================================

print_header "📋 Next Steps"

echo -e "${BOLD}1️⃣  Install dependencies:${NC}"
echo -e "   ${CYAN}pnpm install${NC}"
echo ""

echo -e "${BOLD}2️⃣  Setup environment:${NC}"
echo -e "   ${CYAN}cp .env.example .env.local${NC}"
echo -e "   Then edit ${CYAN}.env.local${NC} with your actual values"
echo ""

echo -e "${BOLD}3️⃣  Start developing:${NC}"
echo -e "   ${CYAN}pnpm dev${NC}"
echo ""

echo -e "${BOLD}4️⃣  Read the guides:${NC}"
echo -e "   📚 ${CYAN}CLAUDE.md${NC}              - Development guide"
echo -e "   📚 ${CYAN}docs/DESIGN.md${NC}         - Design system"
echo -e "   📚 ${CYAN}docs/TESTING.md${NC}        - Testing guide"
echo -e "   📚 ${CYAN}docs/HUSKY.md${NC}          - Git hooks guide"
echo ""

# ============================================================================
# Step 11: Helpful Commands
# ============================================================================

print_header "⚡ Quick Commands"

echo -e "Development:"
echo -e "  ${CYAN}pnpm dev${NC}              Start dev server"
echo -e "  ${CYAN}pnpm build${NC}            Production build"
echo ""

echo -e "Testing:"
echo -e "  ${CYAN}pnpm test${NC}             Run tests"
echo -e "  ${CYAN}pnpm test:ui${NC}          Tests with UI"
echo -e "  ${CYAN}pnpm test:coverage${NC}    Coverage report"
echo ""

echo -e "Quality:"
echo -e "  ${CYAN}git add .${NC}            Stage changes"
echo -e "  ${CYAN}git commit -m '...'${NC}   Commit (tests auto-run)"
echo -e "  ${CYAN}git push${NC}              Push (build auto-runs)"
echo ""

# ============================================================================
# Final Message
# ============================================================================

print_header "🚀 Ready to Code!"

echo -e "${BOLD}${GREEN}Your project is set up and ready to go!${NC}"
echo ""
echo -e "📖 For more info, read: ${CYAN}CLAUDE.md${NC}"
echo ""
echo -e "${BOLD}Happy coding! 🎉${NC}"
echo ""
