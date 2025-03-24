# PowerShell

## cmdlet

### What is a Cmdlet and How Does It Work? | Definition from TechTarget

- https://www.techtarget.com/whatis/definition/cmdlet

A cmdlet typically exists as a small script that is intended to perform a single specific function such as coping files and changing directories.

Cmdlets employ a verb/noun naming pattern that is designed to make each cmdlet easier to remember and read.

Cmdlets are based on .NET classes and rely on the use of .NET objects. Thus, cmdlets can receive objects as input and deliver objects as output, which can then feed the input of subsequent objects, enabling cmdlets to form a command pipeline.

```PowerShell
get-command -commandtype cmdlet
get-help add-appxpackage
```

## Verbs

### Approved Verbs for PowerShell Commands - PowerShell | Microsoft Learn

- https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7.5

Do not use a synonym of an approved verb. For example, always use Remove, never use Delete or Eliminate.

Do not use the following reserved verbs or aliases. The PowerShell language and a rare few cmdlets use these verbs under exceptional circumstances.
- ForEach (foreach)
- Ping (pi)
- Sort (sr)
- Tee (te)
- Where (wh)

- Invoke vs. Start: Use the Invoke verb to perform synchronous operations, such as running a command and waiting for it to end. Use the Start verb to begin asynchronous operations, such as starting an autonomous process.
- Ping vs. Test: Use the Test verb.

`System.Management.Automation.VerbsCommon` C# enum

Common verbs list:

```
Add, Clear, Copy, Enter, Exit, Find, Fomat, Get, Hide, Join, Lock, Move, New, Open, Optimize, Pop, Push, Redo, Remove, Rename, Reset, Resize, Search, Select, Set, Show, Skip, Split, Step, Switch, Undo, Unlock, Watch
```

Communucation verbs list:

```
Connect, Disconnect, Read, Receive, Send, Write
```

Data verbs:

```
Backup, Checkpoint, Compare, Compress, Convert, Dismount, Edit, Expand, Export, Group, Import, Initialize, Limit, Merge, Mount, Out, Publish, Restore, Save, Sync, Unpublish, Update
```

Diagnostic Verbs:

```
Debug, Measure, Ping, Repair, Resolve, Test, Trace
```

Lifecycle Verbs:

```
Approve, Assert, Build, Complete, Confirm, Deny, Deploy, Disable, Enable, Install, Invoke, Register, Request, Restart, Resume, Start, Stop, Submit, Suspend, Uninstall, Unregister, Wait
```

Security Verbs:

```
Block, Grant, Protect, Revoke, Unblock, Unprotect
```