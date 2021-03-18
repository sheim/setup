# Setup script

Just a bash script (for now) to automate a lot of set up stuff when getting a new mac. This is mainly about setting up [homebrew](http://brew.sh/), then using `brew` to install other stuff.
Also, some settings are done for system preferences to be the way I like them.
I recommend looking through the script and adjusting to your own liking, and not just running it blindly.
No guarantees.

## Useful shortcuts to know for newcomers to macOS  

`cmd + spacebar`: default hotkey to `spotlight`
`cmd + tab`: switch between apps
``cmd + ` ``: switch between windows of the current app
`cmd + L`: go to search bar (in most apps)
`/`: go to search bar (in some websites, like GMail)
`cmd + ,`: go to preferences of current app
`spacebar`: quicklook of selected file
`cmd + up`: navigate out of current folder
`cmd + down`: navigate into a folder, or open the file
`cmd + n`: open new window of current app
`shift + cmd + n`: create new folder in Finder
`enter`: rename file
`cmd + backspace`: delete file
`ctrl + a`: go to start of line
`ctrl + e`: go to end of line
`ctrl + k`: delete from cursor to end of line
`ctrl + tab`: go to next tab
`ctrl + shift + tab:` go to previous tab

**Note:** I strongly recommend remapping the `caps-lock` to a `ctrl`, it makes several of these shortcuts a lot more comfortable. You can do this under `Preferences > Keyboard > Keyboard > Modifier Keys...` or with the Karabiner app (better if you're going to remap other things too).

## Git set-up
Apple Finder automatically creates a `.DS_Store` file in every folder, spotlight and other things. See [wiki](https://en.wikipedia.org/wiki/.DS_Store) and [se](http://apple.stackexchange.com/questions/69467/consequences-of-deleting-ds-store). This can get annoying if you mistakenly add it to a repository with `git add --all`, as it will continuously change (and you definitely don't want to push it to a remote). So it gets added to `.gitignore_global` for all our local repos.

## Some recommended Apps
Check the actual setup script for all the apps. Here are some I recommend you start using, which you may not be familiar with if you're new to macOS.

- **osxfuse** mount remote drives with sshfs
- **keepingyouawake** menu-bar app for keeping your machine from sleeping (fork from caffeine)
- **karabiner-elements** Key-remapping app, the continuation of Karabiner
- **iterm2** A better terminal
- [**nvalt**](http://brettterpstra.com/projects/nvalt/) A fantastic, lightweight note-taker. This is a fork from [notational-velocity](http://notational.net/), which I think is actually prettier, but unfortunately doesn't have markdown support.
- **spectacle** menu-bar app providing hotkeys for resizing windows how you want (which has been built-into msft windows forever)
- **cgoban** Client for playing go on the KGS server
- **sabaki** really nice client for editing SGF files
- **BoostNote** nice note-taking
- **SensibleSideButtons** enabls side-buttons on some mice
- **flip4mac** to convert `.wmv` format videos, especially in powerpoint presentations.

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