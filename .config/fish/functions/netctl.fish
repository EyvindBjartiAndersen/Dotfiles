# Defined in - @ line 1
function netctl --wraps='sudo netctl' --description 'alias netctl sudo netctl'
  sudo netctl $argv;
end
