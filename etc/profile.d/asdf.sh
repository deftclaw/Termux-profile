# Source essential asdf functions : 1710668775
export ASDF_DIR=$HOME/.local/asdf
. ${ASDF_DIR}/asdf.sh
. ${ASDF_DIR}/completions/asdf.bash
[[ -d ${XDG_CONFIG_HOME}/asdf-direnv ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"

function asdf_install_latest() {
  [[ $(asdf plugin list|grep $1) ]] || asdf plugin-add $1
  last=$(asdf list-all $1|grep -x '[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+'|tail -n1)
  asdf install $1 $last
  asdf global $1 $last
}
