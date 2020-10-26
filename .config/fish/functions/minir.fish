# Defined in - @ line 1
function minir --wraps='sudo minidlnad -R' --description 'alias minir=sudo minidlnad -R'
  sudo minidlnad -R $argv; 
end
