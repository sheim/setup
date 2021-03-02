# Setup script

Just a bash script (for now) to automize a lot of set up stuff when getting a new mac. This includes setting up [homebrew](http://brew.sh/), then mostly using `brew` to install several rather standard libraries and `brew cask` to install several apps (see list below). Also, some settings are done for system preferences to be the way I like them. You probably have different preferences, so the script will ask if you want to do this (amongst other things, it removes almost everything from the dock, so you have a clean slate).

**STALE** I've been updating the setup script sporadically, but not the README. Inspect the actual script before running to comment out what you don't want, or add what you do.
## List of libraries
- **git** the ubiquitous git VCS
- **pandoc** a useful command-line tool for translating markdown to other formats (such as wiki markup)
- **wget** get stuff from the web (required by other stuff)
- **youtube-dl** command-line tool for downloading youtube videos
- **htop** the ubiquitous process viewer (think Activity monitor in the terminal)
- **fdupes** find (and delete) duplicate files by comparing md5s
- **todolist** lightweight todo list in the terminal
- **autoconf, automake, cmake, doxygen, gcc, etc...** programming tools, mostly C++ and Python related

## Git set-up
Apple Finder automatically creates a `.DS_Store` file in every folder, spotlight and other things. See [wiki](https://en.wikipedia.org/wiki/.DS_Store) and [se](http://apple.stackexchange.com/questions/69467/consequences-of-deleting-ds-store). This can get annoying if you mistakenly add it to a repository with `git add --all`, as it will continuously change (and you definitely don't want to push it to a remote). So it gets added to `.gitignore_global` for all our local repos.

## List of apps
- **osxfuse** mount remote drives with sshfs
- **xquartz** window system used for several apps
- **Java**
- **keepingyouawake** menu-bar app for keeping your machine from sleeping (fork from caffeine)
- [**sublime-text**](https://www.sublimetext.com/) a fantastic text editor, which I now use for everything from python to LaTeX
- **visual-studio-code** A text-editor similar to sublime-text, nice for markdown amongst other things. :heart: JD
- **karabiner-elements** Key-remapping app, the continuation of Karabiner. Used to use this in Japan to remap JIS keyboard (which have a lot of extra buttons, it was fantastic).
- **flux** A nice little app that changes the amount of blue hue in your screen depending on the time of day, to mimic natural light
- **google-chrome**
- **firefox**
- **iterm2** A great terminal, completely eclipses the default macOS terminal
- [**nvalt**](http://brettterpstra.com/projects/nvalt/) A fantastic, lightweight note-taker. This is a fork from [notational-velocity](http://notational.net/), which I think is actually prettier, but unfortunately doesn't have markdown support.
- **vlc** the most reliable video-player
- **the-unarchiver**
- **skype**
- **dropbox**
- **mactex** Full LaTeX setup for mac
- **apptrap** Nifty app for making sure all app-files are removed when moving an app to the garbage bin
- **spectacle** menu-bar app providing hotkeys for resizing windows how you want (which has been built-into msft windows forever)
- **cgoban** Client for playing go on the KGS server
- **flip4mac** to convert `.wmv` format videos, especially in powerpoint presentations.
- **hipchat** collaboration chat from Atlassian Confluence
- **handbrake** video conversion tool

- **inconsolata** a great font (not an app) for coding

### Optional (on ask)
- **microsoft office 2011**
- **fish** a great little shell alternative to bash, with a lot of automatic coloring, auto-complete etc.

## Settings
Script asks if you want to do these, so you can run the script just for the libraries/apps too.

- Stop Apple Photos from launching everytime a camera is plugged in
- Expand save and print dialogs by default (show folders etc.)
- Always show scroll-bars on side
- Use un-natural scrolling (old-style scrolling, not tablet-style)
- Turn off auto-spell globally
- Unpin everything from the dock
- Place dock on the left, vertically
- Set windows to minimize instead of having fancy genie-effects
- Tell Chrome to use system-dialog for printing instead of built-in dialog (I like consistency) 

## Further small settings I like:
Set the caps-lock button (which I never use, but is placed in a really ergonomic position) to ctrl, and set Spotlight to active with ctrl+spacebar (instead of cmd+spacebar). Inspired from the JIS keyboard, this is fantastic.

#### iterm2
Under Preferences > Keys > KeyMappings, change `^+tab` to `Next Tab` and `^+shift+tab` to `Previous Tab`, to match Chrome behaviour (and be more intuitive imho).  
Change font to _Inconsolata_ 16pt, and `Non-ASCII Font` to _Inconsolata for Powerline_ 16pt.

#### Sublime Text 3
Under `Sublime Text > Preferences > Key Bindings`, add the following to obtain the same tabbing behaviour as Chrome (simple next/previous).  
```
[
    { "keys": ["ctrl+tab"], "command": "next_view" },
    { "keys": ["ctrl+shift+tab"], "command": "prev_view" },
]
```