# Buğra Kaplan academic site — GitHub Pages package

Extract this ZIP and copy **the contents** (including `index.html`, `script.js`, `style.css`, `courses/`, `assets/` and `CNAME`) to the root of the GitHub Pages branch. The archive itself should not be uploaded as a single file to the repository. Preview locally with `python3 -m http.server 8000` from this directory; open `http://localhost:8000/`.

The home page and all course pages share English, Turkish and German language selection. The course pages list individual PDFs and MATLAB files in the course's `materials/` directory. GitHub Pages URLs are relative, so they work on the custom domain and on a repository preview.

## Courses

- `thermodynamics`: 15 notes, 15 applications
- `fluid-mechanics`: 12 notes, 16 applications, one supplementary archive and provenance files
- `numerical-methods`: 25 notes, 7 applications and MATLAB source files
- `heat-transfer`: overview with links to the next four courses
- `me320`, `me420`, `me521`: weekly heat-transfer notes
- `micro-scale-heat-transfer`: six user-supplied chapter PDFs
- `engineering-mathematics`, `differential-equations`: placeholders for future resources

Each course has `materials.json` and `index.html`. To add a file, put it in `courses/<slug>/materials/<category>/` and add a record with `file`, `title`, `category` (`notes`, `applications`, `matlab`, `source`) and `size` in bytes. `SOURCE_AND_RIGHTS.txt` documents the provenance of each populated course. The instructor's name on this website identifies the site's owner, not the authorship of all linked materials.

## Publishing review

Before making the repo public, confirm distribution rights for the included PDFs, especially publisher figures/chapters and the Micro Scale Heat Transfer chapter files. Permission from an instructor does not necessarily cover publisher-owned content. MIT OCW material is credited in its course page and supplied provenance; third-party parts identified as excluded from its Creative Commons license need separate review. The material was not reviewed for academic correctness.

The individual resource files are below GitHub's 25 MiB browser-upload limit. The site package as a whole is larger than a single browser upload: extract it and upload files or use Git. GitHub Pages source size should also be monitored if more media are added. The original CV in `assets/BugraCV.pdf` and Fall 2026–2027 timetable placeholder remain to be reviewed.
