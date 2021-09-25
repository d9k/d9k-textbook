# Рецепты Webpack

## Действия по окончанию билда

```
const EventHooksPlugin = require('event-hooks-webpack-plugin');

new EventHooksPlugin({
    done: () => {
        console.log('__TEST__ done');
    },
}),
```

## Static files

```
const path = require('path');
const express = require('express');

module.exports = {
  devServer: {
    before: (app) => {
      app.use('/assets/', express.static(path.resolve(__dirname, 'src/assets')));
    }
  }
}
```
