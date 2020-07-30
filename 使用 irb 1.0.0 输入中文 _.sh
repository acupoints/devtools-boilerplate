### 结论：使用irb 输入中文时请使用
## Git Bash
$ irb --help
$ irb --prompt default

λ irb --prompt default --noreadline -E GBK
λ irb --prompt default --noreadline
$ irb --prompt default --noreadline
> irb --prompt default --noreadline

### 下面是我尝试使用各种附加选项进入交互Shell的测试，直接使用上面那句命令更加适用
############################################################################
C:\Users\Administrator\Desktop
λ irb
irb(main):001:0> "hello"
=> "hello"
irb(main):002:0> "
###
irb(main):002:0> "中
### 输入中即可看到如下奇怪的报错
######################################
λ irb
irb(main):001:0> "hello"
=> "hello"
Traceback (most recent call last):行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行
         ...
         8: from C:/Ruby26-x64/lib/ruby/site_ruby/readline.rb:45:in `readline'
         ...
C:/Ruby26-x64/lib/ruby/site_ruby/rbreadline.rb:3908:in `codepoints': invalid byte sequence in GBK (ArgumentError)

C:\Users\Administrator\Desktop
λ 中

###
# irb 一见汉字就会报错退出，但它知道你输入的是GBK
# 报错中会提到 Readline extension module，简单说它还不想支持你输入的编码
# 解决方法就是把它先禁用掉，等官方升级并支持了，你便可不必这么做
############################################################################
λ irb --help
Usage:  irb.rb [options] [programfile] [arguments]
  --readline        Use Readline extension module
  --noreadline      Don't use Readline extension module
  -E enc            Same as `ruby -E UTF-8`
  -h, --help        Print help
### 加上选项，禁用 Readline extension module
# 虽然没有闪退，依然给出了提示，意思是交互Shell 正在使用的编码是UTF-8，你却给出了无效多字节字符
# 从这里也可以看出 GBK 和 UTF-8 是不兼容的，让我们再辛苦一下，指定一下编码看看它又会怎样
############################################################################
C:\Users\Administrator\Desktop
λ irb --noreadline
irb(main):001:0> "中"
Traceback (most recent call last):
        3: from C:/Ruby26-x64/bin/irb.cmd:31:in `<main>'
        2: from C:/Ruby26-x64/bin/irb.cmd:31:in `load'
        1: from C:/Ruby26-x64/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
SyntaxError ((irb):1: invalid multibyte char (UTF-8))
(irb):1: invalid multibyte char (UTF-8)
irb(main):002:0>

### 好啦，看起来一切正常
C:\Users\Administrator\Desktop
λ irb --noreadline -E GBK
irb(main):001:0> "中心城"
=> "中心城"
irb(main):002:0> puts("中心城")
中心城
=> nil
irb(main):003:0> hashCities = {a: "中心城A区", b: "中心城B区", c: "中心城C区"}
=> {:a=>"中心城A区", :b=>"中心城B区", :c=>"中心城C区"}
irb(main):004:0> puts(hashCities)
{:a=>"中心城A区", :b=>"中心城B区", :c=>"中心城C区"}
=> nil
irb(main):005:0>
