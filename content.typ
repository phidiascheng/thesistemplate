#import "utility.typ": *

///////////////////////////////////////
/////////////////////////////////////// 
/////////////////////////////////////// 

#let c = (
  行间距长度: 1.3em,
  缩进长度: 2em,
  页边距: 2.0cm,
  日期: datetime.today(),
  正文字号: 字号.小四,
  正文字体: 字体.宋体,
  章节字体: 字体.黑体,
  章节字号: 字号.小二,
  标题字号一级: 字号.四号,
  标题字号二级: 字号.小四,
  标题字号三级: 字号.小四,
  标题字体一级: 字体.黑体,
  标题字体二级: 字体.黑体,
  标题字体三级: 字体.黑体,
  图表标题字体: 字体.黑体,
  图表标题字号: 字号.五号,
  脚注字体: 字体.仿宋,
  脚注字号: 字号.小五,
  代码字体: 字体.代码,
  代码字号: 字号.五号,
)

#let fp = (
  报告标题 : "北京大学学位论文模板",
  报告子标题一: "pkuthss­typst v0.1.0",
  报告子标题二: "",
  作者: "李四",
  班级: "一(7)班",
  学校: "北京大学",
  学院:"物理学院",
  专业:"物理学",
  学号:"02930289",
  研究方向:"凝聚态物理",
  导师:"张三教授",
  报告标题字体: 字体.黑体,
  报告标题字号: 字号.二号,
  作者字体: 字体.楷体,
  作者字号: 字号.小三,
)

#let outIterms = (
  目录标题字体: 字体.黑体,
  目录标题字号: 字号.三号,
  目录正文字体: 字体.宋体,
  目录正文字号: 字号.小四,
  目录行距: 1.0em,
)

#let hf = (
  页眉页脚字体: 字体.宋体,
  页眉页脚字号: 字号.小五,
  页眉页脚间距: c.行间距长度,
  偶数页页眉: "北京大学博士学位论文"
)

#let bibIterms = (
  参考文献字体: 字体.楷体,
  参考文献字号: 字号.小四,
)

#let 标题列表 = (
  "绪论",
  "理论基础",
  "实验设计",
  "材料准备",
)

#let 摘要 = (
  中文摘要: "本文介绍了 pkuthss­typst 文档模板所提供的功能。本文介绍了 pkuthss­typst 文档模板所提供的功能。本文介绍了 pkuthss­typst 文档模板所提供的功能。",
  中文关键词: " Typst、模板",
  英文标题: "PKU dissertation document template pkuthss­typst v0.1.0",
  英文作者: "San Zhang",
  英文导师: "Li Si",
  英文摘要: "This document introduces the features of the pkuthss­typst template. This document introduces the features of the pkuthss­typst template.",
  英文关键词: "Typst, Template",
)

#show: doc => setDocumentPage(c,hf,doc)
#show: doc => addFrontpage(c,hf,fp,doc)
#show: doc => addCopyright(c,hf,doc)
#show: doc => addAbstractZh(摘要,c,hf,doc)
#show: doc => addAbstractEn(摘要,c,hf,doc)
#show: doc => addOutline(c,hf, outIterms,doc)
#show: doc => addItermOutline("插图",c,hf,outIterms,doc)
#show: doc => addItermOutline("表格",c,hf,outIterms,doc)
#show: doc => addItermOutline("代码",c,hf,outIterms,doc)


#show: doc => setTextbody(c,hf,doc)

////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
#show: doc => setHeader(标题(标题列表,nc),hf,doc)
= 第#编号(nc)章 #标题(标题列表,nc)    
#let nc=nc+1;#nh.step()           
////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
///////==============>
== 二级标题
#lorem(40)

#lorem(50)
=== 三级标题

#lorem(20)
== 三级标题
#lorem(50)
=== 三级标题
#lorem(50)


////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#show:doc => pagebreakToOdd("正文",hf,doc)
////////////////////////////////////////////////////////////////////
#show: doc => setHeader(标题(标题列表,nc),hf,doc)
= 第#编号(nc)章 #标题(标题列表,nc)    
#let nc=nc+1;#nh.step()           
////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
///////==============>
== 二级标题
#lorem(40)

#lorem(50)
=== 三级标题

#lorem(20)
== 三级标题
#lorem(50)
=== 三级标题
#lorem(50)

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#show:doc => pagebreakToOdd("正文",hf,doc)
////////////////////////////////////////////////////////////////////
#show: doc => setHeader(标题(标题列表,nc),hf,doc)
= 第#编号(nc)章 #标题(标题列表,nc)   
#let nc=nc+1;#nh.step()          
////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
///////==============>
== 引用


欢迎来到 Typst 的教程！在本教程中#cite(<sophocleous2002interactions>, form: "prose", style: "american-geophysical-union")，您将学习如何在 Typst 中编写和格式化文档。 我们将从一些日常的任务开始，逐步引入更高级的功能。 

== 脚注

本教程并不事先假定您了解 Typst、其他标记语言或相关的编程技术 #footnote[参考江苏就狂龙三] #footnote[你懂]。 

== 插图

我们只会假定您知道如何编辑一个文本文件。



#figure(
  image("f3.1.png", width: 70%, height: 20%),
  caption: "图1标题",
)

== 表格
我们将从一些日常的任务开始，逐步引入更高级的功能。 

#figure(
  table(
    columns: 4,
    stroke: 0.5pt,

    table.header[Test Item][Specification][Test Result][Compliance],
    [Voltage], [220V ± 5%], [218V], [Pass],
    [Current], [5A ± 0.5A], [4.2A], [Fail],
  ),
  caption: [表1标题],
)


== 图片版式
并按照以下步骤操作。 

#figure(
    grid(
        columns: 2,     
        rows: 2,
        gutter: 2pt,   
        stack(
          dir: ttb,
          spacing: 2pt,
          image("f3.1.png", width: 100%, height: 10%),
          image("f3.1.png", width: 100%, height: 15%),
        ),
        stack(
          dir: ttb,
          spacing: 2pt,
          image("f3.1.png", width: 100%, height: 15%),
          image("f3.1.png", width: 100%, height: 10%),
        ),
        "sub figure A",
        "sub figure B"
    ),
    caption: "图2标题"
)

亦或者您可以使用 开源 CLI 在本地文本编辑器中进行编辑和编译。

#figure(
    grid(
      rows: 2,
      gutter: 2pt,
      stack(
        dir: ltr,
        spacing: 2pt,
        image("f3.1.png", width: 30%, height: 10%),
        image("f3.1.png", width: 70%, height: 10%),
      ),
      stack(
        dir: ltr,
        spacing: 2pt,
        image("f3.1.png", width: 60%, height: 10%),
        image("f3.1.png", width: 40%, height: 10%),
      ),
    ),
    caption: "图3标题"
)<fig3>

== 三线表
亦或者您可以使用 开源 CLI 在本地文本编辑器中进行编辑和编译。

#figure(
  table(
    columns: (2cm,2.5cm,3cm,2cm),
    stroke: none,
    align: (right,center,right),
    inset: (
      top: 4pt,
      bottom: 4pt),
    table.hline(stroke: 1.0pt,  start: 0),
    table.header[Test Item][Specification][Test Result][Compliance],
    table.hline(stroke: 0.5pt,  start: 0),
    [Voltage], [220V ± 5%], [218V], [Pass],
    [Current], [5A ± 0.5A], [4.2A], [Fail],
    table.hline(stroke: 1.0pt,  start: 0),
  ),
  caption: "表2标题"
)<fig1>


== 公式

并按照以下步骤操作(@ds)。 我们只会假定您知道如何编辑一个文本文件(@fig1)。

$ f(x) + k x = b $
$ integral_b^a f(x) dif x = S  $
$ f(x) + k x = b $ <ds>

== 折线图
开始的最佳方法是去免费注册一个 Typst App 账户，并按照以下步骤操作。

#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot, chart


#figure(
cetz.canvas(
  {
    import cetz.draw: *

    plot.plot(
      size: (12,6), 
      x-tick-step: 1, 
      y-tick-step: 1, 
      x-label: [#set text(size:12pt, font: "Times"); #v(-2pt) _x_ axis],
      y-label: [#set text(size:12pt, font: "Times"); #v(0pt) _y_ axis],
    {
      plot.add(((0,0), (1,1), (2,.5), (4,3)))
    })
  }),
  caption: [Probe results for design A],
)


== 代码
我们只会假定您知道如何编辑一个文本文件。```python def main() ```我们只会假定您知道如何编辑一个文本文件。

#figure(
  ```c
  #include <stdio.h>
  int main()
  {
    // printf() 中字符串需要引号
    printf(\"Hello, World!\");
    return 0;
  }
  ```,
  kind: raw,
  caption: "演示代码1",
)

#figure(
  ```c
  #include <stdio.h>
  int main()
  {
    // printf() 中字符串需要引号
    printf(\"Hello, World!\");
    return 0;
  }
  ```,
  kind: raw,
  caption: "演示代码2",
  outlined: false,
)


== 汉语拼音

#import "@preview/easy-pinyin:0.1.0": pinyin, zhuyin

汉（#pinyin[ha4n]）语（#pinyin[yu3]）拼（#pinyin[pi1n]）音（#pinyin[yi1n]）。 #zhuyin.with(scale: 0.8, spacing: 2pt)(delimiter: "|")[汉|语|拼|音][ha4n|yu3|pi1n|yi1n]


////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#show:doc => pagebreakToOdd("正文",hf,doc)
////////////////////////////////////////////////////////////////////
#show: doc => setHeader("附录",hf,doc)
= 附录   
#let nc=nc+1;#nh.step()           
#set heading(numbering: none)
////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
///////==============>

== A1
== A2
== A3

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#show:doc => pagebreakToOdd("正文",hf,doc)
////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
///////==============>

#show: doc => addBibChapter("bib.bib","参考文献",c,hf,doc)

////////////////////////////////////////////////////////////////////
///////==============>


#show: doc => addPage("致谢",c,hf,doc)

感谢 Typst 开发者的辛勤付出。#lorem(200)

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#show: doc => pagebreakToOdd("正文",hf,doc)
////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////// 
///////==============>
#show: doc => setHeader("none",hf,doc)
= 北京大学学位论文原创性声明和使用授权说明    
//#show: doc => addPage("北京大学学位论文原创性声明和使用授权说明",c,hf,doc)
\ #align(center)[#set text(font: 字体.黑体, size: 字号.四号); 原创性声明]

本人郑重声明: 所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所 取得的成果。除文中已经注明引用的内容外，本论文不含任何其他个人或集体已经发表 或撰写过的作品或成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确 方式标明。 本声明的法律结果由本人承担。
\ \ #align(right)[论文作者签名 #h(5em) 日期: #h(2em) 年 #h(2em) 月 #h(2em) 日]

\ \ \ #align(center)[#set text(font: 字体.黑体, size: 字号.四号); 学位论文使用授权说明]

#align(center)[#set text(size: 字号.五号);#v(-1em) (必须装订在提交学校图书馆的印刷本)]
本人完全了解北京大学关于收集、保存、使用学位论文的规定，即: #parbreak()
• 按照学校要求提交学位论文的印刷本和电子版本;#parbreak()
• 学校有权保存学位论文的印刷本和电子版，并提供目录检索与阅览服务，在校园#parbreak()
网上提供服务;#parbreak()
• 学校可以采用影印、缩印、数字化或其它复制手段保存论文;#parbreak()
• 因某种特殊原因须要延迟发布学位论文电子版，授权学校$ballot$一年/$ballot$两年/$ballot$三年以后，#parbreak() 在校园网上全文发布。

#align(center)[(保密论文在解密后遵守此规定)]
\ \ #align(right)[论文作者签名 #h(5em) 导师签名 #h(5em) 日期: #h(2em) 年 #h(2em) 月 #h(2em) 日]

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#show: doc => pagebreakToOdd("结束",hf,doc)
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
