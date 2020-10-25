# Defined in - @ line 1
function wifi --wraps='sudo wifi-menu' --description 'alias wifi sudo wifi-menu'
  sudo wifi-menu $argv;
end
