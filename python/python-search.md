
regex: catch groups
-------------------

	xrandr_lines = os.popen("xrandr").read()
	outputs = re.findall(r'([\-\w]+) connected', xrandr_lines, re.M)
	for output in outputs:
		# ....