# COMMIT RULES

## Setting up your local environment

- Step 1: Fork
- Step 2: Build
- Step 3: Branch

## Making Changes

- Step 4: Code
- Step 5: Commit - Commit message guidelines
- Step 6: Rebase
- Step 7: Test
- Step 8: Push
- Step 9: Opening the Pull Request
- Step 10: Discuss and Update - Approval and Request Changes Workflow
- Step 11: Landing

### Step 1: Fork

Fork the project on GitHub and clone your fork locally.

```

```

### Step 2: Build

### Step 3: Branch

To keep your development environment organized, create local branches to hold your work. These should be branched directly off of the master branch.

```
git checkout -b my-branch -t upstream/master
```

### Step 4: Code

### Step 5: Commit

It is recommended to keep your changes grouped logically within individual commits. Many contributors find it easier to review changes that are split across multiple commits. There is no limit to the number of commits in a pull request.

```
git add my/changed/files
git commit
```

Note that multiple commits get squashed when they are landed.

#### Commit message guidelines

A good commit message should describe what changed and why. The Electron project uses semantic commit messages to streamline the release process.

Before a pull request can be merged, it must have a pull request title with a semantic prefix.

Examples of commit messages with semantic prefixes:

- fix: don't overwrite prevent_default if default wasn't prevented
- feat: add app.isPackaged() method
- docs: app.isDefaultProtocolClient is now available on Linux

Common prefixes:

- fix: A bug fix
- feat: A new feature
- docs: Documentation changes
- test: Adding missing tests or correcting existing tests
- build: Changes that affect the build system
- ci: Changes to our CI configuration files and scripts
- perf: A code change that improves performance
- refactor: A code change that neither fixes a bug nor adds a feature
- style: Changes that do not affect the meaning of the code (linting)

Other things to keep in mind when writing a commit message:

1. The first line should:
   contain a short description of the change (preferably 50 characters or less, and no more than 72 characters)
   be entirely in lowercase with the exception of proper nouns, acronyms, and the words that refer to code, like function/variable names
2. Keep the second line blank.
3. Wrap all other lines at 72 columns.

Breaking Changes:
A commit that has the text BREAKING CHANGE: at the beginning of its optional body or footer section introduces a breaking API change (correlating with Major in semantic versioning). A breaking change can be part of commits of any type. e.g., a fix:, feat: & chore: types would all be valid, in addition to any other type.

#### Step 6: Rebase

Once you have committed your changes, it is a good idea to use git rebase (not git merge) to synchronize your work with the main repository.

```
git fetch upstream
git rebase upstream/main
```

#### Step 7: Test

#### Step 8: Push

Once your commits are ready to go -- with passing tests and linting -- begin the process of opening a pull request by pushing your working branch to your fork on GitHub.

```
git push origin my-branch
```

#### Step 9: Opening the Pull Request

#### Step 10: Discuss and update

#### Step 11: Landing
