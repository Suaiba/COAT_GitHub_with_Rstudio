# Git and GitHub setup for RStudio

This repository contains small R scripts that will help configure Git, connect RStudio to GitHub, and push an RStudio Project to a new GitHub repository. Aimed at people new to version control.

The workflow follows [How to Use Git/GitHub with R](https://rfortherestofus.com/2021/02/how-to-use-git-github-with-r) by R for the Rest of Us. See that article for screenshots and a fuller explanation of each step.

> **Git** is the version-control system that runs locally on your computer. **GitHub** is the online service that hosts Git repositories for backup, sharing and collaboration.

## Repository contents

```text
.
├── Git_setup_with_rstudio/
│   ├── 01_Git_configuration.R
│   └── 02_Git_initialise.R
├── GitHub_setup_with_rstudio/
│   ├── 01_connect_rstudio_and_github.R
│   └── 02_put_rstudio_code_on_github.R
├── .gitignore
└── README.md
```

## Requirements

- [R](https://cran.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/)
- [Git](https://git-scm.com/downloads)
- A free [GitHub account](https://github.com/)
- The `usethis` and `gitcreds` packages: `install.packages(c("usethis", "gitcreds"))`

Check that Git is installed by running this in the RStudio Console. It should print a version number:

```r
system("git --version")
```

## Setup

Open your RStudio Project, then run the lines in the scripts in this order from the Console tab.

| # | Script | What it does |
|---|--------|--------------|
| 1 | `Git_setup_with_rstudio/01_Git_configuration.R` | Sets your Git name, email and default branch |
| 2 | `Git_setup_with_rstudio/02_Git_initialise.R` | Turns the project into a Git repository |
| 3 | `GitHub_setup_with_rstudio/01_connect_rstudio_and_github.R` | Creates a GitHub token and stores it |
| 4 | `GitHub_setup_with_rstudio/02_put_rstudio_code_on_github.R` | Creates the GitHub repo and pushes the project |

### 1. Configure Git

```r
library(usethis)

use_git_config(
  user.name = "Your Name",
  user.email = "your-email@example.com"  # ideally the email on your GitHub account
)

git_default_branch_configure()  # e.g. choose "main"
```

Replace the example name and email with your own.

### 2. Initialise Git in the project

```r
use_git()
```

This creates a hidden `.git` folder and enables the **Git** pane in RStudio (you may need to restart RStudio).

### 3. Connect RStudio to GitHub

```r
library(usethis)
library(gitcreds)

create_github_token()  # opens GitHub in your browser
gitcreds_set()         # paste the token when prompted
```

On GitHub, give the token a descriptive name, choose an expiry date, generate it and copy it straight away, because it is only shown once.

> **Never** put a token in a script, commit it, or share it. If one is exposed, revoke it on GitHub and create a new one.

### 4. Put the project on GitHub

```r
use_github()
```

This creates the repository on GitHub, adds it as the remote and pushes your project. Open the repository URL afterwards to confirm your files are there.

## Everyday workflow

Use the RStudio **Git** panel:

1. **Pull** to get the latest changes (especially when collaborating)
2. Edit your files
3. Tick the files to stage, click **Commit** and write a clear message (`Fix data import path`, not `Updates`)
4. **Push** to send your commits to GitHub

Commits are saved locally until you push them.

## Troubleshooting

- **No Git panel:** check Git is installed, the project is open via its `.Rproj` file, `use_git()` has been run, and restart RStudio.
- **Authentication fails:** run `gitcreds::gitcreds_set()` again, or revoke the token and create a new one.
- **File missing from the Git panel:** check it is saved in the project folder and not listed in `.gitignore`.
- **Push rejected:** pull first, resolve any conflicts, commit, then push again. Avoid force-pushing.
- **Token committed by accident:** revoke it on GitHub immediately, create a new one and remove it from your files. Adding it to `.gitignore` afterwards does not make it safe.

## Notes

- `.gitignore` lists files Git should not track, such as session files, credentials and private data.
- If the project uses [`renv`](https://rstudio.github.io/renv/), others can recreate your package environment with `renv::restore()`.

## Further resources

- [How to Use Git/GitHub with R](https://rfortherestofus.com/2021/02/how-to-use-git-github-with-r)
- [Git documentation](https://git-scm.com/doc) · [GitHub documentation](https://docs.github.com/)
- [`usethis`](https://usethis.r-lib.org/) · [`gitcreds`](https://gitcreds.r-lib.org/)
