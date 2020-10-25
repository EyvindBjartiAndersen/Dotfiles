# Defined in - @ line 1
function pg --wraps='ping google.com' --description 'alias pg ping google.com'
  ping google.com $argv;
end
