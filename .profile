# Source a properly-timestamped file : 1710669104
function confirm-stamp() {
  modified=$(stat -c %Y "$1")
  timestamp=$(head -n 1 "$1"|awk -F ': ' '{print $NF}')
  [[ $modified == $timestamp ]] \
    && source "$1" \
    || echo -e "\033[38;5;160mInvalid timestamp: $1\033[0m"
}

# TODO : Move to proper profile location
export CC="zig cc"
export XDG_CONFIG_HOME=$HOME/.local/etc
export XH=$XDG_CONFIG_HOME
export XDG_CONFIG_PROFILE=$XH/profile.d
export XP=$XDG_CONFIG_PROFILE

alias make='make CC=$CC'

for profile in $XP/*.sh
do
  confirm-stamp $profile
done
