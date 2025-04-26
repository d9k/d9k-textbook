# ORM: Sequelize

## Join query

- :beginner: [Eager Loading | Sequelize](https://sequelize.org/docs/v6/advanced-association-concepts/eager-loading/)

```js
Project.findAll({
  include: {
    model: Task,
    where: {
      state: Sequelize.col('project.state'),
    },
  },
});
```