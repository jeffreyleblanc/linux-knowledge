# Vim Topics To Handle

## Multiline Updates

Pattern to explore more:

1. Go to where you want to start
2. Hit `ctrl v`
3. move to last line you want to apply to
4. hit `shift i`
5. type what you want, for example "#> "
6. hit `esc` or `ctrl [`
7. The text will be applied to all lines.

A question is what pattern can remove things like this?

Basically we need to explore the mode from `ctrl v` vs `shift v` (and `v`).
Worth googling "Introduction to Vim Modes" to learn more.

## Vim Plugins

Might be worth seeing how to make a plugin.

For example a tool to help with commenting within markdown fenced code sections.

## The dot Operator

This seems potentially useful. It can repeat previous changes to the buffer.

