# Defined in - @ line 1
function alsa --wraps=alsamixer --description 'alias alsa alsamixer'
  alsamixer  $argv;
end
