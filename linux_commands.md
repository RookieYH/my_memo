# Linux 常用命令


## 基础常用命令

- `<command> --help`，对这个命令进行解释
- `man <command>`，文档式解释命令(浏览文档时，操作同`less`)
- `TAB`，自动补全命令(按一次自动补全，连续按两次，提示所有以输入开头字母的所有命令)
- `UpArrow & DownArrow`，输入临近的历史命令
- `history`，查看所有的历史命令
- `Ctrl-R`，进入历史命令的搜索功能模式
- `Ctrl-U`，清除当前正在输入的命令
- `clear`，清屏，等价于 `ctrl-L`
- `locate 搜索关键字`，快速搜索文件(类似 Windows 上的 everything 索引式搜索)
	- `updatedb`，配合上面的 locate，给 locate 的索引更新(locate 默认是一天更新一次索引)
- `which git`，返回可执行文件路径，从环境变量 **PATH** 搜索
- `echo "string"`，输出字符串"， **\\** 转义特殊字符，**${}** 输出变量，**``** 执行命令，输出结果
	- `echo '$name\"'`，原样输出字符串，不进行转义或变量替换
	- `echo string...`， 空格为参数分隔符(可以用 **\\** 转义空格)，`` echo `date` ``，显示命令执行结果
- `printf  format-string  [arguments...]`，类似C语言，不会像 echo 自动添加换行符，换行需添加 **\n**
	- `printf "%-10s %-8s %-3.2f\n" 郭靖 男 66.12`，%-10s 字符串，宽度为10个字符(-表示左对齐，没有则表示右对齐，超过10个也会显示)，%-3.2f 浮点数，其中.2指保留2位小数，%d 整数，%e 指数形式浮点数， %% 百分号
- `cat <filename>...`，显示文件内容(属于打印语句)
	- `cat -n <filename>`，打印文件至标准输出，并显示每行行号，等价于`nl -ba 文件名`
	- `cat -b <filename>`，打印文件至标准输出，只对非空行编号，等价于`nl 文件名`
- `more <filename>`，用分页的方式查看文件内容(按 *space* 翻下一页，按 *B* 返回上页，Q 退出)
- `less <filename>`，用分页的方式查看文件内容(带上下翻页)
	- 按 `j` 向下移动，按 `k` 向上移动，`u` 向上半页，`d` 向下半页
	- `G`，移动到最后一行，`g` 移动到第一行
	- 按 `/` 后，输入要查找的字符串内容，可以对文件进行向下查询，如果存在多个结果可以按  `n` 下一个结果，`N` 上一个
	- 按 `?` 后，输入要查找的字符串内容，可以对文件进行向上查询，如果存在多个结果可以按   `n` 下一个结果，`N` 上一个
	- `&string`，仅显示匹配的行，而不是整个文件
- `tail -200f <filename>`，查看文件被更新的新内容尾 200 行，如果文件还有在新增可以动态查看到(一般用于查看日记文件)
- `pwd`，显示当前目录路径
- `ls`，列出当前目录下的所有非隐藏的文件&文件夹
	- `ls -a`，列出所有文件文件&文件夹(包括 . 开头的隐藏文件)
	- `ls -R`，显示出目录下以及其所有子目录的文件&文件夹(递归地方式，不显示隐藏的文件)
	- `ls -A -R`，显示出目录下以及其所有子目录的文件&文件夹(递归地方式，显示隐藏的文件，但不包括 . 和 ..)
	- `ls -l`，等同于 `ll`，列出目录下所有文件的权限、所有者、文件大小、修改时间及名称(也就是显示详细信息)，效果如下：

		> -rwxr-xr-x. 1 root root 4096 3月 26 10:57  &emsp;#其中最前面的 - 表示这是一个普通文件<br/>
		> lrwxrwxrwx. 1 root root 4096 3月 26 10:57  &emsp;#其中最前面的 l 表示这是一个链接文件<br/>
		> drwxr-xr-x. 5 root root 4096 3月 26 10:57  &emsp;#其中最前面的 d 表示这是一个目录
		
	- `ls -ld 目录名`，显示该目录的基本信息，而非目录下内容信息
	- `ls -t`，依照文件最后修改时间的顺序列出文件名，新的在前，`-S`，以文件大小排序，大的在前，`-r`，逆序排列
	- `ls -F`，列出当前目录下的文件名及其类型。以 **/** 结尾表示为目录名，以 **\*** 结尾表示为可执行文件，以 **@** 结尾表示为符号连接
	- `ls -lh`，查看文件夹类文件详细信息，文件大小，文件修改时间
	- `ls /opt | head -5`，显示 opt 目录下前 5 条记录
	- `ls -lR /opt |grep "^-"|wc -l`，统计 opt 目录下文件的个数，会递归统计
	- `ls -l /opt |grep "^d"|wc -l`，统计 opt 目录下目录的个数，不会递归统计
	- `ls -lR /opt |grep "js"|wc -l`，统计 opt 目录下 js 文件的个数，会递归统计
- `cd`，目录切换
	- `cd ..`，改变目录位置至当前目录的父目录(上级目录)
	- `cd ~`，改变目录位置至用户登录时的工作目录。
	- `cd ~user`，改变当前路径至用户 user 的工作目录
	- `cd 回车`，回到家目录
	- `cd -`，上一个工作目录
	- `cd dir1`，改变当前路径至 dir1 目录下
	- `cd ../dir1`，改变当前路径至上级路径 dir1 目录下
	- `cd /dir1/dir2`，改变当前路径至绝对路径/dir1/dir2
- `cp 源文件 目标文件`，复制文件
	- `cp -r 源文件夹 目标文件夹`，复制文件夹
	- `cp -r -v 源文件夹 目标文件夹`，复制文件夹(显示详细信息，一般用于文件夹很大，需要查看复制进度的时候)
	- `cp -s` 复制成为符号连结档(symbolic link)而非复制文件，**-h** 复制为硬链接(hard link)而非复制文件
	- `cp -a`，相当于 **-dpr** 连同文件的属性(mode,ownership,timestamps)一起复制过去，若来源档为连结档的属性(link file)，则复制连结档属性而非文件本身，递归复制
	- `cp /usr/share/easy-rsa/2.0/keys/{ca.crt,server.{crt,key},dh2048.pem,ta.key} /etc/openvpn/keys/`，复制同目录下花括号中的文件
- `mv 文件 目标文件夹`，移动文件到目标文件夹
	- `mv 文件`，不指定目录重命名后的名字，用来重命名文件
- `touch <filename>`，创建一个空白文件/更新已有文件的时间
- `mkdir 文件夹名`，创建文件夹
	- `mkdir -p /opt/setups/nginx/conf/`，创建一个名为 conf 文件夹，如果它的上级目录没有也会跟着一起生成，如果有则跳过
	- `mkdir -m 711 /opt/setups/bin`，创建 bin 文件夹，给予 rwx--x--x 的权限。
- `rmdir 文件夹名`，删除文件夹(只能删除文件夹里面是没有东西的文件夹)
- `rm 文件`，删除文件
	- `rm -r 文件夹`，删除文件夹
	- `rm -r -i 文件夹`，在删除文件夹里的文件会提示(要的话,在提示后面输入yes)
	- `rm -r -f 文件夹`，强制删除
	- `rm -rfv 文件夹1/ 文件夹2/ 文件夹3/`删除多个，v 表示显示详情
- `ln -s /cfssl-bin/* /bin`，软链接
- `grep`，正则查找行
	- `grep '^[^#]' /etc/openvpn/server.conf`，查看某个配置文件，排除掉里面以 # 开头的注释内容
	- `grep '^[^#;]' /etc/openvpn/server.conf`，查看某个配置文件，排除掉里面以 # 开头和 ; 开头的注释内容
- `find`，高级查找
	- `find . -name '*lin*'`，其中 . 代表在当前目录找，-name 表示匹配文件名 / 文件夹名，\*lin\* 用通配符搜索含有lin的文件或是文件夹
	- `find / -name '*.conf'`，其中 / 代表根目录查找，*.conf代表搜索后缀为 .conf 的文件
	- `find /opt -type d -iname .oh-my-zsh`，在/opt下查找，-type d 代表只找目录，.oh-my-zsh 代表搜索的是隐藏文件夹名字为 oh-my-zsh 的，-iname 表示忽略大小写
	- `find . -name "lin*" -exec ls -l {} \;`，当前目录搜索 lin 开头的文件，然后用其搜索后的结果集，再执行 ls -l 的命令
	- `find /usr/local/backups -mtime +10 -name "*.html" -exec rm -rf {} \;`,找到并删除以html结尾的10天前的文件，包括带空格的文件
	- `find /opt -type f -size +800M  -print0 | xargs -0 du -h | sort -nr`，找出  /opt 目录下大于 800 M 的文件，-print0 指定输出的文件列表以null分隔，xargs 命令的 -0 参数表示 用 null 当作分隔符
	- `find /usr/local/backups -name "*.html" -mtime +10 -print0 |xargs -0 rm -rfv`,删除以html结尾的10天前的文件，包括带空格的文件
- `file <filename>`，显示文件类型，`file -i <filename>`，显示文件 MINE-type
- `wget -O wordpress.zip http://www.linuxde.net/download.aspx?id=1080`，下载并以 wordpress.zip 文件名保存
- `tr [OPTION]... SET1 [SET2]`，从标准输入替换,压缩,删除字符集并输出至标准输出
	- `echo "HELLO WORLD" | tr 'A-Z' 'a-z'`，大写转小写，'ABD-}'、'bB.,'、'a-de-h'、'a-c0-9' 等都可以做为字符参数
	- `echo "hello 123 world 456" | tr -d '0-9'`，删除数字
	- `echo aa.,a 1 b#$bb 2 c*/cc 3 ddd 4 | tr -d -c '0-9 \n'`，结果1  2  3  4，补集中包含了数字0~9、空格和换行符\n，其他字符被删除
	- `echo "thissss is      a text linnnnnnne." | tr -s ' sn'`，压缩重复字符，结果 this is a text line.


## vi/vim

- `:help <command>`，显示相关命令的帮助。你也可以就输入 :help 而不跟命令
- `:! <command>`，暂时离开 vi 回 shell 环境执行 command，`:! ls /home` 暂时跳出vim，列出 /home 目录下 文件/文件夹
- `:set nu`，显示行号，设定之后，会在每一行的前缀显示该行的行号
- `:set nonu`，取消显示行号
- `:r! <command>`，将命令 command 的输出结果放到当前行
- `:w <filename>`，将编辑的数据储存成另一个档案(另存为)
- `:r <filename>`，在编辑的数据中，读入另一个档案的数据，即将filename的内容加到游标所在行后面
- `:n1,n2 w <filename>`，将 n1 到 n2 的内容储另存为filename
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
	- `t"`, 行内搜素，到下一个 " 前的字符，" 可以变成其它字符,`T`方向相反	
	- `(`，光标移至当前句句首，`)`，光标移至下一句句首
	- `{`，光标移至当前段开头，`}`, 光标移至下一段开头
	- `%`，匹配括号移动，包括 **(、{、[**
	- `Ctrl-u`，向文件首翻半屏
	- `Ctrl-d`，向文件尾翻半屏
	- `Ctrl-b`，向文件首翻一屏，同`PageUp`
	- `Ctrl-f`，向文件尾翻一屏，同`PageDown`
	- `H`，光标移动到这个屏幕的最上方那一行的第一个字符
	- `M`，光标移动到这个屏幕的中央那一行的第一个字符
	- `L`，光标移动到这个屏幕的最下方那一行的第一个字符
	- `*`，匹配光标当前所在的单词，移动光标到下一个匹配单词
	- `#`，匹配光标当前所在的单词，移动光标到上一个匹配单词
- 搜索/替换
	- `/YouMeek`，从光标开始处向文件尾搜索 YouMeek 字符，支持正则，按 `n` 继续向下找，按 `N` 向上找
	- `?YouMeek`，从光标开始处向文件首搜索 YouMeek 字符，支持正则，按 `n` 继续向上找，按 `N` 向下找
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
	- `Ctrl-v`，进入列编辑，块选取
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
	- `P`，将粘贴板中内容复制到光标之前，若复制的为行，p 为将已复制的数据在光标下一行贴上，P 则为贴在游标上一行(举例来说，我目前光标在第 20 行，且已经复制了 10 行数据，则按下 p 后，那 10 行数据会贴在原本的 20 行之后，亦即由 21 行开始贴，如果是按下 P, 那么原本的第 20 行会被推到变成 30 行
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
	- `Ctrl-r`，重做(Redo)
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

- `env`，查看所有系统变量
- `export PATH=$PATH:/opt/java/bin`，设置环境变量
- `echo $JAVA_HOME`，查看指定系统变量的值
- `unset JAVA_HOME`，删除指定的环境变量
- `uptime`，查看系统已经运行了多久，当前有几个用户，系统负载等信息
- `uname`，用于打印当前系统相关信息(内核版本号、硬件架构、主机名称和操作系统类型等)
- `shutdown`
    - `shutdown -hnow`，立即关机
    - `shutdown -h+10`，10 分钟后关机
    - `shutdown -h23:30`，23:30 关机
- `poweroff`，立即关机
- `reboot`，立即重启
- `lsb_release -a`，查看发行代号
- `locale`，查看支持的语言
- `update-locale`，修改系统语言
- `date`，查看/设置系统时间
	- `date -s "20080103 01:01:01"`，设置日期
	- `date +'%Y-%m-%d %H:%M:%S`，按照格式打印当前时间
- `cal`，在终端中查看日历
- `hostname`，查看 hostname，`hostname <name>`，临时设置 hsotname，`hostname -f`，完整 hostname，`hostname -i`，查看 ip， `domainname`或`hostname -d`，查看 DNS domain
- 系统配置文件
	- `/etc/resolv.conf`，DNS 设置
	- `/etc/hosts`，hosts
- `net-tools`
	- `ifconfig`，`netstat -tlunp`
- `ss`，`ss -nplt`，netstat 的替代品
- `nc 127.0.0.1 1234`，打开至127.0.0.1:1234的TCP连接， `nc -l 1234`，在1234端口监听，`nc -zv 127.0.0.1 8080 8888`，tcp 扫描8080和8888端口，-v verbose，-u udp，`nc -zv 127.0.0.1 8080-8090`，范围扫描
- `telnet ip port`，检查端口连通性 
- `dnsutils`
	- `dig www.baidu.com`，根据域名查出IP地址(DNS)
		- `dig -x 192.30.252.153`，从IP地址反查域名
- `df -h`，自动以合适的磁盘容量单位查看磁盘大小和使用空间
	- `df -k /etc`，以磁盘容量单位 K 为数值结果查看/etc目录磁盘使用情况
	- `df -mT`，以磁盘容量单位 M 为数值结果查看磁盘使用情况，并显示文件系统类型，如ext4
- `du -sh`，查看当前目录所占磁盘空间，h 的意思 human-readable 用人类可读性较好方式显示，系统会自动调节单位，显示合适大小的单位，s 表示 **-–summarize** 仅显示总计，即当前目录的大小
	- `du -sh /opt`，查看 opt 这个文件夹大小 
	- `du -h --max-depth=2 ./* | sort -hr | head -12`，找出当前目录下占用容量最大的前 12 个目录,最多两级
- `mount /dev/sdb5 /newDir/`，把分区 sdb5 挂载在根目录下的一个名为 newDir 的空目录下，需要注意的是：这个目录最好为空，不然已有的那些文件将看不到，除非卸载挂载。
	- 挂载好之后，通过：`df -h`，查看挂载情况。
- `umount /newDir/`，卸载挂载，用目录名，`umount /dev/sdb5`，卸载挂载，用分区名


## 用户/权限/安全

- `whoami`，当前用户名称，相当于`id -un`，`id sam`，输出 sam 的用户 id，组 id，`id -gn`，输出当前用户的当前组
- `cat /etc/group`，查看所有组
- `cat /etc/passwd`，查看所有用户
- `addgroup -S cfssl && adduser -S -g cfssl cfssl`，添加用户和组，根据配置 **/etc/adduser.conf**
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
- `chmod 777 <filename>`，所有人都可以进行读写执行，等于`chmod +rwx <filename>`
	- linux 的权限分为 rwx。r 代表：可读，w 代表：可写，x 代表：可执行
	- 这三个权限都可以转换成数值表示，r = 4，w = 2，x = 1，也就是最大权限，第一个 7 是所属主(user)的权限，第二个 7 是所属组(group)的权限，最后一位 7 是非本群组用户(others)的权限
	- `chmod ug+rx,o-x start.sh`，将文件 start.sh 设为该文件拥有者，与其所属同组者可写读取可执行，其他以人则不可执行
	- \+ 表示增加权限，- 表示取消权限，= 表示设定权限
	- `chmod -R a+r`，将当前目录下的所有文件与子目录皆设为任何人可读取，**-R** 对目前目录下的所有文件与子目录进行相同的权限变更，递归
	- 所属主的 x 权限位上是 **s**，这时称为 set uid 简写 SUID，则用户如果具有这个文件的执行权限，执行时将临时变成所属主身份，如果所属组的 x 权限位上是 **s**，称为 set gid，简称SGID，SGID用在目录上最多，则用户如果具有这个文件夹的读写执行权限，则该用户在这个目录下建立的文件和文件夹所属组都是这个目录所属组，但所属主仍是该用户，即任何人在 SGID 目录中创建文件文件夹，该组的其他用户都可以删掉，如果 others 的 x 权限位是 **t**，这时称为 SBIT 全称 Sticky Bit，只对目录有效，表示任何一个能够在这个目录下建立文件的用户，在这个目录下所建立的文件，只有该用户自己和root可以删除，其他用户均不可以，设定可以用数字方式：**SUID 为 4，SGID 为 2，SBIT 为 1**，如果我们想把 file 加上 SUID 权限的话`chmod 4755 file`，也可以用表达式：给test目录加上SGID权限和other可读取写入执行权限，`chmod g+s,o=rwx test/`，给test目录加上SBIT权限和other可读取写入执行权限`chmod o=rwxt test/`
- `umask`，查看当前权限掩码，结果 **0022** 所对应的文件和目录创建缺省权限分别为644和755，`umask 002`，设定权限掩码为 022 
- `chown -R user:group /usr/sam`，将 /usr/sam 下的所有文件与子目录的属主设为 user 属组 group
- `sudo <command>`，使用管理员权限使用命令，使用 sudo 回车之后需要输入当前登录账号的密码。
- `su <username>`，切换为 username 帐号登陆，non-login shell，省略 username 表示登录 root 
	- `su - <username>`，切换到 username 帐号登陆，**-** 或 **-l** 表示 login shell，省略 username 表示登录 root 
- `exit`，注销当前用户 (logout)，等价于 `Ctrl-D`
- `w [user]`，不带 user 输出当前登录用户以及进程，带 user 输出 user 的登录情况
- `last [user...] [tty...]`，显示最近登录的帐户及时间
- `lastlog`，显示系统所有用户各自在最近登录的记录，如果没有登录过的用户会显示从未登陆过
- `md5sum <filename>`，输出文件 MD5，`md5sum *.jpg > MD5 && md5sum -c MD5`，将当前目录下的 jpg 格式文件 MD5 码输出到文件 MD5 并验证，`md5sum -c --status MD5`，校验但不输出校验结果，一致返回 0，不一致返回 1 
	

## 其他常用命令

- `curl -X POST -d "data=xxx" example.com/form.cgi`， 
	带有 -d/--data 默认 Content-Type : application/x-www-form-urlencoded,并自动 POST,可省略-X POST
	- `curl -d '@data.txt' https://google.com/login`,读取 data.txt 文件的内容，作为数据体
	- `curl -G --data-urlencode 'comment=hello world' https://www.example.com`，--data--urlencode对数据 URL 编码，-G GET 请求
	- `curl -H "Content-Type:application/json" -H 'Accept-Language: en-US' http://example.com`，请求带头信息
	- `curl -i https://www.example.com`，输出网页头信息和内容
	- `curl -k https://www.example.com`，不检查服务器的 SSL 证书
	- `curl -o example.html https://www.example.com` 将相应保存成 example.html 等同于 `wget`
- `awk -F ':' '{print $1, $(NF-1)}' demo.txt`， awk见 http://www.ruanyifeng.com/blog/2018/11/awk.html
- `tar -cvf mytest.tar mytest/`，对 mytest/ 目录进行归档处理(归档和压缩不一样)
- `tar -xvf mytest.tar`，释放 mytest.tar 到当前目录
	- `tar -xvf mytest.tar -C /opt/setups/`，释放 mytest.tar 这个归档文件，释放到 /opt/setups/ 目录下	
- `zip mytest.zip /opt/test/`，把 /opt 目录下的 test/ 目录压缩为 mytest.zip
- `unzip mytest.zip`，解压 mytest.zip 到当前所在目录
	- `unzip mytest.zip -d /opt/setups/`，对 mytest.zip 这个文件进行解压，解压到 /opt/setups/ 目录下，如果目录不存在会自动创建
- 其他格式
	- `.war`，解压`unzip XXXXXX.war -d /opt/setups/`
	- `.tar.gz`，解压`tar -zxvf XXXXXX.tar.gz`，压缩`tar -zcvf test11.tar.gz test11`
	- `.tar.bz2`，解压`tar -jxvf XXXXXX.tar.bz2`，压缩`tar -jcvf test11.tar.bz2 test11`
	- `.tar.xz`，解压`tar -Jxvf XXXXXX.tar.xz`，压缩`tar -Jcvf test11.tar.xz test11`
	- `.bz2`，解压`bunzip2`，压缩`bzip2`
	- `.gz`，解压`gunzip`，压缩`gzip`
	- `.7z`，解压`7za x XXXXXX.7z`，压缩`7za a test1.7z /opt/test1/`
- `apt install ~/Downloads/google-chrome-stable_current_amd64.deb`，安装deb
- RPM 文件操作命令：
	- 安装
		- `rpm -i example.rpm`，安装 example.rpm 包
		- `rpm -ivh example.rpm`，安装 example.rpm 包并在安装过程中显示正在安装的文件信息及安装进度
	- 查询
		- `rpm -a | grep jdk`，查看 jdk 是否被安装
	- 卸载
		- `rpm -e jdk`，卸载 jdk(一般卸载的时候都要先用 rpm -qa 看下整个软件的全名)
