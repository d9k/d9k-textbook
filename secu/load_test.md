Нагрузочное тестирование
========================

apache benchmark - ab
---------------------

	sudo apt-get install apache2-utils
	ab -k -c 350 -n 20000 mysite.com/

`-c`: Indicates how many clients (people) will be hitting the site at the same time. This means "concurrency". At any moment as the tool runs, there will be -c clients hitting the site. This is what actually decides the amount of stress your site will suffer during the benchmark.

`-n`: This indicates how many requests are going to be done to the site. This just decides the length of the benchmark. High -n value with a -c value that your server can support is a good idea to ensure that things don't break under sustained stress: it's not the same to support stress for 5 seconds than for 5 hours.

`-k`: This does the "KeepAlive" funcionality browsers do by nature. You don't need to pass a value for -k as it it "boolean" (meaning: it indicates that you desire for your test to use the Keep Alive header from HTTP and sustain the connection). Since browsers do this and you're likely to want to simulate the stress and flow that your site will have from browsers, it is recommended you do a benchmark with this.



[](http://stackoverflow.com/questions/66606/what-package-includes-ab-the-apache-server-benchmarking-tool-in-ubuntu)
[](http://stackoverflow.com/questions/12732182/ab-load-testing)