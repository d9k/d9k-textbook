# VSCode: config

## Move sidebar to right

- :speech_balloon: [How do I move the panel in Visual Studio Code to the right side? | SO](https://stackoverflow.com/questions/41874426/how-do-i-move-the-panel-in-visual-studio-code-to-the-right-side)
	- `"workbench.panel.defaultLocation": "right`
	- :zap: `Customize layout...`

## How to see a fully-expanded TypeScript type without "N more..."

- :jigsaw: [TypeScript Explorer - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=mxsdev.typescript-explorer&ssr=false#review-details)

![ts-type-expand-extension|120](https://user-images.githubusercontent.com/37296661/119652128-b18edd80-be60-11eb-87b7-aca155ac1210.gif)

/ [from](https://github.com/microsoft/TypeScript/issues/26238#issuecomment-1363344856)

OR

- :speech_balloon: [visual studio code - How to see a fully-expanded TypeScript type without "N more" and "..."? | SO](https://stackoverflow.com/questions/53113031/how-to-see-a-fully-expanded-typescript-type-without-n-more-and)

- :speech_balloon: [Setting noErrorTruncation to false truncates inferred type of variables/functions; which are not errors | issue #26238 | TypeScript](https://github.com/microsoft/TypeScript/issues/26238#issuecomment-672086446)

- find and replace number in `defaultMaximumTruncationLength = 160` to `800`
- :open_file_folder: `/usr/share/code/resources/app/extensions/node_modules/typescript/lib`
- _This could also be automated with `patch-package` according to this post_