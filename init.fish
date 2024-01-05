# aliases
alias vim=nvim
alias cat=bat
alias ls=eza
alias t=todo
alias grep=rg

abbr --add l ls

# functions

function open-project -d "CD to a directory in the projects directory";
  set -l projects_dir projects
  set -l red "#FF0000"
  set -l green "#00FF00"
  set -l lines 5
  set -l prompt "Project >"
  set -l dirname (find ~/$projects_dir -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | dmenu -b -p "$prompt" --nf "$green" --sb "$red" -l $lines --font "FiraCode-21")
  if [ -n "$dirname" ]; then
    cd ~/"$projects_dir"/"$dirname" || return
  end
end

abbr --add p open-project

function fix_touchpad;
  # TODO: fix the problem later
  sudo modprobe -r hid_multitouch
  sudo modprobe hid_multitouch
end
fish_add_path ~/opt/bin

