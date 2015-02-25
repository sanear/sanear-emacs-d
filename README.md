My .emacs.d directory
==============

For best results, run `git clone git@github.com:sanear/sanear-emacs-d.git .emacs.d` in your `$HOME` directory.
Your installation of emacs should pick up all of the configuration and plugins you'd like.
Not that I think this is a particularly good emacs setup - just works for me - but it didn't seem worth $7/mo to keep it private, so use away.

###Contents###
- **init.el**: The config file, pretty messy but it gets the job done. It's reasonably well-commented. In no particular order, it:
    - Disables the annoying/patronizing startup screen
    - Disables the slow, nigh-useless vc-git plugin
    - Enables go-mode
    - Enables golang autocompletion as well as the rest of the autocomplete plugin, including identifying major modes that should default to autocomplete minor mode.
    - Enables pig-mode
    - Enables python-mode and adds some configuration for tabstops and delimeter matching
    - Enables the color-theme package and selects the (excellent) "subdued" theme
    - Configures emacs to compile this init file for later use.
    - Disables tool-bar-mode and menu-bar-mode, because M-x is good enough for everyone
    - Enables global syntax highlighting
    - Enables paren highlighting
    - Enables linum-mode by default (to disable for easy in-console copy-pasting, just run M-x linum-mode)
    - Defaults to text-mode
    - Configures tab width, still only works about half as well as I'd like depending on the major mode
- **color-theme plugin**: Allows selection of various color themes. My favorite is color-theme-subdued
- **auto-complete plugin**: Enables a sexy in-line autocompletion of whatever you're typing.
- **ess**: Emacs Speaks Statistics is a holdover plugin from my R scripting days. I've commented relevant lines in init.el out so that it doesn't slow down my startup, but it's
  a really great tool if you're writing R
- **ssh.el**: A tool I never really got working that I don't recommend. Why is it here, you ask? To remind me that running ssh sessions in Emacs is possible if I need it in the
  future.
- **Language Modes**: These do basic formatting, syntax highlighting, and indentation for specific languages (out of the box, Emacs does this for Java, HTML, XML, etc.)
    - go-mode
    - pig-mode
    - python-mode
