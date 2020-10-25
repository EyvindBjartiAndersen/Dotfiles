# Defined in - @ line 1
function pacs --wraps='sudo pacman -Ss' --description 'alias pacs sudo pacman -Ss'
  sudo pacman -Ss $argv;
end
