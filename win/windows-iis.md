# Windows IIS

- "Internet Information Services"
- [Internet Information Services - Wikipedia](https://en.wikipedia.org/wiki/Internet_Information_Services)

## IIS: edit request timeout

- [x] [asp.net - How to increase request timeout in IIS? | SO](https://stackoverflow.com/questions/2414441/how-to-increase-request-timeout-in-iis)
- Optional TimeSpan attribute - maximum number of seconds that a request is allowed to execute before being automatically shut down by ASP.NET. The default is 110 seconds
- In `IIS Manager`, right click on the site and go to `Manage Web Site -> Advanced Settings`. Under `Connection Limits` option, you should see `Connection Time-out`.