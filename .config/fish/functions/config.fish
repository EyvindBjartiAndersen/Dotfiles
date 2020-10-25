# Defined in - @ line 1
function config --wraps='git --git-dir=/home/vuoto/.cfg/ --work-tree=/home/vuoto' --description 'alias config=git --git-dir=/home/vuoto/.cfg/ --work-tree=/home/vuoto'
  git --git-dir=/home/vuoto/.cfg/ --work-tree=/home/vuoto $argv; 
end
