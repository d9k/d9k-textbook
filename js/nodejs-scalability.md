# Node.js scalability

Scalability in Node.js is not an afterthought. It’s something that’s baked into the core of the runtime. Node is named Node to emphasize the idea that a Node application should comprise multiple small distributed nodes that communicate with each other.

https://www.freecodecamp.org/news/scaling-node-js-applications-8492bd8afadc/

The easiest thing to do to scale a big application is to clone it multiple times and have each cloned instance [run a Node process on every CPU core of your production machines] and handle part of the workload (with a load balancer, for example). Node.js has the built-in module, cluster, to make it easier for you to implement the cloning strategy on a single server.

https://nodejs.org/api/cluster.html


https://avinetworks.com/glossary/round-robin-load-balancing/

## Shared State vs Sticky Load Balancing

Shared state: With a cluster setup, we can no longer cache things in memory because every worker process will have its own memory space. If we cache something in one worker’s memory, other workers will not have access to it.

Sticky Load Balancing: When a user authenticates with a worker instance, we keep a record of that relation on the load balancer level.

## Zero-downtime Restarts

`process.on('SIGUSR2'`

Restart workers one-by-one.

## Stickie sessions

A load balancer that keeps sticky sessions will create a unique session object for each client. For each request from the same client, the load balancer processes the request to the same web server each time, where data is stored and updated as long as the session exists. Sticky sessions can be more efficient because unique session-related data does not need to be migrated from server to server.

## PM2

https://habr.com/ru/post/480670/

PM2 is a daemon process manager that will help you manage and keep your application online 24/7

`pm2 start app.js`

+ ` -i max`: claster mode

https://pm2.keymetrics.io/docs/usage/cluster-mode/

(see Graceful Shutdown, Stateless)

+ `--max-memory-restart <200MB>`

+ `--watch --ignore-watch="node_modules"`

`pm2 startup`: генерация скрипта запуска процессов при старте системы

`pm2 reload all`: перезапуск всех процессов

### PM2: мониторинг

`pm2 monit`
`pm2 plus` - web-мониторинг

+ сfg

## Workers: send messages to master

https://www.freecodecamp.org/news/scaling-node-js-applications-8492bd8afadc/

## Good practices for high-performance and scalable Node.js applications

https://medium.com/iquii/good-practices-for-high-performance-and-scalable-node-js-applications-part-1-3-bb06b6204197
https://medium.com/iquii/good-practices-for-high-performance-and-scalable-node-js-applications-part-2-3-2a68f875ce79
https://medium.com/iquii/good-practices-for-high-performance-and-scalable-node-js-applications-part-3-3-c1a3381e1382
