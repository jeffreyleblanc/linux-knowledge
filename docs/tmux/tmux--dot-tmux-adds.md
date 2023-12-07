# Tmux Conf Add Ons

## To simplify and improve status bar:

```
# No more status bar cruft
set -g status-right ''
set -g status-position bottom
# Make it blue and dim
set -g status-style 'bg=colour18 fg=colour137 dim'
# Make current window tab pop
setw -g window-status-current-style 'fg=colour1 bg=colour19 bold'
setw -g window-status-current-format ' #I#[fg=colour249]:#[fg=colour255]#W#[fg=colour249]#F '
# Style other windows dimmer
setw -g window-status-style 'fg=colour9 bg=colour18'
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
```


