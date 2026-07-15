# Project image import

Drop one folder per design project here. The folder name becomes the project
title (hyphens/underscores become spaces, words are capitalised), and every
image inside is attached to that project in filename order.

## Example layout

```
storage_import/
├── speleothem-chair/     →  Project "Speleothem Chair"
│   ├── 01.jpg
│   ├── 02.jpg
│   └── 03.jpg
└── sedimental-stool/     →  Project "Sedimental Stool"
    ├── 01.jpg
    └── 02.jpg
```

Supported formats: .jpg .jpeg .png .webp .gif .avif
Tip: name files 01, 02, 03… to control the order they appear in the viewer.

## Run the import

```bash
bin/rails projects:import
```

Re-running is safe — a project's existing uploaded photos are replaced, not
duplicated. To import from a different directory:

```bash
bin/rails projects:import DIR=some_other_folder
```
