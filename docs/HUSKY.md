# Husky - Git Hooks

Automatic quality gates using Git hooks. Prevents bad commits and ensures code quality before pushing.

## What is Husky?

Husky enables Git hooks to run automatically at different stages:
- **pre-commit**: Before creating a commit
- **pre-push**: Before pushing to remote
- **commit-msg**: Validate commit message format
- And more...

## Current Hooks

### Pre-Commit Hook
**When**: Every time you run `git commit`  
**What it does**: Runs `pnpm test`  
**If tests fail**: ❌ Commit is blocked  
**Purpose**: Prevent broken code from being committed

### Pre-Push Hook
**When**: Every time you run `git push`  
**What it does**: Runs `pnpm build`  
**If build fails**: ❌ Push is blocked  
**Purpose**: Ensure production builds work before pushing to remote

## Workflow Example

```bash
# 1. Make changes to your code
# 2. Stage changes
git add .

# 3. Try to commit
git commit -m "Add new feature"

# 4. Pre-commit hook runs automatically
# → pnpm test executes
# → If tests PASS ✅ → Commit succeeds
# → If tests FAIL ❌ → Commit is blocked

# 5. Fix failing tests, then try again
git commit -m "Add new feature"  # Pre-commit hook runs again

# 6. Once committed, try to push
git push

# 7. Pre-push hook runs automatically
# → pnpm build executes
# → If build PASSES ✅ → Push succeeds
# → If build FAILS ❌ → Push is blocked

# 8. Fix build errors, then try again
git push
```

## Bypassing Hooks (When Necessary)

### Skip Pre-Commit Hook
```bash
# NOT RECOMMENDED - Use only in emergencies
git commit --no-verify -m "Emergency fix"
```

### Skip Pre-Push Hook
```bash
# NOT RECOMMENDED - Use only in emergencies
git push --no-verify
```

⚠️ **Warning**: Bypassing hooks defeats their purpose. Only do this if absolutely necessary.

## File Locations

```
.husky/
├── pre-commit      # Runs tests on commit
├── pre-push        # Runs build on push
└── _/
    └── husky.sh    # Husky shell script (auto-generated)
```

## Viewing Hook Status

```bash
# See what hooks are installed
ls -la .husky/

# View hook content
cat .husky/pre-commit
cat .husky/pre-push
```

## Hook Output

### Successful Pre-Commit
```
✓ PASS  tests/unit/utils/helpers.test.ts (5)
✓ 1 test passed (1.23s)
```
→ Commit proceeds ✅

### Failed Pre-Commit
```
✗ FAIL  tests/unit/utils/helpers.test.ts
  ✓ classNames (2)
    ✗ should handle edge cases (expected 'btn' to equal 'btn btn-primary')

Test Files  1 failed (1)
Tests  1 failed (2)
```
→ Commit blocked ❌

### Successful Pre-Push
```
✔ Client built in 757ms
✔ Server built in 312ms
✨ Build complete!
```
→ Push proceeds ✅

### Failed Pre-Push
```
[nitro] Error during build:
  Cannot find module './components/Button.vue'
```
→ Push blocked ❌

## Customizing Hooks

### Add More Tests to Pre-Commit

Edit `.husky/pre-commit`:

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

# Run tests
pnpm test

# Also run linting (optional)
# pnpm lint

# Also run type checking (optional)
# pnpm type-check
```

### Create Custom Hook

Example: `prepare-commit-msg` (auto-add issue number)

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

# Your custom logic here
echo "Preparing commit message..."
```

Make it executable:
```bash
chmod +x .husky/prepare-commit-msg
```

## Troubleshooting

### "Pre-commit hook not running"
1. Verify git is initialized: `git status`
2. Check hook is executable: `ls -la .husky/pre-commit`
3. Reinstall Husky: `pnpm exec husky install`

### "Permission denied" when running hook
```bash
# Make hooks executable
chmod +x .husky/pre-commit
chmod +x .husky/pre-push
```

### "Command not found: pnpm"
- Ensure pnpm is installed globally: `npm i -g pnpm`
- Or use: `npm run test` in hooks instead

### Hooks work locally but not in CI/CD
- CI systems may need special configuration
- Add `husky install` to your CI setup step
- Or disable Husky in CI: `HUSKY=0 git push`

## Disabling Husky Temporarily

```bash
# Temporarily disable Husky for one command
HUSKY=0 git push

# Or disable entirely (not recommended)
HUSKY=0
git commit -m "Skip hooks"
git push
```

## Common Hook Patterns

### Pattern 1: Lint + Test + Build

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

echo "🔍 Running linter..."
pnpm lint || exit 1

echo "✅ Running tests..."
pnpm test || exit 1

echo "🔨 Building..."
pnpm build || exit 1

echo "✨ All checks passed!"
```

### Pattern 2: Staged Files Only

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

# Get staged files
STAGED_FILES=$(git diff --cached --name-only)

# Lint only staged files
echo "Linting staged files..."
pnpm lint $STAGED_FILES
```

### Pattern 3: Different Hooks for Different Branches

```bash
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" = "main" ]; then
  echo "Running full test suite on main branch..."
  pnpm test
else
  echo "Running fast tests on feature branch..."
  pnpm test --run  # Run once, don't watch
fi
```

## Integration with IDE

### VS Code Integration
Most VS Code terminals automatically respect Husky hooks.

If hooks aren't running:
1. Open terminal within VS Code (not external)
2. Use Zsh or Bash (not PowerShell on Windows)
3. Or configure in `.vscode/settings.json`:
   ```json
   {
     "terminal.integrated.defaultProfile.osx": "zsh"
   }
   ```

### WebStorm/IntelliJ Integration
Husky hooks work automatically. To verify:
1. Go to Settings → Version Control → Git
2. Ensure "Use credential helper" is enabled if needed
3. Test by making a commit from IDE

## Team Setup

When cloning the project, team members need to:

```bash
# 1. Clone repo
git clone <repo-url>

# 2. Install dependencies (includes Husky)
pnpm install

# 3. Husky hooks are automatically ready to use
```

Husky automatically installs on `pnpm install` (thanks to `postinstall` script).

## Deleting Hooks

If you need to remove Husky completely:

```bash
# Remove Husky from project
pnpm remove husky

# Remove .husky directory
rm -rf .husky
```

## Resources

- [Husky Docs](https://typicode.github.io/husky)
- [Git Hooks Reference](https://git-scm.com/docs/githooks)
- [Git Hooks Best Practices](https://www.atlassian.com/git/tutorials/git-hooks)

## Next Steps

1. ✅ Hooks are installed and ready
2. ✅ Try making a commit: `git add . && git commit -m "test"`
3. ✅ See `pnpm test` run automatically
4. ✅ Try pushing: see `pnpm build` run automatically
5. ✅ Customize hooks if needed (edit `.husky/*` files)

## Quick Reference

| Hook | Runs | Purpose | Block on Failure |
|------|------|---------|-----------------|
| `pre-commit` | `git commit` | Test code | ✅ Yes |
| `pre-push` | `git push` | Build check | ✅ Yes |

**Bypass**: Add `--no-verify` flag (not recommended)
