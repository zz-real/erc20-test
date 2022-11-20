允许您在运行测试时查看发出的事件。

## [#]安装

**第 1 步：**安装软件包

```
npm i hardhat-tracer
```

**第 2 步：**添加到您的`hardhat.config.js`文件

```
require("hardhat-tracer");
```

## [#]用法

只需`--logs`在测试命令之后添加即可。

```
npx hardhat test --logs
```