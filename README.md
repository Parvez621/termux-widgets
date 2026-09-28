# Termux Widgets Collection

A curated collection of ready-to-use **Termux:Widget** scripts for Android automation.

Turn repetitive terminal commands into one-tap actions directly from your Android home screen.

## Features

- One-tap automation
- Organized script categories
- Media downloading with `yt-dlp`
- Instagram Reels downloader
- Android automation through Termux:API
- Simple installation
- Beginner-friendly documentation
- Community contributions welcome

## Requirements

- Termux
- Termux:Widget
- Optional: Termux:API for Android automation scripts
- `git`, `curl`, `wget`, `python`
- `yt-dlp` and `ffmpeg` for media scripts

> Install Termux and Termux:Widget from a compatible source such as F-Droid/GitHub releases rather than mixing Termux components from different sources.

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/termux-widgets.git
cd termux-widgets
chmod +x install.sh
./install.sh
```

The installer creates `~/.shortcuts`, copies the widget scripts, installs the common media dependencies, and sets executable permissions.

After installation, open **Termux:Widget** and refresh the widget list.

## Directory Structure

```text
termux-widgets/
├── Media/
│   ├── Download-YouTube.sh
│   ├── Download-Instagram-Reel.sh
│   ├── Download-Audio.sh
│   └── Convert-To-MP3.sh
├── System/
│   ├── Update-Packages.sh
│   ├── Cleanup-Cache.sh
│   └── Battery-Info.sh
├── Development/
│   ├── Start-Jupyter.sh
│   ├── Run-Python-Project.sh
│   └── Git-Pull-Push.sh
├── Android/
│   ├── Take-Photo.sh
│   ├── Toggle-Flashlight.sh
│   └── Save-Location.sh
├── lib/
│   └── common.sh
├── install.sh
├── uninstall.sh
├── LICENSE
└── README.md
```

Termux:Widget runs scripts from `~/.shortcuts/`; subdirectories can be used to organize scripts into menus. The official Termux:Widget documentation describes `~/.shortcuts/` as the foreground-script directory. citeturn0search0

## Media Widgets

### Download YouTube Video

Copy a YouTube URL and tap the widget. The script uses `yt-dlp` and saves the result under:

```text
~/storage/downloads/Termux-Widgets/YouTube/
```

### Download Instagram Reel

Copy an Instagram Reel URL and tap **Download Instagram Reel**.

```text
https://www.instagram.com/reel/...
```

The script accepts public Reel URLs and uses `yt-dlp`. Instagram can require authentication or rate-limit requests, so some Reels may require an authenticated cookies file; this is a limitation of Instagram/its extractor rather than the widget itself. yt-dlp documents cookie-based authentication, and recent Instagram reports show that login requirements can change. citeturn0search1turn0search8

This project does **not** attempt to bypass private accounts, access controls, or authentication. Only download content you are authorized to download and use it in accordance with applicable law, licenses, and platform terms.

### Download Audio

Copy a supported media URL and tap the widget. Audio is extracted as the best available audio stream and converted using `ffmpeg`.

### Convert to MP3

Select a local media file from the Termux prompt and convert it to MP3.

## Android Automation

These scripts require Termux:API:

- Take a photo
- Toggle flashlight
- Save current location
- Battery information

Install the API package in Termux if you want to use these features:

```bash
pkg install termux-api
```

You must also install the **Termux:API** Android app from the same Termux distribution source as your Termux installation.

## Instagram Cookies (Optional)

If Instagram asks for login, `yt-dlp` supports `--cookies` and `--cookies-from-browser`. On Android/Termux, the practical approach is usually to export an Instagram cookies file on a trusted desktop browser and copy it to a private Termux location.

Example:

```bash
mkdir -p ~/.config/termux-widgets
chmod 700 ~/.config/termux-widgets
```

Then place the cookie file at:

```text
~/.config/termux-widgets/instagram-cookies.txt
```

The Reel downloader automatically uses that file if it exists. **Never commit cookies to Git.** The repository's `.gitignore` excludes cookie files.

## Storage

For shared Android storage:

```bash
termux-setup-storage
```

Downloaded media is stored under `~/storage/downloads/Termux-Widgets/`.

## Troubleshooting

### Widget does not appear

Open Termux:Widget and refresh the widget list. Make sure the scripts and their parent directories are executable/readable. citeturn0search0

### `yt-dlp: command not found`

Run:

```bash
pkg install python ffmpeg
python -m pip install -U yt-dlp
```

### Instagram says login is required

Instagram frequently changes access requirements. If the Reel is accessible to your account, configure an appropriate cookies file as described above. yt-dlp documents cookie handling here. citeturn0search1

### Downloads fail after an Instagram change

Update yt-dlp first:

```bash
python -m pip install -U yt-dlp
```

The Instagram extractor can break when Instagram changes its web/API behavior, so a downloader cannot guarantee permanent compatibility. citeturn0search9

## Contributing

Contributions are welcome.

When submitting a script:

- Keep it simple.
- Include comments where necessary.
- Document dependencies.
- Test before submitting.
- Follow the existing folder structure.
- Never commit credentials, cookies, tokens, or personal data.

## Disclaimer

This repository provides automation scripts only. Users are responsible for ensuring that any content downloaded or processed using these scripts complies with applicable laws, licenses, copyright requirements, and platform terms of service.

## Vision

Make Android automation accessible through simple, reusable, one-tap widgets powered by Termux.

No complicated setup. No searching through old forum posts. Just useful scripts that work.
