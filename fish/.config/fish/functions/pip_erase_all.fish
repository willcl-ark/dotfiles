function pip_erase_all
	pip freeze | xargs pip uninstall -y
end
