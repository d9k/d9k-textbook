Python ZODB
===========

> You will start to rely on Persistence classes. Every data migration will become a pain. You will have to use ZCatalog for indexing or even iterating objects - undocumented and unusable without obscure PluginIndex-es for each data type.

> I need to be able to:
> 1.  ensure that every field in ever record conforms to a specific schema with explicit data types
> 2.  be able to open a query tool and select/inspect any number of records
> 3.  be able to easily define schema changes and confirm that all records have been updated
> ZODB does none of these well.

> I worked with it for about four years on a legacy system that was the company's cash-cow. I'd prefer to never use it again.
> First off, fail-over and clustering were awkward and unreliable.....
> Also, as the number of users we added to the system grew (not a lot really...maybe a few thousand concurrent), we saw more and more ZODB conflict issues. Next, it was damn slow for everything except reads (which it really excels at) under heavy load. Finally, nobody uses it figuratively speaking....so it has a tiny user community and finding people that want to work with ZODB becomes more difficult.
> TLDR; I hated it and found it to be awkward, slow and unreliable in production.

https://www.reddit.com/r/Python/comments/2e5gfh/zodb_should_i_use_it/
