# Bash 常用命令


## 基础常用命令

- `某个命令 --help`，对这个命令进行解释
- `man某个命令`，文档式解释这个命令(更详细)(执行该命令后,还可以按/+关键字进行查询结果的搜索)
- `Ctrl + c`，结束命令
- `TAB键`，自动补全命令(按一次自动补全，连续按两次，提示所有以输入开头字母的所有命令)
- `键盘上下键`，输入临近的历史命令
- `history`，查看所有的历史命令
- `Ctrl + r`，进入历史命令的搜索功能模式
- `clear`，清除屏幕里面的所有命令
- `pwd`，显示当前目录路径
- `locate 搜索关键字`，快速搜索文件(类似 Windows 上的 everything 索引式搜索)
	- `updatedb`，配合上面的 locate，给 locate 的索引更新(locate 默认是一天更新一次索引)
- `date`，查看系统时间
	- `date -s20080103`，设置日期
	- `date -s18:24`，设置时间，如果要同时更改 BIOS 时间，再执行 `hwclock --systohc`
- `cal`，在终端中查看日历，肯定没有农历显示的
- `which git`，返回文件的路径，从环境变量 **PATH** 搜索
- `echo "字符串内容"`，双引号可省略，输出 "字符串内容"， **\\** 转义特殊字符，**${}** 输出变量，**``** 执行命令，输出结果
	- `echo '$name\"'`，原样输出字符串，不进行转义或取变量
	- `echo 字符串...`， 对各种特殊符号转义，空格会被转义为参数分隔符(可以用 **\\** 转义空格)，`` echo `date` ``，显示命令执行结果
- `cat 文件路劲名...`，显示文件内容(属于打印语句)
	- `cat -n 文件名`，打印文件至标准输出，并显示每行行号，等价于`nl -ba 文件名`
	- `cat -b 文件名`，打印文件至标准输出，只对非空行编号，等价于`nl 文件名`
- `more 文件名`，用分页的方式查看文件内容(按 *space* 翻下一页，按 *Ctrl + B* 返回上页)
- `less`文件名，用分页的方式查看文件内容(带上下翻页)
	- 按 `j` 向下移动，按 `k` 向上移动，`u` 向上半页，`d` 向下半页
	- `G`，移动到最后一行，`g` 移动到第一行
	- 按 `/` 后，输入要查找的字符串内容，可以对文件进行向下查询，如果存在多个结果可以按  `n` 下一个结果，`N` 上一个
	- 按 `?` 后，输入要查找的字符串内容，可以对文件进行向上查询，如果存在多个结果可以按   `n` 下一个结果，`N` 上一个
	- `&pattern`，仅显示匹配模式的行，而不是整个文件
- `tail -200f 文件名`，查看文件被更新的新内容尾 200 行，如果文件还有在新增可以动态查看到(一般用于查看日记文件)
- `ls`，列出当前目录下的所有没有隐藏的文件 / 文件夹。
	- `ls -a`，列出包括以．号开头的隐藏文件 / 文件夹(也就是所有文件)
	- `ls -R`，显示出目录下以及其所有子目录的文件 / 文件夹(递归地方式，不显示隐藏的文件)
	- `ls -a -R`，显示出目录下以及其所有子目录的文件 / 文件夹(递归地方式，显示隐藏的文件)
	- `ls -l`，等同于 `ll`，列出目录下所有文件的权限、所有者、文件大小、修改时间及名称(也就是显示详细信息，不显示隐藏文件)。效果如下：
	```
	-rwxr-xr-x. 1 root root 4096 3月 26 10:57，其中最前面的 - 表示这是一个普通文件
	lrwxrwxrwx. 1 root root 4096 3月 26 10:57，其中最前面的 l 表示这是一个链接文件
	drwxr-xr-x. 5 root root 4096 3月 26 10:57，其中最前面的 d 表示这是一个目录
	```		
	- `ls -ld 目录名`，显示该目录的基本信息
	- `ls -t`，依照文件最后修改时间的顺序列出文件名，新的在前，`-S`，以文件大小排序，大的在前，`-r`，逆序排列
	- `ls -F`，列出当前目录下的文件名及其类型。以 **/** 结尾表示为目录名，以 **\**** 结尾表示为可执行文件，以 **@** 结尾表示为符号连接
	- `ls -lh`，查看文件夹类文件详细信息，文件大小，文件修改时间
	- `ls /opt | head -5`，显示 opt 目录下前 5 条记录
	- `ls -lR /opt |grep "^-"|wc -l`，统计 opt 目录下文件的个数，会递归统计
	- `ls -l /opt |grep "^d"|wc -l`，统计 opt 目录下目录的个数，不会递归统计
	- `ls -lR /opt |grep "js"|wc -l`，统计 opt 目录下 js 文件的个数，会递归统计
- `cd`，目录切换
	- `cd ..`，改变目录位置至当前目录的父目录(上级目录)。
	- `cd ~`，改变目录位置至用户登录时的工作目录。
	- `cd 回车`，回到家目录
	- `cd -`，上一个工作目录
	- `cd dir1/`，改变目录位置至 dir1 目录下。
	- `cd ~user`，改变目录位置至用户的工作目录。
	- `cd ../user`，改变目录位置至上级路径user的目录下。
	- `cd /../..`，改变目录位置至绝对路径的目录位置下。
- `cp 源文件 目标文件`，复制文件
	- `cp -r 源文件夹 目标文件夹`，复制文件夹
	- `cp -r -v 源文件夹 目标文件夹`，复制文件夹(显示详细信息，一般用于文件夹很大，需要查看复制进度的时候)
	- `cp -s` 复制成为符号连结档(symbolic link)而非复制文件，**-h** 复制为硬链接(hard link)而非复制文件
	- `cp -a`，相当于 **-dpr** 连同文件的属性(mode,ownership,timestamps)一起复制过去，若来源档为连结档的属性(link file)，则复制连结档属性而非文件本身，递归复制
	- `cp /usr/share/easy-rsa/2.0/keys/{ca.crt,server.{crt,key},dh2048.pem,ta.key} /etc/openvpn/keys/`，复制同目录下花括号中的文件
- `mv 文件 目标文件夹`，移动文件到目标文件夹
	- `mv 文件`，不指定目录重命名后的名字，用来重命名文件
- `tar -cpf - . | tar -xpf - -C /opt`，复制当前所有文件到 /opt 目录下，一般如果文件夹文件多的情况下用这个更好，用 cp 比较容易出问题
- `tar -cvf mytest.tar mytest/`，对 mytest/ 目录进行归档处理(归档和压缩不一样)
- `tar -xvf mytest.tar`，释放 mytest.tar 这个归档文件，释放到当前目录
	- `tar -xvf mytest.tar -C /opt/setups/`，释放 mytest.tar 这个归档文件，释放到 /opt/setups/ 目录下	
- `zip mytest.zip /opt/test/`，把 /opt 目录下的 test/ 目录进行压缩，压缩成一个名叫 mytest 的 zip 文件
	- `unzip mytest.zip`，对 mytest.zip 这个文件进行解压，解压到当前所在目录
	- `unzip mytest.zip -d /opt/setups/`，对 mytest.zip 这个文件进行解压，解压到 /opt/setups/ 目录下
- `touch 文件名`，创建一个空白文件/更新已有文件的时间(后者少用)
- `mkdir 文件夹名`，创建文件夹
	- `mkdir -p /opt/setups/nginx/conf/`，创建一个名为 conf 文件夹，如果它的上级目录没有也会跟着一起生成，如果有则跳过
	- `mkdir -m 711 /opt/setups/bin`，创建 bin 文件夹，给予 rwx--x--x 的权限。
- `rmdir 文件夹名`，删除文件夹(只能删除文件夹里面是没有东西的文件夹)
- `rm 文件`，删除文件
	- `rm -r 文件夹`，删除文件夹
	- `rm -r -i 文件夹`，在删除文件夹里的文件会提示(要的话,在提示后面输入yes)
	- `rm -r -f 文件夹`，强制删除
	- `rm -r -f 文件夹1/ 文件夹2/ 文件夹3/`删除多个
- `grep`，正则选取
	- 查看某个配置文件，排除掉里面以 # 开头的注释内容：
		- `grep '^[^#]' /etc/openvpn/server.conf`
	- 查看某个配置文件，排除掉里面以 # 开头和 ; 开头的注释内容：
		- `grep '^[^#;]' /etc/openvpn/server.conf`
- `find`，高级查找
	- `find . -name *lin*`，其中 . 代表在当前目录找，-name 表示匹配文件名 / 文件夹名，\*lin\* 用通配符搜索含有lin的文件或是文件夹
	- `find . -iname *lin*`，其中 . 代表在当前目录找，-iname 表示匹配文件名 / 文件夹名(忽略大小写差异)，\*lin\* 用通配符搜索含有lin的文件或是文件夹
	- `find / -name *.conf`，其中 / 代表根目录查找，*.conf代表搜索后缀会.conf的文件
	- `find /opt -name .oh-my-zsh`，其中 /opt 代表目录名，.oh-my-zsh 代表搜索的是隐藏文件 / 文件夹名字为 oh-my-zsh 的
	- `find /opt -type f -iname .oh-my-zsh`，其中 /opt 代表目录名，-type f 代表只找文件，.oh-my-zsh 代表搜索的是隐藏文件名字为 oh-my-zsh 的
	- `find /opt -type d -iname .oh-my-zsh`，其中 /opt 代表目录名，-type d 代表只找目录，.oh-my-zsh 代表搜索的是隐藏文件夹名字为 oh-my-zsh 的
	- `find . -name "lin*" -exec ls -l{}\;`，当前目录搜索 lin 开头的文件，然后用其搜索后的结果集，再执行 ls -l 的命令(这个命令可变，其他命令也可以)，其中 -exec 和 {}\; 都是固定格式
	- `find /opt -type f -size +800M  -print0 | xargs -0 du -h | sort -nr`，找出  /opt 目录下大于 800 M 的文件
	- `find / -name "*tower*" -exec rm {} \;`，找到文件并删除
	- `find /usr/local/backups -name "*.html" -mtime +10 -print0 |xargs -0 rm -rfv`,删除以html结尾的10天前的文件，包括带空格的文件
	- `find /usr/local/backups -mtime +10 -name "*.html" -exec rm -rf {} \;`,删除以html结尾的10天前的文件，包括带空格的文件

## vi/vim

- `:help <command>`，显示相关命令的帮助。你也可以就输入 :help 而不跟命令
- `:! <command>`，暂时离开 vi 到指令行模式下执行 command 的显示结果！例如 `:! ls /home` 即可在 vi 当中察看 /home 底下以 ls 输出的档案信息
- `:set nu`，显示行号，设定之后，会在每一行的前缀显示该行的行号
- `:set nonu`，取消显示行号
- `:r! <command>`，将命令 command 的输出结果放到当前行
- `:w [filename]`，将编辑的数据储存成另一个档案(另存为)
- `:r [filename]`，在编辑的数据中，读入另一个档案的数据，即将filename的内容加到游标所在行后面
- `:n1,n2 w [filename]`，将 n1 到 n2 的内容储另存为filename
- `q!`，不保存强制退出，`wq`，保存并退出
- 移动
	- `n方向键`，n 表示数字，按下数字后再按方向键或hjkl，光标移动 n 个单位相应方向
	- `gg`，跳到文档第 1 行
	- `G`，跳到文档最后行
	- `16G` 或 `:16`，跳到第 16 行
	- `w`，到下一个单词的开头
	- `^`，到本行第一个单词头
	- `0` 或 `Home`，到本行行头
	- `$` 或 `End`，到本行行尾
	- `fa`，行内搜素，到下一个为 a 的字符处，也可以 fs 到下一个为 s 的字符，`F`方向相反
	- `t"`, 行内搜素，到 " 前的第一个字符，" 可以变成其它字符,`T`方向相反	
	- `(`，光标移至当前句句首，`)`，光标移至下一句句首
	- `{`，光标移至当前段开头，`}`, 光标移至下一段开头
	- `%`，匹配括号移动，包括 **(、{、[**
	- `Ctrl + u`，向文件首翻半屏
	- `Ctrl + d`，向文件尾翻半屏
	- `Ctrl + b`，向文件首翻一屏，同`PageUp`
	- `Ctrl + f`，向文件尾翻一屏，同`PageDown`
	- `H`，光标移动到这个屏幕的最上方那一行的第一个字符
	- `M`，光标移动到这个屏幕的中央那一行的第一个字符
	- `L`，光标移动到这个屏幕的最下方那一行的第一个字符
	- `*`，匹配光标当前所在的单词，移动光标到下一个匹配单词
	- `#`，匹配光标当前所在的单词，移动光标到上一个匹配单词
- 搜索/替换
	- `/YouMeek`，从光标开始处向文件尾搜索 YouMeek 字符，支持正则，按 `n` 继续向下找，按 `N` 继续向上找
	- `?YouMeek`，从光标开始处向文件首搜索 YouMeek 字符，支持正则，按 `n` 继续向上找，按 `N` 继续向上找
	- `:%s/YouMeek/Judasn/g`，把文件中所有 YouMeek 替换为：Judasn
	- `:%s/YouMeek/Judasn/`，把文件中所有行中第一个 YouMeek 替换为：Judasn
	- `:s/YouMeek/Judasn/g`，把光标当前行所有 YouMeek 替换为 Judasn
	- `:s#YouMeek/#Judasn/#`，除了使用斜杠作为分隔符之外，还可以使用 # 作为分隔符，此时中间出现的 / 不会作为分隔符，该命令表示：把光标当前行第一个 YouMeek/ 替换为 Judasn/
	- `:10,$s/YouMeek/Judasng/gc`，把第 10 行到尾行之间所有 YouMeek 替换为 Judasn，且在取代前显示提示字符给用户确认 (confirm) 是否需要取代
	- `:1,10s/^/#/g`， 在1~10 行首添加 **#** 号注释
- 选取
	- `v`，按 v 之后，进入可视(Visual)模式，可以通过移动命令选取文字，例如可以：
		- 按方向键可以选中你要选中的文字，支持 `n方向键`
		- `G`/`gg`/`nG`,从当前光标选取到指定行末尾
		- 按 `0` 或 `Home` 选取到行首，`^` 选取到本行第一个单词首，`$` 或 `End` 选取到行尾
		- 连续按 `w` ,持续向后选取单词(包括空格)，`t`/`f`/`T`/`F`选取到行内某字符为止
	- `V`，上下整行选择		
	- `Ctrl + v`，进入列编辑，块选取
	- 任意一种选取后，`<` 或 `>`，选取行左右缩进，`=`选取行自动缩进
	- 块选取后，`A`, 输入字符串，按`ESC`，可以在选取的块的每一行末尾插入所输入的字符，`I`后输入字符串再`ESC`，每一行开头插入
- 删除
	- `x`，删除光标后的 1 个字符
	- `nx`，删除光标后的 n 个字符
	- `X`，删除光标前的 1 个字符
	- `d`，Visual模式下，删除选取的内容，也可以用`x`
	- `dd`，删除当前行
	- `ndd`，n 为数字。删除光标所在的向下 n 行，例如 20dd 则是删除 20 行
	- `dw`，删除当前光标下的单词/空格
	- `d$`，删除光标至行尾所有字符，等同于`D`
	- `d0`，删除光标至行首所有字符
	- `dG`，删除光标至文件尾所有字符
	- `d1G`，删除光标至文件首 所有字符
	- `dt"`，删除所有的内容，直到遇到 "
- 复制
	- `y`，Visual模式下，复制选取的内容
	- `yw`，复制光标后单词
	- `yy`，复制当前行
	- `4yy`，复制当前行及下面 4 行
	- `y$`，复制光标位置至行尾的内容
	- `y^`，复制光标位置至行首的内容
- 粘贴
	- `p`，将粘贴板中内容复制到光标之后
	- `P`，将粘贴板中内容复制到光标之前，若复制的为行，p 为将已复制的数据在光标下一行贴上，P 则为贴在游标上一行！ 举例来说，我目前光标在第 20 行，且已经复制了 10 行数据。则按下 p 后， 那 10 行数据会贴在原本的 20 行之后，亦即由 21 行开始贴。但如果是按下 P 呢？ 那么原本的第 20 行会被推到变成 30 行。
- 寄存器
	- `:reg`，查看所有寄存器内容
	- 寄存器分类
		- 无名(unnamed)寄存器：""，缓存最后一次操作内容
		- 数字(numbered)寄存器："0 ~ "9，缓存最近操作内容，复制与删除有别, "0寄存器缓存最近一次复制的内容，"1-"9缓存最近9次删除内容，如果继续删除，那么原来 1 的内容就转到 2，类推，当删除超过9的时候， 原先的 8号数字寄存器就转到9， 原先9的数字寄存器内容就会丢失
		- 短(small delete)寄存器："-，刚删除的文本并不一定被送到数字寄存器，如果删除的文本不含换行符，则文本被送至这个寄存器
		- 具名(named)寄存器："a ~ "z或"A ~ "Z，指定时可用，注意 d，y，p 等有特殊含义，避免使用
		- 只读(read-only)寄存器：":, "., "%, "#，分别缓存最近命令、最近插入文本、当前文件名、当前交替文件名
		- 黑洞(black hole)寄存器："_，不缓存操作内容(干净删除),包括""在内的任何寄存器都不受影响
	- `p`和`P`取出 "" 粘贴，如果要粘贴其它数字寄存器的内容，使用 "?p 来粘贴，比如要粘贴 "2 寄存器里面的，则在vim命令模式下 输入 "2p 就可以取出"2寄存器里面的内容了
	- `"ayy`，复制当前行到 "a 寄存器中，`"fdf.`，删除当前位置到句号，并且把内容存到寄存器 "f 中，存进具名寄存器的同时也会存进数字寄存器，不存入"-
- 其他
	- `Insert`，切换插入模式和取代模式
	- `ddp`，交换当前光标所在行和下一行的位置
	- `u`，撤销(Undo)
	- `Ctrl + r`，重做(Redo)
	- `.`，重复前一个动作，如要重复删除、重复贴上等动作，按下小数点
	- `u`，选取内容转化为小写，`guu`，把当前行的字母全部转换成小写
	- `U`，选取内容转化为大写，`gUU`，把当前行的字母全部转换成大写
	- `J`，当前行与下一行合并
	- `<<`,`>>`,`==`，左右/自动行缩进
- 命令模式切换到输入模式
    - `i`，在目前光标所在处插入
	- `I`，在目前所在行的第一个非空格符处开始插入
    - `a`，在目前光标所在的下一个字符处插入
    - `A`，在光标所在行的最后一个字符处开始插入
    - `o`，在目前光标所在的下一行处插入新的一行
    - `O`，在目前光标所在处的上一行插入新的一行


## 系统管理

- `uptime`，查看系统已经运行了多久，当前有几个用户，系统负载等信息
- `shutdown`
    - `shutdown -hnow`，立即关机
    - `shutdown -h+10`，10 分钟后关机
    - `shutdown -h23:30`，23:30 关机
- `poweroff`，立即关机
- `reboot`，立即重启
- `env`，查看所有系统变量
- `export PATH=$PATH:/opt/java/bin`，设置环境变量
- `echo $JAVA_HOME`，查看指定系统变量的值，这里查看的是自己配置的 JAVA_HOME
- `unset $JAVA_HOME`，删除指定的环境变量


## 用户/权限/安全

- `cat /etc/group`，查看所有组
- `cat /etc/passwd`，查看所有用户
- `useradd -s /bin/bash -g group –G adm,root gem`，新建一个用户gem，该用户的登录Shell是 /bin/bash，它属于group用户组，同时又属于adm和root用户组，其中group用户组是其主组
- `usermod -s /bin/ksh -d /home/z –g developer sam`，将用户sam的登录Shell修改为ksh，主目录改为/home/z，用户组改为developer
- `userdel -r youmeek`，删除名字为 youmeek 的用户，**-r**，表示删除用户的时候连同用户的家目录一起删除
- `groups sam`，查询sam所属的组，参数空则查询当前用户
- `newgrp root`，登陆后切换到其他用户组，参数为目的用户组，必须是该群组的用户
- 修改普通用户 youmeek 的权限跟 root 权限一样：
	- 常用方法(原理是把该用户加到可以直接使用 sudo 的一个权限状态而已)：
		- 编辑配置文件：`vim /etc/sudoers`
		- 找到 98 行(预估)，有一个：`root    ALL=(ALL)   ALL`，在这一行下面再增加一行，效果如下：
		```
		root    ALL=(ALL)   ALL
		youmeek    ALL=(ALL)   ALL
		```
	- 另一种方法：
		- 编辑系统用户的配置文件：`vim /etc/passwd`，找到 root 和 youmeek 各自开头的那一行，比如 root 是：`root:x:0:0:root:/root:/bin/zsh`，这个代表的含义为：*用户名:密码:UserId:GroupId:描述:家目录:登录使用的 shell*
		- 通过这两行对比，我们可以直接修改 youmeek 所在行的 UserId 值 和 GroupId 值，都改为 0。
- `groupadd judasn`，添加一个名为 judasn 的用户组
- `groupdel judasn`，删除一个名为 judasn 的用户组(前提：先删除组下面的所有用户)
- `passwd`，修改当前用户密码
	- `passwd youmeek`，修改 youmeek 用户的密码(前提：只有 root 用户才有修改其他用户的权限，其他用户只能修改自己的)
- `chmod 777 文件名/目录`，给指定文件增加最高权限，系统中的所有人都可以进行读写，等于`chmod +rwx 文件名/目录`
	- linux 的权限分为 rwx。r 代表：可读，w 代表：可写，x 代表：可执行
	- 这三个权限都可以转换成数值表示，r = 4，w = 2，x = 1，也就是最大权限，第一个 7 是所属主(user)的权限，第二个 7 是所属组(group)的权限，最后一位 7 是非本群组用户(others)的权限
	- `chmod ug+rx,o-x start.sh`，将文件 start.sh 设为该文件拥有者，与其所属同组者可写读取可执行，其他以人则不可执行
	- \+ 表示增加权限，- 表示取消权限，= 表示设定权限
	- `chmod -R a+r`，将目前目录下的所有文件与子目录皆设为任何人可读取，**-R** 对目前目录下的所有文件与子目录进行相同的权限变更，递归
- `sudo 某个命令`，使用管理员权限使用命令，使用 sudo 回车之后需要输入当前登录账号的密码。
- `su`：切换到 root 用户，non-login shell
	- `su -`：切换到 root 用户，**-** 或 **-l** 表示login shell
	- `su 用户名`，切换指定用户帐号登陆，non-login shell
	- `su - 用户名`，切换到指定用户帐号登陆，**-** 表示login shell
- `exit`，注销当前用户
- `last`，显示最近登录的帐户及时间
- `lastlog`，显示系统所有用户各自在最近登录的记录，如果没有登录过的用户会显示从未登陆过
	

## 网络/磁盘管理

- `ifconfig`，查看 IP 等信息
- `cat /etc/resolv.conf`，查看 DNS 设置
- `netstat -tlunp`，显示各种网络相关信息,程序
- `hostname`，查看hostname或DNS domain
- `dig www.baidu.com`，根据域名查出IP地址(DNS)
	- `dig -x 192.30.252.153`，从IP地址反查域名
- `host github.com` or `host 192.30.252.153`，根据域名查IP|从IP地址查域名
- 编辑 hosts 文件：`vim /etc/hosts`，添加内容格式：`127.0.0.1 www.youmeek.com`
- `df -h`，自动以合适的磁盘容量单位查看磁盘大小和使用空间
	- `df -k /etc`，以磁盘容量单位 K 为数值结果查看/etc目录磁盘使用情况
	- `df -mT`，以磁盘容量单位 M 为数值结果查看磁盘使用情况，并显示文件系统类型，如ext4
- `du -sh`，查看当前目录所占磁盘空间，h 的意思 human-readable 用人类可读性较好方式显示，系统会自动调节单位，显示合适大小的单位，s 表示 **-–summarize** 仅显示总计，即当前目录的大小
	- `du -sh /opt`，查看 opt 这个文件夹大小 
	- `du -h --max-depth=2 ./* | sort -hr | head -12`，找出当前目录下占用容量最大的前 12 个目录,最多两级
- `mount /dev/sdb5 /newDir/`，把分区 sdb5 挂载在根目录下的一个名为 newDir 的空目录下，需要注意的是：这个目录最好为空，不然已有的那些文件将看不到，除非卸载挂载。
	- 挂载好之后，通过：`df -h`，查看挂载情况。
- `umount /newDir/`，卸载挂载，用目录名，`umount /dev/sdb5`，卸载挂载，用分区名


## 其他常用命令

- `lsb_release -a`，查看发行代号
- `locale`，查看支持的语言
- `update-locale`，修改系统语言
- `sudo apt install ~/Downloads/google-chrome-stable_current_amd64.deb`，安装deb
- RPM 文件操作命令：
	- 安装
		- `rpm -i example.rpm`，安装 example.rpm 包
		- `rpm -ivh example.rpm`，安装 example.rpm 包并在安装过程中显示正在安装的文件信息及安装进度
	- 查询
		- `rpm -a | grep jdk`，查看 jdk 是否被安装
	- 卸载
		- `rpm -e jdk`，卸载 jdk(一般卸载的时候都要先用 rpm -qa 看下整个软件的全名)


## 常用压缩包**解压**命令整理

- Linux 后缀为 `.war` 格式的文件(一般用在部署 Tomcat 项目的时候)
- 命令：`unzip -oq XXXXXX.war -d ROOT`
	- 如果没有 ROOT 目录会自动创建 ROOT 目录。

- Linux 后缀为 `.tar.gz` 格式的文件-解压
- 命令：`tar zxvf XXXXXX.tar.gz`

- Linux 后缀为 `.bz2` 格式的文件-解压
- 命令：`bzip2 -d XXXXXX.bz2`

- Linux 后缀为 `.tar.bz2` 格式的文件-解压
- 命令：`tar jxvf XXXXXX.tar.bz2`

- Linux 后缀为 `.tar` 格式的文件-解压
- 命令：`tar zxvf XXXXXX.tar`

- Linux 后缀为 `.gz` 格式的文件-解压
- 命令：`gunzip XXXXXX.gz`

- Linux 后缀为 `.zip` 格式的文件-解压
- 命令：`unzip XXXXXX.zip`
- 命令：`unzip XXXXXX.zip -d /opt/`，解压到指定目录

- Linux 后缀为 `.tar.xz` 格式的文件-解压，解压出来是tar，再对tar进行解压
- 命令：`tar xf XXXXXX.tar.xz`

- Linux 后缀为 `.7z` 格式的文件-解压
- 命令：`7za x XXXXXX.7z`


## 常用文件进行**压缩**命令整理

- Linux 压缩文件为后缀 `.tar` 格式的文件
- 命令：`tar -zcvf test11.tar test11`

- Linux 压缩文件为后缀 `.tar.gz` 格式的文件
- 命令：`tar -zcvf test11.tar.gz test11`

- Linux 压缩文件为后缀 `.bz2` 格式的文件
- 命令：`bzip2 -v test.txt`

- Linux 压缩文件为后缀 `.tar.bz2` 格式的文件
- 命令：`tar -jcvf test11.tar.gz test11`

- Linux 压缩文件为后缀 `.zip` 格式的文件
- 命令：`zip -r test1.zip /opt/test1/`

- Linux 压缩文件为后缀 `.7z` 格式的文件
- 命令：`7za a test1.7z /opt/test1/`

- 7z 的安装：
	- 访问官网下载解压包：<http://sourceforge.net/projects/p7zip/files/p7zip/>
	- 解压压缩包：`tar jxvf p7zip_15.14_src_all.tar.bz2`
	- 进入目录：`cd p7zip_15.14`
	- 执行安装：`sh install.sh`
