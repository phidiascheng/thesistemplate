
#let 字号 = (
  初号: 42pt, 
  小初: 36pt, 
  一号: 26pt, 
  小一: 24pt, 
  二号: 22pt, 
  小二: 18pt, 
  三号: 16pt, 
  小三: 15pt, 
  四号: 14pt, 
  中四: 13pt, 
  小四: 12pt, 
  五号: 10.5pt, 
  小五: 9pt,  
  六号: 7.5pt,  
  小六: 6.5pt,  
  七号: 5.5pt,  
  小七: 5pt,
)

#let 字体 = (
  仿宋: ("Times New Roman", "STFangsong"), 
  宋体: ("Times New Roman", "STSong"),  
  黑体: ("Times New Roman", "STHeiti"), 
  楷体: ("Times New Roman", "STKaiti"), 
  代码: ("New Computer Modern Mono", "Courier New", "Menlo", "Times New Roman", "SimSun"),
)

#let nh = counter(heading)
#let nc = 0

#let 编号(n) = {
  let 中文编号 = ("一", "二", "三", "四", "五", "六", "七", "八", "九", "十","十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十","二十一", "二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十","三十一", "三十二", "三十三", "三十四", "三十五", "三十六", "三十七", "三十八", "三十九", "四十",)
  中文编号.at(n)
}

#let 标题(标题列表,n) = {标题列表.at(n)}

#let setDocumentPage(c,hf,doc) = {
  set page(
    header-ascent: hf.页眉页脚间距,  
    footer-descent: hf.页眉页脚间距, 
    margin: (
      x: c.页边距, 
      y: c.页边距
    ),
    numbering: none,
    )
  doc
}

#let setHeader(hCont,hf,doc) = {
  if hCont == "none" {
    set page(header: none,)
    doc
  }
  else {
    set page(
      header-ascent: hf.页眉页脚间距,  
      footer-descent: hf.页眉页脚间距, 
      header: context {
        if calc.even(counter(page).get().first()) {
          [#set align(center); #set par(leading: 0pt,spacing: 0pt); #set text(font: hf.页眉页脚字体, size:hf.页眉页脚字号); #hf.偶数页页眉 #v(3pt) #line(length: 100%, stroke: 0.5pt)]
        }
        else {
          [#set align(center); #set par(leading: 0pt,spacing: 0pt); #set text(font: hf.页眉页脚字体, size:hf.页眉页脚字号); #hCont #v(3pt) #line(length: 100%, stroke: 0.5pt)]
        }
      }
    )
    doc
  }
}

#let setFooter(fType,hf,doc) = {
  if fType =="前言" {
    set page(
      numbering: "I",
      number-align: center,
      footer: context align(center)[#set text(font: hf.页眉页脚字体, size: hf.页眉页脚字号);#counter(page).display("I")]
    )
    doc
  }
  else if fType == "正文" {
    set page(
      numbering: "1",
      number-align: center,
      footer: context align(center)[#set text(font: hf.页眉页脚字体, size: hf.页眉页脚字号);#counter(page).display("1")]
    )
    doc
  }
  else if fType == "none" {
    set page(footer: none,)
    doc
  }
}

#let pagebreakToOdd(sec,hf,doc) = {
  set page(
    header: none,
    footer: none,
  )
  if sec == "结束"{
    pagebreak(to: "even")
    doc
  }
  else{
    pagebreak(to: "odd")
    if sec == "正文"{
      show: setFooter("正文",hf,doc)
    }
    else{
      show: setFooter("前言",hf,doc)
    }
  }
}

#let addFrontpage(c,hf,f,doc) = {
  show: doc => setFooter("none",hf,doc)
  show: doc => setHeader("none",hf,doc)
  block(height: 3cm)

  align(center, image("pkulogo.png",width:50%))
  align(center)[#set text(font: 字体.黑体, size: 字号.一号); #v(-1em) 博士研究生学位论文]
  block(height: 0.5cm)  
  align(center)[#set text(size: 字号.小二)
  #table(
    columns: (3em,18em),
    stroke: none,
    align: (left,center),
    inset: (
      top: 0.3em,
      bottom: 0.3em
    ),
    [题目:], [#set text(font: 字体.黑体); #f.报告标题 ],
    table.hline(stroke: 0.5pt,  start: 1),
    [], [ #f.报告子标题一 ],
    table.hline(stroke: 0.5pt,  start: 1),
//    [], [ #f.报告子标题二 ],
//    table.hline(stroke: 0.5pt,  start: 1),
  )]

  block(height: 6cm)
  align(center)[#set text(size: f.作者字号)
  #table(
    columns: (5em,15em),
    stroke: none,
    align: (left,center),
    inset: (
      top: 0.6em,
      bottom: 0.2em
    ),
    [#set text(font: 字体.黑体);姓#h(2em)名:], [#set text(font: 字体.仿宋); #f.作者],
    table.hline(stroke: 0.5pt,  start: 1),
    [#set text(font: 字体.黑体);学#h(2em)号:], [#set text(font: 字体.仿宋); #f.学号],
    table.hline(stroke: 0.5pt,  start: 1),
    [#set text(font: 字体.黑体);学#h(2em)院:], [#set text(font: 字体.仿宋); #f.学院],
    table.hline(stroke: 0.5pt,  start: 1),
    [#set text(font: 字体.黑体);专#h(2em)业:], [#set text(font: 字体.仿宋); #f.专业],
    table.hline(stroke: 0.5pt,  start: 1),
    [#set text(font: 字体.黑体);研究方向:], [#set text(font: 字体.仿宋); #f.研究方向],
    table.hline(stroke: 0.5pt,  start: 1),
    [#set text(font: 字体.黑体);导#h(2em)师:], [#set text(font: 字体.仿宋); #f.导师],
    table.hline(stroke: 0.5pt,  start: 1),
  )]
  show: doc => pagebreakToOdd("前言",hf,doc)
  doc
}

/////////////////////////////////////// 

#let addCopyright(c,hf,doc) = {
  show: doc => setFooter("none",hf,doc)
  show: doc => setHeader("none",hf,doc)
  //////////
  align(center)[#set text(font: c.标题字体一级, size: c.标题字号一级); \ \ \ \ 版权声明 \ \ ]
  [#set text(font: c.正文字体, size: c.正文字号); #set par(leading: c.行间距长度, first-line-indent: c.缩进长度)
  任何收存和保管本论文各种版本的单位和个人，未经本论文作者同意，不得将本论 文转借他人，亦不得随意复制、抄录、拍照或以任何方式传播。否则，引起有碍作者著 作权之问题，将可能承担法律责任。]
  //////////
  show: doc => pagebreakToOdd("前言",hf,doc)
  doc
}

/////////////////////////////////////// 

#let addAbstractZh(摘要,c,hf,doc) = {
  show: doc => setHeader("摘要",hf,doc)
  show: doc => setFooter("前言",hf,doc)
  counter(page).update(1)
  //////////
  align(center)[#set text(font: c.标题字体一级, size: c.标题字号一级); \ 摘要 \ \ ]
  [#set text(font: c.正文字体, size: c.正文字号); #set par(leading: c.行间距长度, first-line-indent: c.缩进长度); #摘要.中文摘要]
  [#set text(font: c.标题字体一级, size: c.正文字号); \ 关键词:]
  [#set text(font: c.正文字体); #摘要.中文关键词]
  //////////
  show: doc => pagebreakToOdd("前言",hf,doc)
  show: doc => setHeader("",hf,doc)
  doc
}

#let addAbstractEn(摘要,c,hf,doc) = {
  show: doc => setHeader("Abstract",hf,doc)
  show: doc => setFooter("前言",hf,doc)
  ///////////
  align(center)[#set text(font: c.正文字体, size: c.标题字号一级); \ \ *#摘要.英文标题* ]
  align(center)[#set text(font: c.正文字体, size: c.正文字号); \ #摘要.英文作者]
  align(center)[#set text(font: c.正文字体, size: c.正文字号); Directed by Prof. #摘要.英文导师 \ \ ]
  align(center)[#set text(font: c.正文字体, size: c.标题字号一级); \ \ *Abstract* \ \ ]
  [#set text(font: c.正文字体, size: c.正文字号); #set par(leading: c.行间距长度, first-line-indent: c.缩进长度); #摘要.英文摘要]
  [#set text(font: c.正文字体, size: c.正文字号); \ *Keywords:*]
  [#set text(font: c.正文字体); #摘要.英文关键词]
  //////////
  show: doc => pagebreakToOdd("前言",hf,doc)
  show: doc => setHeader("",hf,doc)
  doc
}

/////////////////////////////////////// 

#let addOutline(c,hf,o,doc) = {
  show: doc => setHeader("目录",hf,doc)
  show: doc => setFooter("前言",hf,doc)
  align(center)[#set text(font: o.目录标题字体, size: o.目录标题字号); \ 目录 ]
  set text(font: o.目录正文字体, size: o.目录正文字号)
  ///////////=====>
  show outline.entry.where(level:1): it => {
    set text(font: c.标题字体一级);
    v(0.5em, weak: true); 
    it.body + box(width:1fr, repeat[]) +  box(width:1%, align(right)[#set text(font: o.目录正文字体);*#it.page*]);
    v(0em, weak: true);
  }
  show outline.entry.where(level:2): it => {
    set text(font: o.目录正文字体);
    v(0em, weak: true); 
    h(1.5em)+ it.body + box(width:1fr, repeat[.]) +  box(width:1%, align(right)[#set text(font: o.目录正文字体);#it.page]);
    v(0em, weak: true);
  }
  show outline.entry.where(level:3): it => {
    set text(font: o.目录正文字体);
    v(0em, weak: true); 
    h(3em)+ it.body + box(width:1fr, repeat[.]) +  box(width:1%, align(right)[#set text(font: o.目录正文字体);#it.page]);
    v(0em, weak: true);
  }
  ////////////
  outline(title: none)
  show: doc => pagebreakToOdd("前言",hf,doc)
  show: doc => setHeader("",hf,doc)
  doc
}

/////////////////////////////////////// 

#let addBibliography(path,c,hf,b,doc) = {
  show bibliography: set text(lang: "en", font: b.参考文献字体, size: b.参考文献字号)
  set heading(numbering: none)
  set par(first-line-indent: 0pt,)
  set text(font: c.标题字体一级, size: c.标题字号一级,); [ = 参考文献]
  bibliography(path, title: none)
  show: doc => pagebreakToOdd("前言",hf,doc)
  show: doc => setHeader("",hf,doc)
  doc
}

/////////////////////////////////////// 


#let setTextbody(c,hf,doc) = {
  ///// set标题
  show heading.where(level: 1): set text(font: c.标题字体一级, size: c.标题字号一级)
  show heading.where(level: 1): set align(center)
  show heading.where(level: 1): set heading(numbering:none)
  show heading.where(level: 1): set block(inset: 1.5em,)
  show heading.where(level: 2): set text(font: c.标题字体二级, size: c.标题字号二级)
  show heading.where(level: 3): set text(font: c.标题字体三级, size: c.标题字号三级)
  set heading(numbering: "1.1",)
  show heading: it => {
    set block(above: c.行间距长度, below: c.行间距长度)
    it + par()[#text()[#v(0em, weak: true)];#text()[#h(0em)]]
  }
  //// set图表
  set image(fit: "stretch")
  set figure.caption(separator: [. ])
  show figure: it => {
    set text(font: c.图表标题字体, size:c.图表标题字号)
    if it.kind == table {
      it.caption + it.body + v(0em, weak: true) + h(0em)
    }
    else if it.kind == image { 
      it.body + it.caption
    }
    else{
      it
    }
  }
  //// set公式
  set math.equation(numbering: "[1]")
  show math.equation.where(block: true): it =>{  it + v(0em, weak: true) + h(0em)}
  /// set段落
  set par(
    leading: c.行间距长度,  
    spacing: c.行间距长度,  
    first-line-indent: c.缩进长度,
    justify: true,  
    linebreaks: "optimized",
  )
  /// set 正文
  set text(
    lang: "zh", 
    font: c.正文字体, 
    size: c.正文字号,
  )  
  /// set 代码
  show raw.where(block: false): box.with(
    fill: luma(240),  
    radius: 2pt,
    inset: (x: 3pt, y: 0pt),  
    outset: (y: 3pt),)
  show raw.where(block: true): block.with(
    width: 100%,  
    radius: 3pt,
    fill: luma(240),  
    inset: 5pt,)
  show raw.where(block: true): it => { set align(left); it + v(0em, weak: true) + h(0em)}
  /// set脚注
  show footnote.entry: set text(font: c.脚注字体, size: c.脚注字号)
  set footnote.entry(  clearance: c.行间距长度,  gap: c.行间距长度,)
  /// set 页码
  show: doc => setFooter("正文",hf,doc)
  counter(page).update(1)
  /// set参考文献
  show bibliography: set text(lang: "zh",)
  /// 
  doc
}
/////////////////////////////////////// 

#let addBibChapter(path,chaptertitle,c,hf,doc) = {
    show: doc => setHeader(chaptertitle,hf,doc)
    set page(
      numbering: "1",
    )
    set heading(numbering: none)
    align(center)[#set text(font: c.章节字体, size: c.章节字号);
    = #chaptertitle ]
    bibliography(path, title: none, style:"gb-7714-2015-numeric")
    set heading(numbering: "1.1")
    ////////////
    show: doc => pagebreakToOdd("正文",hf,doc)
    show: doc => setHeader("",hf,doc)
    doc
}

/////////////////////////////////////// 

#let addPage(chaptertitle,c,hf,doc) = {
    show: doc => setHeader(chaptertitle,hf,doc)
    set page(
      numbering: "1",
    )
    set heading(numbering: none)
    align(center)[#set text(font: c.章节字体, size: c.章节字号);
    = #chaptertitle ]
    set heading(numbering: "1.1")
    doc
}

/////////////////////////////////////// 
#let addItermOutline(itermtype,c,hf,o,doc) = {
  show: doc => setHeader(itermtype,hf,doc)
  if itermtype == "插图" {
    show: doc => setHeader("插图",hf,doc)}
  else if itermtype == "表格" {
    show: doc => setHeader("表格",hf,doc)}
  else if itermtype == "代码" {
    show: doc => setHeader("代码",hf,doc)}
  else{    }

  show: doc => setFooter("前言",hf,doc)
  align(center)[#set text(font: o.目录标题字体, size: o.目录标题字号); \ #itermtype ]
  set text(font: o.目录正文字体, size: o.目录正文字号)
  set par(leading: o.目录行距)
  show outline.entry.where(): it => {
    set text(font: o.目录正文字体);
    it.body + box(width:1fr, repeat[.]) + box(width:1%, align(right)[#it.page])
  }

  if itermtype == "插图" {
    outline(title: none,indent: 1.5em, target: figure.where(kind: image))}
  else if itermtype == "表格" {
    outline(title: none,indent: 1.5em, target: figure.where(kind: table))}
  else if itermtype == "代码" { 
    outline(title: none,indent: 1.5em, target: figure.where(kind: raw))}
  else{    }
  show: doc => pagebreakToOdd("正文",hf,doc)
  show: doc => setHeader("",hf,doc)
  doc
}

