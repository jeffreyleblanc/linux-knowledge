# Journalctl

`journalctl` displays logs (journals) for systemd units.

## Command Patterns

Filtering by unit, user, etc

```sh
# View entire journal
$ journalctl

# Viewing a specific unit
$ journalctl -r _SYSTEMD_UNIT=UNIT_NAME.service
# or more simply:
$ journalctl -u UNIT_NAME

# Viewing journal relevant to a specfic user
$ journalctl _UID=$(id -u USERNAME)

# Viewing pid
$ journalctl _UID=USER_ID _PID=PID
```

Some useful flags

```sh
# Direction
-r              # In reverse, most recent first
-f              # Follow, appending new entries

# Filters
-b              # Just since most recent boot
-g TERM         # Grep within journal
# And you can use human language time
--since "10 minutes ago"

# Output
-n N            # Only show N most recent lines
-x              # Add explanatory messages
-l              # ellipsize lines to terminal width
--no-hostname   # Don't show the hostname
-o cat          # Simple lines, no timestamp
-o json         # use json output
-o short-iso    # use iso dateformat
# ...many other formats, `man journalctl` to review
```

## Configuration and Files

Typically journal config is at `/etc/systemd/journald.conf`,
and journals are in `/var/log/journal` or possibly `/run/log/journal`.
However, it's rare to want to change the settings or look directly at journals.

## Links and Resources

* <https://www.digitalocean.com/community/tutorials/how-to-use-journalctl-to-view-and-manipulate-systemd-logs>

