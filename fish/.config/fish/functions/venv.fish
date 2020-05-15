# Defined in /var/folders/0d/tgscg8cj0rx035gf2lvl15fh0000gn/T//fish.52ntVU/venv.fish @ line 2
function venv
pyenv virtualenv $argv[1] $argv[2]
echo "$argv[2]" > .python-version
pip install --upgrade pip
end
