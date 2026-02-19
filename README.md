# Tmux Configuration for neovim and zsh compability

This is my personal tmux configuration file that I'm using for my setup of zsh+tmux+neovim with lazyvim.
This is a combination of the following two projects, plus some custom shortcuts
1. [vim style tmux config](https://gist.github.com/tsl0922/d79fc1f8097dde660b34)
2. [Neovim-Tmux Navigation](https://github.com/alexghergh/nvim-tmux-navigation)

## Changes made
###From vim style

Removed status bar modifications because I added nordtheme plugin 

```
# Status Bar
set-option -g status-interval 1
set-option -g status-style bg=black
set-option -g status-style fg=white
set -g status-left '#[fg=green]#H #[default]'
set -g status-right '%a%l:%M:%S %p#[default] #[fg=blue]%Y-%m-%d'

set-option -g pane-active-border-style fg=yellow
set-option -g pane-border-style fg=cyan
```

### Custom shortcuts
Added custom shortcuts for clean screen and command line
```
bind-key C-a send-prefix
bind-key C-l send-keys 'C-l' \; clear-history
bind-key C-k send-keys 'C-k' 
```

### Plugins
Added compability to plugins and nordtheme colorscheme
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin "nordtheme/tmux"

```

### Wayland compability
I use wayland and I have had some issues with some applications that don't run in wayland like AppImageLauncher. If you don't have these issues you can remove this line
```
# Wayland error
set-environment -g QT_QPA_PLATFORM "wayland;xcb"
```

## Installation

1. Clone repository
```
git clone --depth 1 https://github.com/alberto-765/Tmux-Neovim-Configuration.git
cp Tmux-Neovim-Configuration/.tmux.conf ~/.tmux.conf
rm -rf Tmux-Neovim-Configuration
```

2. Run reload tmux command
```
:source-file ~/.tmux.conf
```

3. Sometimes I have had to kill session for a full reload
```
:kill-session
```

## Recommendations
For a fast use of tmux create a keyboard shortcuts, I use WIN + Enter and run 
```
alacritty -e tmux new -A -s main
```
It will create a custom main session for you for the day to day use
