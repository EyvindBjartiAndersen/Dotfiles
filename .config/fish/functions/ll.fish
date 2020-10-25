# Defined in - @ line 1
function ll --wraps='ls -l' --description 'alias ll ls -l'
  ls -l $argv;
end
