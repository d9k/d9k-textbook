Python SqlAlchemy
=================

Советы
------

http://alextechrants.blogspot.ru/2013/11/10-common-stumbling-blocks-for.html


Обновление по relationship
--------------------------

http://docs.sqlalchemy.org/en/latest/orm/cascades.html

Raw execute
-----------

	db.engine.execute("<sql here>")

or 

	from sqlalchemy import text
	sql = text('select name from penguins')
	result = db.engine.execute(sql)
	names = []
	for row in result:
	    names.append(row[0])

	print names

sync models ids
---------------

DBSession.flush()

tables reflection
-----------------

    from sqlalchemy.engine.reflection import Inspector
    inspector = Inspector.from_engine(connection.engine)

OR in conditions
----------------

    from sqlalchemy import or_
    filter(or_(User.name == 'ed', User.name == 'wendy'))

Автозаполнение внешних ключей
-----------------------------

http://docs.sqlalchemy.org/en/latest/orm/cascades.html


