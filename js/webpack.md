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
