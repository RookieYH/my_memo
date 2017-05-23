# Shell Script


- `#!/usr/bin/env bash`，Sha-Bang


## 参数/变量

- `$0`代表脚本文件名，`$#`，传入脚本的参数的个数，`$$`，当前shell进程的pid
- `$1` 代表第一个参数，`$2` 代表第二个，`$3` 代表第三个，以此类推。在 `$9` 之后的参数必须被包含在大括号中，如 `${10}, ${11}, ${12}`，最后一个参数 `${!#}`
- `$*`所有的参数(作为单个字符串)，`$@`，所有的参数数组(每个都作为独立的字符串)
- `shift`，参数整体向左移一位，即原来 $1 的值被移走了，新 $1 的值是原来 $2 的值，新 $2 的值是原来 $3 的值，依次类推，`shift 3`，左移三位
- `$?`，读取最后执行命令的退出状态，一般情况下，0为成功，1-255之间的整数为失败
- `"`包裹字符，除 **$**，**`**(反引号)和 **\\**(转义符)之外的其他字符将被作为普通字符对待，可以防止空格被解释为分隔符，含有空格的字符串被包在双引号中依旧是算作单一字符
- `'`包裹字符，除了'之外的所有特殊字符都将会被直接按照字面意思进行解析

- 字符串处理
  - `${变量:位置:要截取的长度}`，字符串截取，位置从0开始，`${变量名:位置起点}`，从起点开始取到末尾，`${#变量名称}`计算变量值字符串的长度
  - `${var/1234/1111}`， 如果变量中有符合样式的字符串，则使用替换字符串替代，只替换第一个符合样式的字符串
  - `${变量//样式/替换字符串}`，如果变量中有符合样式的字符串，则使用替换字符串替代，替换全部符合样式的字符串
  - `${变量#样式}`，表示由变量值的最左边开始与样式进行对比，删除”最短相符合的字符串” ，`${变量##样式}`，表示由变量值的最左边开始与样式进行对比，删除”最长相符合的字符串” ，`${变量%样式} `，表示由变量值的最右边或最后边开始与样式进行对比，删除”最短相符的字符串” ，`${变量%%样式}`， 表示由变量值的最右边或最后边开始与样式进行对比，删除”最长相符的字符串” 
  ```
  var="12345678"
  echo ${var#*3} #输出:45678
  echo ${var##*3}  # 输出：4
  echo ${var%3*}  # 输出：123412
  echo ${var%%3*}  # 输出：12
  ```
- 数组
  - `array_name=(value0 value1 value2 … valuen)`，用括号来表示数组，数组元素用“空格”符号分割开，也可以单独定义数组的各个分量 `array_name[0]=value0`
  - `${array_name[index]}`，读取数组元素的值，`${array_name[*]}`或`${array_name[@]}`，获取数组所有元素
  - `length=${#array_name[@]}`或`length=${#array_name[*]}`获取数组长度
  
## 进程

- `./script-name`，`(cd ..; ls -l)`，如果默认方式执行脚本，或将命令行下输入的命令用括号括起来，那么会 fork 出一个子 shell 执行小括号中的命令，一行中可以输入由分号隔开的多个命令，执行命令后，虽然执行了 cd .. 命令，但是 shell 当前的路径并没改变
- `source ./script-name`，`. ./script-name `，如果用 source 命令或者 . 来执行脚本时，则不会创建子进程，而是直接在交互式 shell 中执行脚本中的命令
- `firefox&`，最后后面的 & 符号，表示使用后台方式打开 Firefox，然后显示该进程的 PID 值
- `Ctrl + Z`，可以暂时把当前程序挂起到后台，挂起后的进程将不再进行任何操作
- `fg job_spec`，将后台挂起的进程恢复到前台来运行
- `jobs`，查看挂起在后台的进程
- 输入输出重定向
  - `command < input-file`，命令 “command” 读取的输入 stdin(1) 来自文件 “input-file”, 而不是与命令运行终端相连接的键盘
  - `command > output-file`，命令 “command” 的输出 stdout 重定向到文件 “output-file” 上以取代显示屏
  - `command >> output-file `，把命令（或执行程序）的输出附加到指定文件的后面，文件原有内容不被破坏
  - `command 2> error-file `，对命令的错误 stderr(2) 重定向，将产生的错误消息发送到文件中，`2>&1`，把 stderr 重定向到 stdout
  - `command > /dev/null 2>&1`，标准输出和错误输出丢弃
  
## 流程控制

- `if`，如果命令成功执行并正常结束，则返回值 0，判断条件为真；如果命令执行不成功，其返回值不等于 0，判断条件为假
```
#!/bin/bash
echo "Type in the user name"
read user
if who | grep $user
then echo "Hello $user" | write $user
else echo "$user has not logged in the system"
fi
```
多路条件分支
```
if 判断条件1
then 命令1
elif 判断条件2
then 命令2
...
else 命令n
fi
```
- `[ expression ] `或`test expression `，测试语句，与 if、case、while 搭配，返回“真(0)”或“假(非0)”，在任何一个运算符、圆括号或者方括号等操作符额前后 至少需要留有一个空格，否则可能会出错
  - 文件测试
  ```
  -b filename : 当filename 存在并且是块文件时返回真
-c filename : 当filename 存在并且是字符文件时返回真
-d pathname : 当pathname 存在并且是一个目录时返回真
-e pathname : 当由pathname 指定的文件或目录存在时返回真
-f filename : 当filename 存在并且是普通文件时返回真
-g pathname : 当由pathname 指定的文件或目录存在并且设置了SGID 位时返回真
-h filename : 当filename 存在并且是符号链接文件时返回真 (或 -L filename)
-k pathname : 当由pathname 指定的文件或目录存在并且设置了”粘滞”位时返回真
-p filename : 当filename 存在并且是命名管道时返回真
-r pathname : 当由pathname 指定的文件或目录存在并且可读时返回真
-s filename : 当filename 存在并且文件大小大于0 时返回真
-S filename : 当filename 存在并且是socket 时返回真
-t fd : 当fd 是与终端设备相关联的文件描述符时返回真
-u pathname : 当由pathname 指定的文件或目录存在并且设置了SUID 位时返回真
-w pathname : 当由pathname 指定的文件或目录存在并且可写时返回真
-x pathname : 当由pathname 指定的文件或目录存在并且可执行时返回真
-O pathname : 当由pathname 存在并且被当前进程的有效用户id 的用户拥有时返回真(字母O 大写)
-G pathname : 当由pathname 存在并且属于当前进程的有效用户id 的用户的用户组时返回真
file1 -nt file2 : file1 比file2 新时返回真
file1 -ot file2 : file1 比file2 旧时返回真 
```
