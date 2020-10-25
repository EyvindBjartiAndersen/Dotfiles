# Defined in - @ line 1
function l --wraps='ls -a' --description 'alias l ls -a'
  ls -a $argv;
end
