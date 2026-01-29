# Claude AI Configuration for African Puzzle Flutter Project

## Repository Safety Configuration

This configuration ensures Claude AI agents always work with the correct fork and avoid upstream repository operations.

## Git Remote Configuration

The project is configured with:
- **origin**: `https://github.com/african-puzzle/flutter-claude-code.git` (correct fork)
- **upstream**: `https://github.com/cleydson/flutter-claude-code.git` (original - READ ONLY)

## AI Agent Guidelines

### ALWAYS Use These Commands

```bash
# Branch operations - ALWAYS use origin
git checkout -b feature-branch-name
git push origin feature-branch-name
git pull origin main

# NEVER use upstream for push operations
# NEVER create PRs to upstream
```

### Forbidden Operations

```bash
# ❌ NEVER run these commands:
git push upstream any-branch
git pull upstream main (except for tracking updates)
git remote set-url origin https://github.com/cleydson/flutter-claude-code.git
```

### Safe Operations

```bash
# ✅ SAFE to run these commands:
git fetch upstream main  # To track upstream changes
git log upstream/main   # To view upstream history
git diff upstream/main  # To compare with upstream
```

## Repository Verification

Before any git operation, verify:

1. **Check current remotes**:
   ```bash
   git remote -v
   # Should show origin pointing to african-puzzle fork
   ```

2. **Verify current branch**:
   ```bash
   git branch
   # Should show working on feature branch, not main
   ```

3. **Check push destination**:
   ```bash
   git config --get remote.origin.url
   # Should return: https://github.com/african-puzzle/flutter-claude-code.git
   ```

## AI Agent Memory Context

This configuration should be stored in AI memory as:
- Project: African Puzzle Flutter Claude Code
- Fork URL: https://github.com/african-puzzle/flutter-claude-code
- Upstream URL: https://github.com/cleydson/flutter-claude-code (READ ONLY)
- Rule: NEVER push to upstream, ALWAYS use origin for push operations

## Emergency Recovery

If incorrect remote is configured:

```bash
# Reset to correct configuration
git remote set-url origin https://github.com/african-puzzle/flutter-claude-code.git
git remote set-url upstream https://github.com/cleydson/flutter-claude-code.git
```

## Verification Checklist

Before any commit/push operation:
- [ ] origin points to african-puzzle/flutter-claude-code
- [ ] upstream points to cleydson/flutter-claude-code
- [ ] Current branch is a feature branch, not main
- [ ] Push command uses origin, not upstream
- [ ] PR will be created to african-puzzle fork, not upstream

---

**Last Updated**: 2026-01-29
**Purpose**: Prevent AI agents from accidentally pushing to upstream repository
