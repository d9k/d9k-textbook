Java JRE
========

Установить java 8
-----------------

	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer

        # environment variables:
	sudo apt-get install oracle-java8-set-default

Переключить версию на ubuntu
----------------------------

	sudo update-alternatives --config java
	sudo update-alternatives --config javaс
	# ... ???


        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/ControlPanel to provide /usr/bin/ControlPanel (ControlPanel) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/java to provide /usr/bin/java (java) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/javaws to provide /usr/bin/javaws (javaws) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/jcontrol to provide /usr/bin/jcontrol (jcontrol) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/jjs to provide /usr/bin/jjs (jjs) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/keytool to provide /usr/bin/keytool (keytool) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/orbd to provide /usr/bin/orbd (orbd) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/pack200 to provide /usr/bin/pack200 (pack200) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/policytool to provide /usr/bin/policytool (policytool) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/rmid to provide /usr/bin/rmid (rmid) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/rmiregistry to provide /usr/bin/rmiregistry (rmiregistry) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/servertool to provide /usr/bin/servertool (servertool) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/tnameserv to provide /usr/bin/tnameserv (tnameserv) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/unpack200 to provide /usr/bin/unpack200 (unpack200) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/lib/jexec to provide /usr/bin/jexec (jexec) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/appletviewer to provide /usr/bin/appletviewer (appletviewer) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/extcheck to provide /usr/bin/extcheck (extcheck) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/idlj to provide /usr/bin/idlj (idlj) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jar to provide /usr/bin/jar (jar) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jarsigner to provide /usr/bin/jarsigner (jarsigner) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javac to provide /usr/bin/javac (javac) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javadoc to provide /usr/bin/javadoc (javadoc) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javafxpackager to provide /usr/bin/javafxpackager (javafxpackager) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javah to provide /usr/bin/javah (javah) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javap to provide /usr/bin/javap (javap) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javapackager to provide /usr/bin/javapackager (javapackager) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jcmd to provide /usr/bin/jcmd (jcmd) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jconsole to provide /usr/bin/jconsole (jconsole) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jdb to provide /usr/bin/jdb (jdb) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jdeps to provide /usr/bin/jdeps (jdeps) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jhat to provide /usr/bin/jhat (jhat) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jinfo to provide /usr/bin/jinfo (jinfo) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jmap to provide /usr/bin/jmap (jmap) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jmc to provide /usr/bin/jmc (jmc) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jps to provide /usr/bin/jps (jps) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jrunscript to provide /usr/bin/jrunscript (jrunscript) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jsadebugd to provide /usr/bin/jsadebugd (jsadebugd) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jstack to provide /usr/bin/jstack (jstack) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jstat to provide /usr/bin/jstat (jstat) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jstatd to provide /usr/bin/jstatd (jstatd) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jvisualvm to provide /usr/bin/jvisualvm (jvisualvm) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/native2ascii to provide /usr/bin/native2ascii (native2ascii) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/rmic to provide /usr/bin/rmic (rmic) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/schemagen to provide /usr/bin/schemagen (schemagen) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/serialver to provide /usr/bin/serialver (serialver) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/wsgen to provide /usr/bin/wsgen (wsgen) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/wsimport to provide /usr/bin/wsimport (wsimport) in auto mode
        update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/xjc to provide /usr/bin/xjc (xjc) in auto mode

Переключение auto/manual

	`alternatives-auto`, `alternatives-manual`

Лучший путь:

	 % sudo update-java-alternatives -l
	java-1.7.0-openjdk-amd64 1071 /usr/lib/jvm/java-1.7.0-openjdk-amd64
	java-7-oracle 1072 /usr/lib/jvm/java-7-oracle
	java-8-oracle 1073 /usr/lib/jvm/java-8-oracle
	% sudo update-java-alternatives -s java-8-oracle
	% sudo update-java-alternatives -s java-7-oracle

Посмотреть текущую версию
-------------------------

и путь к ней

	% readlink -f $(which java)
	/usr/lib/jvm/java-7-oracle/jre/bin/java
	# или
	# /usr/lib/jvm/java-8-oracle/jre/bin/java