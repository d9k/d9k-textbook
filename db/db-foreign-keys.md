# DataBase: Foreign Keys

## [Good explanation of cascade (ON DELETE/UPDATE) behavior](https://dba.stackexchange.com/questions/44956/good-explanation-of-cascade-on-delete-update-behavior)

> If you like the **`Parent`** and **`Child`** terms and you feel they are easy to be remembered, you may like the translation of `ON DELETE CASCADE` to **`Leave No Orphans!`**
>
> Which means that when a `Parent` row is deleted (killed), no orphan row should stay alive in the `Child` table. All children of the parent row are killed (deleted), too. If any of these children has grandchildren (in another table through another foreign key) and there is `ON DELETE CASCADE` defined, these should be killed, too (and all descendants, as long as there is a cascade effect defined.)
>
> The `FOREIGN KEY` constraint itself could also be described as **`Allow No Orphans!`** (in the first place). No `Child` should ever be allowed (written) in the child table if it hasn't a `Parent` (a row in the parent table).
>
> For consistency, the `ON DELETE RESTRICT` can be translated to the (less aggresive) **`You Can't Kill Parents!`** Only childless rows can be killed (deleted.)

/ [ypercube](https://dba.stackexchange.com/users/993/ypercube%e1%b5%80%e1%b4%b9)

- :beginner: [5.4.5. Foreign Keys |  5.4. Constraints | PostgreSQL: Documentation](https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-FK)