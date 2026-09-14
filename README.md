# SystemUtilities

A compact toolbox for recurring engineering work: environment management, repository context, media processing, resource monitoring, and command references. Each utility is standalone; use the smallest tool that solves the task.

## Repository map

```text
.
├── .gitignore
├── README.md
├── cheat-sheets
│   ├── docker-commands.md
│   ├── dockerfile-reference.md
│   ├── fastapi-commands.md
│   ├── git-commands.md
│   ├── kubernetes-commands.md
│   ├── kubernetes-yaml-cheat-sheet v2.md
│   ├── linux-bash-commands.md
│   ├── math-notation-reference.md
│   ├── poetry-commands.md
│   ├── pytest-commands.md
│   ├── sql-commands.md
│   └── statistical-tests-reference.md
├── context-mgmt-dump-file-contents.sh
├── environment-mgmt
│   ├── class-and-function-inspection.ipynb
│   ├── conda-create-finance-env.sh
│   ├── conda-create-notebook-env.sh
│   ├── conda-list-env-details.sh
│   ├── macOS-get-PATH-variables.ipynb
│   ├── macOS-list-python-versions.ipynb
│   └── macOS-pip-dependency-manager.ipynb
├── git-edit-push-no_push.sh
├── media-conversion
│   ├── convert-mov-to-mp4
│   │   ├── README.md
│   │   └── convert-mov-to-mp4.sh
│   └── pdf-converter
│       └── nbconvert.sh
├── media-transcription
│   └── transcribe-media
└── resource-monitoring
    ├── active-resource-monitor.py
    ├── active-resource-monitor.sh
    └── active-resource-monitoring.ipynb
```

Most scripts operate on the current directory and assume a macOS/Bash environment. Dependencies are utility-specific and include Conda/Jupyter, `psutil`, FFmpeg, and `whisper.cpp`. Review a script before running it: the environment creators replace same-named Conda environments, and the Git utility changes `origin`'s push configuration.
