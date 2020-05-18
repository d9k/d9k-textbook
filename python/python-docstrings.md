Python docstrings
=================

1) To create function documentation press alt+Enter in function header and select "insert documentation string stub" https://www.jetbrains.com/pycharm/webhelp/creating-documentation-comments.html 
2) The default format of docstrings in PyCharm is "restructured text". You can change it to Epytext (as in above Tony Melony listing) at File->Settings->Python Integrate Tools->Dostring Format . See epydoc reference http://epydoc.sourceforge.net/epytext.html

http://stackoverflow.com/a/22552647/1760643

http://legacy.python.org/dev/peps/pep-0257/

function annotations
--------------------

http://legacy.python.org/dev/peps/pep-3107/
http://code.activestate.com/recipes/578528-type-checking-using-python-3x-annotations/

doctests
--------

python -m doctest -v file.py

http://blog.jetbrains.com/pycharm/2012/11/pycharm-2-7-early-access-preview/
https://docs.python.org/2/library/doctest.html
