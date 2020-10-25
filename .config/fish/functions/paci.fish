# Defined in - @ line 1
function paci --wraps='sudo pacman -S' --description 'alias paci sudo pacman -S'
  sudo pacman -S $argv;
end
