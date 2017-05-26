# Shell Script


- `#!/usr/bin/env bash`，Sha-Bang
- `exit [n]`，立即退出正在运行的 Shell 脚本，并设有退出值，如果未给定 n 的值，则退出状态为最后一个命令的执行状态
- `expr`，输出表达式变量的值，用于整数及字符串，如：+、-、*、/ 和 % 运算，其中 * 需要转义，`expr 15 \* 15`，`expr index “sarasara” "as"`，抓取第一个字符数字串出现的位置 
- `$[2*3]`，执行基本的算数运算输出结果，可以用变量`$[a+b]`，`$(ls)`，执行 **()** 中命令并输出结果，等同于`` `ls` ``
- 在脚本中用`set`命令启用或禁用参数，`set -x`，启用调试，`set +x` ，关闭调试， sh/bash 命令有如下调试选项，`sh -x /script.sh `
```
-n    读一遍脚本的命令但不执行，用于检查脚本中的错误
-x    提供跟踪执行信息，将执行的每一条命令和结果打印出来
```

### 参数/变量

- `$0`代表脚本文件名，`$#`，传入脚本的参数的个数，`$$`，当前shell进程的pid
- `$-`，显示Shell使用的当前选项
- `$1` 代表第一个参数，`$2` 代表第二个，`$3` 代表第三个，以此类推。在 `$9` 之后的参数必须被包含在大括号中，如 `${10}, ${11}, ${12}`，最后一个参数 `${!#}`
- `$*`所有的参数(作为单个字符串)，"$1 $2 … $n"，`$@`，所有的参数数组(每个都作为独立的字符串)，"$1" "$2" … "$n"
- `shift`，参数整体向左移一位，即原来 $1 的值被移走了，新 $1 的值是原来 $2 的值，新 $2 的值是原来 $3 的值，依次类推，`shift 3`，左移三位
- `$?`，读取最后执行命令的退出状态，一般情况下，0为成功，1-255之间的整数为失败
- 特殊字符包括：`space`, `tab`, `newline`，`|`, `&`, `;`, `(`, `)`, `<`, or `>`，`!`
- `"`包裹字符，除 **$**，**`**(反引号)和 **\\**(转义符)之外的其他字符将被作为普通字符对待，可以防止空格被解释为分隔符，含有空格的字符串被包在双引号中依旧是算作单一字符
- `'`包裹字符，除了'之外的所有特殊字符都将会被直接按照字面意思进行解析，不允许出现 ' 
- `readonly val`，将变量定义为只读变量，改变只读变量的值会报错
- 字符串处理
  - `${变量:位置起点:要截取的长度}`，字符串截取，位置从0开始，`${变量名:位置起点}`，从起点开始取到末尾，起点可以从右边算起，`0-n`表示从右起第n位
  - `${#变量名称}`计算变量值字符串的长度
  - `${var/1234/1111}`， 如果变量中有符合样式的字符串，则使用替换字符串替代，只替换第一个符合样式的字符串
  - `${变量//Pattern/替换字符串}`，如果变量中有符合样式的字符串，则使用替换字符串替代，替换全部符合样式的字符串
  - `${变量#Pattern}`，表示由变量值的最左边开始与样式进行对比，删除”最短相符合的字符串” ，`${变量##Pattern}`，表示由变量值的最左边开始与样式进行对比，删除”最长相符合的字符串” ，`${变量%Pattern} `，表示由变量值的最右边或最后边开始与样式进行对比，删除”最短相符的字符串” ，`${变量%%Pattern}`， 表示由变量值的最右边或最后边开始与样式进行对比，删除”最长相符的字符串” 
  ```
  var="12345678"
  echo ${var:0-2:2} #输出:67
  echo ${var#*3} #输出:45678
  echo ${var##*3}  # 输出：4
  echo ${var%3*}  # 输出：123412
  echo ${var%%3*}  # 输出：12
  ```
- 数组
  - `array_name=(value0 value1 value2 … valuen)`，用括号来表示数组，数组元素用“空格”符号分割开，也可以单独定义数组的各个分量 `array_name[0]=value0`，也可以
  ```
  array_name=(
  value0
  value1
  value2
  value3
  )
  ```
  - `${array_name[index]}`，读取数组元素的值，`${array_name[*]}`或`${array_name[@]}`，获取数组所有元素
  - `length=${#array_name[@]}`或`length=${#array_name[*]}`获取数组长度  
  
### 流程控制

- `[ expression ] `或`test expression `，测试语句，与 if、case、while 搭配，返回“真(0)”或“假(非0)”，在任何一个运算符、圆括号或者方括号等操作符额前后 至少需要留有一个空格，否则可能会出错
  - 文件测试，`test -f "$1"`或`[ -f "$1" ]`，测试位置参数携带的文件名是否在当前目录下已存在并且为普通文件，引用变量时，最好用 **""** 包裹，避免歧义
  ```
  -e pathname : 当由pathname 指定的文件或目录存在时返回真
  -f filename : 当filename 存在并且是普通文件时返回真
  -d pathname : 当pathname 存在并且是一个目录时返回真
  -h filename : 当filename 存在并且是符号链接文件时返回真 (或 -L filename)
  -s filename : 当filename 存在并且文件大小大于0 时返回真
  -S filename : 当filename 存在并且是socket 时返回真
  -b filename : 当filename 存在并且是块文件时返回真
  -c filename : 当filename 存在并且是字符文件时返回真
  -p filename : 当filename 存在并且是命名管道时返回真 
  -t fd : 当fd 是与终端设备相关联的文件描述符时返回真
  -u pathname : 当由pathname 指定的文件或目录存在并且设置了SUID 位时返回真
  -g pathname : 当由pathname 指定的文件或目录存在并且设置了SGID 位时返回真
  -k pathname : 当由pathname 指定的文件或目录存在并且设置了”粘滞”位(Sticky Bit)时返回真 
  -r pathname : 当由pathname 指定的文件或目录存在并且可读时返回真
  -w pathname : 当由pathname 指定的文件或目录存在并且可写时返回真
  -x pathname : 当由pathname 指定的文件或目录存在并且可执行时返回真
  -O pathname : 当由pathname 存在并且被当前进程的有效用户id 的用户拥有时返回真(字母O 大写)
  -G pathname : 当由pathname 存在并且属于当前进程的有效用户id 的用户的用户组时返回真
  file1 -nt file2 : file1 比file2 新时返回真
  file1 -ot file2 : file1 比file2 旧时返回真 
  ```
  - 字符串测试，`[ "$s1" = "$s2" ]` 或 `test "$s1" = "$s2"`，判断两个变量 是 s1 和 s2 所代表的字符串是否相等
  ```
  -z string : 字符串 string 为空串(长度为0)时返回真
  -n string : 字符串 string 为非空串时返回真
  str1 = str2 : 字符串 str1 和字符串str2 相等时返回真
  str1 != str2 : 字符串 str1 和字符串str2 不相等时返回真 
  [ $string ] : 字符串 string 不为空返回真
  ```
  - 关系运算符，`-eq`，`-ne`，`-gt`，`-lt`，`-ge`，`-le`
  - 布尔运算符，`-a` 逻辑与，`-o` 逻辑或，`!` 逻辑否，其优先级为 **!** 最高，**-a** 次之，**-o** 最低，用`&&`表示逻辑与`||`表示逻辑或时，需用 **[[]]** 包裹
  - `()`改变执行顺序，括号前后应该有空格并用转义符转义
  ```
  [[ $a -lt 100 || $b -ge 100 ]]，a < 100 且 b >= 100
  [ ! "$s1" -le 0 ]，s1大于0
  [ \( "$a" -gt 0 -a "$a" -lt 10 \) -a "$a" -ne 5 ]，0 < a < 10 且 a 不等于 5  
  ```
- `if`，如果命令返回值 0，判断条件为真；如果命令返回值不等于 0，判断条件为假
```
#!/bin/bash
#查找给定用户是否在系统中工作，如果在系统中就发一个问候给他
echo "Type in the user name"
read user
if who | grep $user
then echo "Hello $user" | write $user
else echo "$user has not logged in the system"
fi
#写成一行（适用于终端命令提示符）
if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi
```
&emsp;多路条件分支
```
num1=$[2*3]
num2=$[1+5]
if test "$num1" -gt "$num2"
then
    echo 'num1大于num2!'
elif [ "$num1" -le "$num2" ]
then
    echo 'num1小等于num2!'
else
    echo '没有符合的条件!'
fi
```
- `case`语句，可以用变量值对多个Pattern进行匹配，Pattern中可以使用通配符，任何一个相符，则执行其后的命令一直到分号（;;）结束
```
case $1 in
    file) 
        echo "it is a file";;
    dir|path)
        echo "current directory is `pwd`";;
    [Dd]ate)
        echo "the date is `date`";;
    *)
        echo "it is not a filename";;
esac
```
- `for`循环
```
dir=$1; shift
if [ -d $dir ]
then cd $dir
     for name # or for name in "$@"
     do
         if [ -f $name ]
         then cat $name
              echo "End of ${dir}/$name"
         else echo "Invalid file name: ${dir}/$name"
         fi
     done
else echo "Bad directory name:$dir"
fi
写成一行
for var in item1 item2 ... itemN; do command1; command2… done;
```
- `while`，只要 expression 的值为真，则进入循环体，执行 command-list 中的命令，然后再做条件测试，直到测试条件为假时才终止，`until`，只在表达式为假时才执行循环体
```
while/until expression
do
    command-list
done
```
- `break [n] `，n 表示跳出几层循环。默认值是 1，表示只跳出一层循环。如果 n 为 3，则表示一次跳出 3 层循环。执行 break 时，是从包含它的那个循环体中向外跳出
- `continue [n]`，从 continue 语句的最内层循环向外跳出第 n 层循环，默认值为 1

### 函数

```
[ function ] funname[()]
{
    command-list
    [return int;]
}
```
- `return`，参数返回，如果不加，将以最后一条命令运行结果，作为返回值，return后跟数值n(0-255)，函数返回值在调用该函数后通过`$?`来获得
- 所有函数在使用前必须定义，调用函数仅使用其函数名即可，调用函数时可以向其传递参数，在函数体内部，通过`$n`的形式来获取参数的值

### 进程

- `./script-name`，`(cd ..; ls -l)`，如果默认方式执行脚本，或将命令行下输入的命令用括号括起来，那么会 fork 出一个子 shell 执行小括号中的命令，一行中可以输入由分号隔开的多个命令，执行命令后，虽然执行了 cd .. 命令，但是 shell 当前的路径并没改变
- `source ./script-name`，`. ./script-name `，如果用 source 命令或者 . 来执行脚本时，则不会创建子进程，而是直接在交互式 shell 中执行脚本中的命令，这种形式还可以用来在一个脚本中包含另一个脚本，执行后可以获取另一个脚本中的变量
- `firefox &`，最后后面的 & 符号，表示使用后台方式打开 Firefox，然后显示该进程的 PID 值
- `Ctrl + Z`，可以暂时把当前程序挂起到后台，挂起后的进程将不再进行任何操作
- `fg job_spec`，将后台挂起的进程恢复到前台来运行
- `jobs`，查看挂起在后台的进程
- 输入输出重定向
  - `command < input-file`，命令 “command” 读取的输入 stdin(0) 来自文件 “input-file”, 而不是与命令运行终端相连接的键盘
  - `command > output-file`，命令 “command” 的输出 stdout(1) 重定向到文件 “output-file” 上以取代显示屏
  - `command >> output-file `，把命令（或执行程序）的输出附加到指定文件的后面，文件原有内容不被破坏
  - `command 2> error-file `，对命令的错误 stderr(2) 重定向，将产生的错误消息发送到文件中，`2>&1`，把 stderr 重定向到 stdout
  - `command > /dev/null 2>&1`，标准输出和错误输出丢弃
- `|`，`|&`，管道命令，| 只把标准输出传给下一个命令的标准输入，|& 同时把 stdin 和 stderr 传给下一个命令的标准输入
