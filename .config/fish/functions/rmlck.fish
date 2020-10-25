# Defined in - @ line 1
function rmlck --wraps='sudo rm /var/lib/pacman/db.lck' --description 'alias rmlck sudo rm /var/lib/pacman/db.lck'
  sudo rm /var/lib/pacman/db.lck $argv;
end
