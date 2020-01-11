# 魔兽世界经典旧世 - 米豪的全自动公益脚本

## 功能概述

本脚本通过魔兽世界插件、自动控制脚本【AppleScript(Macos)或按键精灵(Windows)】的方式，实现了如下公益功能：

1. 根据背包里水和面包的比例，自动选择搓水或者搓面包，以保证背包内水和面包的比例相对平衡。
2. 玩家交易时，根据对方职业，自动填充交易栏物品。例如战士会自动填充6面包，法师将自动填充2水等。
3. 玩家可以通过密语的方式定制需求，例如玩家可以M【1组水，5组面包】、【水三组，面包两组】、【法爷，多来点面包少来点水】等等。
4. 通过一系列交互操作完成自动开门操作。详见gate.lua的say_gate_help函数。
5. 通过一系列交互可以为小号烹饪小号食物。详见low_level_food.lua中say_low_level_help函数。
6. 通过交互，可以接受其他玩家的货源补充。详见refill.lua中refill_help函数。
7. 在繁忙时期，自动进入高峰期模式，增加额外的交易限制。详见busy_check.lua中say_busy函数。
8. 通过M语自动向玩家发起组队邀请，协助跨位面。


## 使用方法

1. 将AutoTradeFood拷贝到```WOW/_classic_/Interface/Addons```文件夹下。
2. 自行制作一个按键精灵或AppleScript脚本，每隔1.5秒按一次CTRL+Y，每隔3.0秒按一次CTRL+I。
3. 如需广播库存和广告语，每隔1分钟按一次CTRL+ALT+Y。
4. 如果需要修改上述快捷键，请参看init.lua中L.hotkeys

注，本脚本仅限联盟方使用，未开发部落方的传送门。


## 使用限制

1. 因可能触碰暴雪红线，不提供任何交易金币的方式方法。
2. 因涉及使用脚本，存在封号风险，开发者对封号事件概不负责。
3. 如果您希望使用此脚本，希望您在修改代码的时候，注明出处。
