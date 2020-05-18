Python virtual environments
===========================

Create
------

	virtualenv -p $(which python3.4) venv


Activate/desactivate
--------------------

	venv/bin/activate
	...
	# it is a shell function defined in activate:
	deactivate