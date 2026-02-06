%%%%%%%%%%%%%%%%%%%%%%
%% start of file `elegantbook.cls'.
%% Copyright 2013-2022 ElegantLaTeX (elegantlatex2e@gmail.com)
%%
%% This work may be distributed and/or modified freely
%% available at https://github.com/ElegantLaTeX/ElegantBook
% 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantbookcopy}[2022/04/09 v4.3 ElegantBook document class]


%%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}


%%% ========== 选项设置 ==========
% ------ 全局默认选项 ------
\DeclareStringOption[blue]{color}
\DeclareStringOption[white]{paper}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[normal]{device}
\DeclareStringOption[marginfalse]{marginpar}
\DeclareStringOption[onecol]{toc}
\DeclareStringOption{scheme}

% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{orange}{\ekv{color=orange}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

\DeclareVoidOption{beige}{\ekv{paper=beige}}

% ------ 语言和字体 ------
\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}
\DeclareStringOption[cm]{font}
\DeclareStringOption[ctexfont]{chinesefont}

\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nozhfont}{\ekv{chinesefont=nozhfont}}

\DeclareVoidOption{cm}{\ekv{font=cm}}
\DeclareVoidOption{stix2}{\ekv{font=stix2}}
\DeclareVoidOption{termes}{\ekv{font=termes}}
\DeclareVoidOption{nofont}{\ekv{font=nofont}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{it}{\ekv{lang=it}}
\DeclareVoidOption{fr}{\ekv{lang=fr}}
\DeclareVoidOption{nl}{\ekv{lang=nl}}
\DeclareVoidOption{hu}{\ekv{lang=hu}}
\DeclareVoidOption{de}{\ekv{lang=de}}
\DeclareVoidOption{mn}{\ekv{lang=mn}}
\DeclareVoidOption{pt}{\ekv{lang=pt}}
\DeclareVoidOption{jp}{\ekv{lang=jp}}

% ------ 定理风格 ------
\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

% ------ 显示尺寸 ------
\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareStringOption[numeric-comp]{citestyle}
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}

% ------ 栏目 ------
\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

% ------ 章节计数器 ------
\DeclareStringOption[section]{thmcnt} %定理类环境编号被使用者改动，默认为 section.
\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

% ------ 参考文献 ------
\DeclareStringOption[biber]{bibend}
\DeclareVoidOption{biber}{\ekv{bibend=biber}}
\DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}

% ----- Math option -----
\newcommand\mailto[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
%%% ========== 选项设置结束 ==========

%%% ========== 全局页面控制 ==========
%% ======== 加载基础文档类 ========
\LoadClass[a4paper,oneside]{book}

\RequirePackage{setspace}
%% ========= 页面尺寸 ========
% 提供 normal 和 pad 两种尺寸选择, 默认 normal
\RequirePackage{geometry}
\ifdefstring{\ELEGANT@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
  \ifdefstring{\ELEGANT@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\ELEGANT@device}{pad}{
\geometry{
  paperwidth=7.5in, 
  paperheight=10in,
  margin=16mm,
  headheight=2.17cm,
  footskip=4mm
}}{\relax}
%% ======== 页面尺寸结束 ========

\RequirePackage{indentfirst,comment}
\RequirePackage{multicol} % 

%% ======== 行距调整 ========
\renewcommand{\baselinestretch}{1.2}
\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{12pt}
}
%% ======== 行距调整结束 ========
%% ======== 引用 ========
\RequirePackage{csquotes}

\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={ElegantBook},
  colorlinks,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}
%% ======== 引用结束 ========
%%% ========== 全局页面控制结束 ==========

%%% ========== 字体设置 ==========
\RequirePackage{amsmath}
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{anyfontsize}
\RequirePackage{iftex}

%% ======== 西文字体 ========

\ifdefstring{\ELEGANT@font}{cm}{
  \RequirePackage{extarrows,esint}
  \RequirePackage{amssymb,amsfonts,mathrsfs}
    \newcommand\bmmax{0}
  \RequirePackage{bm}
}{\relax}

\ifdefstring{\ELEGANT@font}{stix2}{
  \ifXeTeX
    \RequirePackage[no-math]{fontspec}
    \RequirePackage{unicode-math}
    % --- 西文正文 ---
    \setmonofont{CMU Typewriter Text}
    \setmainfont{STIX Two Text}
    \setsansfont{TeX Gyre Heros}
    % --- 西文数学 ---
    \setmathfont{STIX Two Math}
      \AtBeginDocument{
        \let\mathrm\symup
        \let\mathbf\symbf
        \let\boldsymbol\symbfit
        \let\mathbb\symbb
        \let\mathcal\symcal
        \let\mathscr\symscr
        \let\mathfrak\symfrak
      }
    \setmathfont{STIX Two Math}[range={scr,bfscr}, StylisticSet=01]
  \else
    % --- 西文正文 ---
    \RequirePackage{newtxtext}
    \RequirePackage[scaled=.90]{helvet}
    % --- 西文数学 ---
    \let\Bbbk\relax
    \RequirePackage[lite]{mtpro2}
  \fi
}{\relax}

\ifdefstring{\ELEGANT@font}{termes}{
  \ifXeTeX
    \RequirePackage[no-math]{fontspec}
    \RequirePackage{unicode-math}
    % --- 西文正文 ---
    \setmonofont{CMU Typewriter Text}
    \setmainfont{TeX Gyre Termes}
    \setsansfont{TeX Gyre Heros}
    % --- 西文数学 ---
    \setmathfont{TeX Gyre Termes Math}
      \AtBeginDocument{
        \let\mathrm\symup
        \let\mathbf\symbf
        \let\boldsymbol\symbfit
        \let\mathbb\symbb
        \let\mathcal\symcal
        \let\mathscr\symscr
        \let\mathfrak\symfrak
      }
    \setmathfont{STIX Two Math}[range={scr,bfscr}, StylisticSet=01]
  \else
    % --- 西文正文 ---
    \RequirePackage{newtxtext}
    \RequirePackage[scaled=.90]{helvet}
    % --- 西文数学 ---
    \RequirePackage{newtxmath}
    \let\Bbbk\relax
      % 优化巨运算符在 newtxmath 字体下的效果
      \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
      \let\sumop\relax\let\prodop\relax
      \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
      \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
  \fi
}{\relax}

\ifdefstring{\ELEGANT@font}{nofont}{
  \ifXeTeX 
    \RequirePackage[no-math]{fontspec}
  \fi
}

%% ======== 中文字体 ========
\RequirePackage{subfiles}
\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@chinesefont}{founder}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
     \setCJKmainfont[BoldFont={FZHei-B01.ttf},ItalicFont={FZKai-Z03.ttf}]{FZShuSong-Z01.ttf}
    \setCJKsansfont[BoldFont={FZHei-B01.ttf}]{FZKai-Z03.ttf}
    \setCJKmonofont[BoldFont={FZHei-B01.ttf}]{FZFangSong-Z02.ttf}
    \setCJKfamilyfont{zhsong}{FZShuSong-Z01.ttf}
    \setCJKfamilyfont{zhhei}{FZHei-B01.ttf}
    \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01.ttf}]{FZKai-Z03.ttf}
    \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01.ttf}]{FZFangSong-Z02.ttf}
    \newcommand*{\songti}{\CJKfamily{zhsong}}
    \newcommand*{\heiti}{\CJKfamily{zhhei}}
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}
    \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
  
  \ifdefstring{\ELEGANT@chinesefont}{nozhfont}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}}{\relax}

  \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
    \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
  
  \AfterEndPreamble{
    \setlength\parindent{2\ccwd}}
}{\relax}

\ifcsname heiti\endcsname
  \newcommand{\cbfseries}{\heiti}
\else
  \newcommand{\cbfseries}{\bfseries}
\fi

\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi

%%% ========== 字体设置结束 ==========

%%% ========== 颜色处理 ==========
%% 章节以及页脚图形
% blue 选项的颜色被使用者改动，现在 main 是绿色，second 是橙色，third 是深蓝色。另外 Mandarine 颜色是专用于 anymark 的颜色，目前与 second 同色，有必要可修改。
\RequirePackage[table]{xcolor}

%% ======== 定义颜色样式 ========
% 纸张颜色
\definecolor{faint}{RGB}{255,255,255} 
\definecolor{lightergray}{gray}{0.99}
\ifdefstring{\ELEGANT@paper}{beige}{%
  \definecolor{faint}{RGB}{252,250,246}%
  \definecolor{lightergray}{RGB}{250,248,244}%
}{\relax}
\newcommand{\globalpagecolor}{%
  \pagecolor{faint}%
}

% 共有 green, cyan, blue, orange, black 五种样式
\ifdefstring{\ELEGANT@color}{green}{
  \definecolor{structurecolor}{RGB}{0,195,110}%
  \definecolor{main}{RGB}{136,180,72}%
  \definecolor{second}{RGB}{255,134,24}%
  \definecolor{third}{RGB}{92,158,86}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
  \definecolor{structurecolor}{RGB}{31,186,190}%
  \definecolor{main}{RGB}{14,135,140}%
  \definecolor{second}{RGB}{245,122,143}%
  \definecolor{third}{RGB}{85,130,140}%
}{\relax}

\ifdefstring{\ELEGANT@color}{blue}{
  \definecolor{structurecolor}{RGB}{0, 174, 247} % 
  \definecolor{main}{RGB}{0,169,159}%
  \definecolor{second}{RGB}{255,154,24}%
  \definecolor{third}{RGB}{60,113,183}%
}{\relax}
% blue 主题的主颜色被使用者改动
\ifdefstring{\ELEGANT@color}{orange}{
  \definecolor{structurecolor}{RGB}{255,154,24}
  \definecolor{main}{RGB}{215,75,25}%
  \definecolor{second}{RGB}{130,212,28}%
  \definecolor{third}{RGB}{224,144,76}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
  \definecolor{structurecolor}{RGB}{0,0,0}
  \definecolor{main}{RGB}{80,80,80}%
  \definecolor{second}{RGB}{120,120,120}%
  \definecolor{third}{RGB}{0,0,0}%
}{\relax}
%% ======== 主颜色结束 ========

%% ======== 定义备用颜色 ========
%green color
\definecolor{purples}{RGB}{212, 51, 131}%
\definecolor{structure1}{RGB}{0,120,2}%
\definecolor{main1}{RGB}{0,120,2}%
\definecolor{second1}{RGB}{230,90,7}%
\definecolor{third1}{RGB}{0,160,152}%
%cyan color
\definecolor{structure2}{RGB}{31,186,190}%
\definecolor{main2}{RGB}{59,180,5}%
\definecolor{second2}{RGB}{175,153,8}%
\definecolor{third2}{RGB}{244,105,102}%
%blue color
\definecolor{structure3}{RGB}{60,113,183}
\definecolor{main3}{RGB}{0,166,82}%
\definecolor{second3}{RGB}{255,134,24}%
\definecolor{third3}{RGB}{0,174,247}%
% gray color
\definecolor{structure4}{RGB}{150,150,150}
\definecolor{main4}{RGB}{150,150,150}%
\definecolor{second4}{RGB}{150,150,150}%
\definecolor{third4}{RGB}{150,150,150}%
% black color
\definecolor{structure5}{RGB}{0,0,0}
\definecolor{main5}{RGB}{0,0,0}%
\definecolor{second5}{RGB}{0,0,0}%
\definecolor{third5}{RGB}{0,0,0}%

% corlor definition
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}
%% ======== 备用颜色结束 ========

%% ======== 定义其他颜色 ========
\definecolor{red2}{RGB}{244, 118, 85}
\definecolor{red3}{RGB}{254, 247, 247}
\definecolor{blue2}{RGB}{200, 213, 247}
\definecolor{blue3}{RGB}{252, 253, 255}
\definecolor{pur2}{RGB}{216, 165, 222}

\newcommand{\emb}[2][Magenta]{{\bf\color{#1}\uuline{#2}}}
\definecolor{deepBlue}{RGB}{61,124,222}
\definecolor{azures1}{RGB}{250, 252, 254}
\definecolor{azures2}{RGB}{41, 119, 196}
\definecolor{Magenta}{RGB}{236,0,141}
\definecolor{Mandarine}{RGB}{255,134,24}
\definecolor{Emerald}{RGB}{0, 169, 159}
\definecolor{DeepPink}{RGB}{255, 20, 147}

\definecolor{Blue}{RGB}{113,151,172}
\definecolor{Wine}{RGB}{136,63,75}
\definecolor{Pink}{RGB}{226,209,211}
\definecolor{Deepviolet}{RGB}{77,49,78}
\definecolor{Violet}{RGB}{103,76,120}
\definecolor{Cyan}{RGB}{0,140,210}
\definecolor{Bviolet}{RGB}{93,44,108}
\definecolor{zihong}{RGB}{138,49,103}
%% ======== 其他颜色结束 ========
%%% ========== 颜色处理结束 ==========

%%% ========== 封面信息 ==========
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}

% reference: 
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}
%\newcommand{\question}[1]{{\par\citshape #1}\\[0.2ex]}
%%% ========== 封面信息结束 ==========

\RequirePackage{fancyvrb}
\RequirePackage{hologo}
%%中文结构名字

%%% ========== 章节定理名称定制 ==========
\RequirePackage{zhnumber}
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}
\RequirePackage{titletoc}
\RequirePackage[
  backend=\ELEGANT@bibend,
  citestyle=\ELEGANT@citestyle,
  bibstyle=\ELEGANT@bibstyle]{biblatex}

\newcommand{\bftitle}{%
  \ifdefstring{\ELEGANT@lang}{cn}{\heiti}{\bfseries}%
}
\newcommand{\ittitle}{
  \ifdefstring{\ELEGANT@lang}{cn}{\kaishu}{\itshape}%
}

\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\baselinestretch}{1.3}
  \renewcommand{\contentsname}{目录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  %\renewcommand{\partname}{\color{structurecolor}}
  \renewcommand{\partname}{第\zhnumber{\arabic{part}}部分}
  \newcommand{\pagename}{第~\color{black}{\thepage}\color{structurecolor}~页}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \newcommand{\ebibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  \newcommand\figref[1]{\textbf{图}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \newcommand{\authorname}{\citshape 作者：}
  \newcommand{\institutename}{\citshape 组织：}
  \newcommand{\datename}{\citshape 时间：}
  \newcommand{\versionname}{\citshape 版本：}
  \newcommand{\notename}{注解}
  \renewcommand*{\proofname}{证明}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公设}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例} %
  \newcommand{\instancename}{示例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{习题} % 改练习为习题
  \newcommand{\remarkname}{评注}
  \newcommand{\assumptionname}{假设}
  \newcommand{\conclusionname}{结论}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
  \newcommand{\introductionname}{内容提要}
   \newcommand{\introductionsname}{内容概述}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\historyname}{版本更新历史}
  \newcommand{\beforechap}{第}
  \newcommand{\afterchap}{章}
  \newcommand{\summerize}{概述}
}{\relax}
\newcommand{\cmt}{\noindent\hspace{-0.25em}\textcolor{structurecolor}{\ding{226}} \hspace{0.2em}}
\newcommand{\sol}{\noindent\hspace{-0.12em}\textcolor{structurecolor}{\ding{45}} \hspace{0.2em}}
\newcommand{\solc}{\noindent\hspace{-0.12em}\textcolor{structurecolor}{\ding{45}} \hspace{0.2em} \vspace*{-\baselineskip}}

\ifdefstring{\ELEGANT@lang}{en}{
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
  \renewcommand{\chaptername}{Chapter}
  \renewcommand{\partname}{Part \arabic{part}}
  \newcommand{\pagename}{~\color{black}{\thepage}\color{structurecolor}~}
  \newcommand{\authorname}{\textbf{Author: }}
  \newcommand{\institutename}{\textbf{Institute: }}
  \newcommand{\datename}{\textbf{Date: }}
  \newcommand{\versionname}{\textbf{Version: }}
  \newcommand{\notename}{Note}
  \newcommand{\proofname}{Proof}
  \newcommand{\problemname}{Problem}
  \newcommand{\definitionname}{Definition}
  \newcommand{\theoremname}{Theorem}
  \newcommand{\axiomname}{Axiom}
  \newcommand{\postulatename}{Postulate}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Proposition}
  \newcommand{\corollaryname}{Corollary}
  \newcommand{\examplename}{Example}
  \newcommand{\exercisename}{Exercise}
  \newcommand{\remarkname}{Remark}
  \newcommand{\assumptionname}{Assumption}
  \newcommand{\conclusionname}{Conclusion}
  \newcommand{\solutionname}{Solution}
  \newcommand{\propertyname}{Property}
  \newcommand{\introductionname}{Introduction}
  \renewcommand{\appendixname}{Appendix}
  \newcommand{\ebibname}{Bibliography}
  % \newcommand{\problemsetname}{Exercise}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Updates:}
  \newcommand{\historyname}{Version History}
  \newcommand{\summerize}{Summerize}
}{\relax}
%%% ========== 名称定制结束 ==========

%%% ========== 全局标题样式定制 ==========
\RequirePackage{apptools}
%% ======== 附录标题样式 ========
\ifdefstring{\ELEGANT@lang}{cn}{
  \ifdefstring{\ELEGANT@scheme}{chinese}{
    \newcommand{\xchaptertitle}{第\zhnumber{\arabic{chapter}}章} }{
    \newcommand{\xchaptertitle}{第 \thechapter{} 章}} }{
  \newcommand{\xchaptertitle}{\chaptername~\thechapter~}}
%% ======== 附录标题样式结束 ========

%% ======== 章节标题样式 ========
\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{structurecolor} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[]

\titleformat{\section}[hang]{\bfseries}{
    \Large\bfseries\bftitle{\color{structurecolor}{\normalfont\faGg} ~\thesection}\enspace}{1pt}{%
    \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}
%% ======== 章节标题样式结束 ========
%%% ========== 全局标题样式定制结束 ==========

%%% ========== 全局图片定制 ==========
\RequirePackage{graphicx}
\graphicspath{{./Figure/}{./figure/}{./Figures/}{./figures/}{./Image/}{./image/}{./Images/}{./images/}{./Graphic/}{./graphic/}{./Graphics/}{./graphics/}{./Picture/}{./picture/}{./Pictures/}{./pictures/}}
%% ======== 各章节标题部分 ========
\RequirePackage{tikz}
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit,arrows.meta}

\newcommand{\titlechaptername}{
  \ifdefstring{\ELEGANT@lang}{cn}{%
  \ittitle\color{black} 第\chinese{chapter} 章%
  }{\ittitle\color{black} \chaptername~\arabic{chapter}}
}

\newif\ifusechapterimage
\usechapterimagetrue
\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\ifusechapterimage\renewcommand{\thechapterimage}{#1}\fi}%
\newcommand{\autodot}{{\color{structurecolor}\faModx}}
\def\@makechapterhead#1{%
	{\parindent \z@ \raggedright \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
					\draw[anchor=west] (\Gm@lmargin+3.3cm,-0.3\paperheight) node [line width=2pt,rounded corners=15pt,draw=structurecolor!50,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
					\draw[anchor=west] (\Gm@lmargin+3.9cm,-0.3\paperheight) node {\huge\titlechaptername  {\normalfont\autodot}\color{black}~#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\else
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
					\draw[anchor=west] (\Gm@lmargin+3.3cm,-0.3\paperheight) node [line width=2pt,rounded corners=15pt,draw=structurecolor!50,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
					\draw[anchor=west] (\Gm@lmargin+3.9cm,-0.3\paperheight) node {\huge\ittitle\bfseries\color{black}#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\fi\fi\par\vspace*{230\p@}}
	\thispagestyle{fancy}
	}

\def\@makeschapterhead#1{%
	\begin{tikzpicture}[remember picture,overlay]
		\node at (current page.north west)
		{\begin{tikzpicture}[remember picture,overlay]
				\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
				\draw[anchor=west] (\Gm@lmargin+3.3cm,-0.3\paperheight) node [line width=2pt,rounded corners=15pt,draw=structurecolor!50,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
				\draw[anchor=west] (\Gm@lmargin+3.9cm,-0.3\paperheight) node {\huge\ittitle\color{black}#1\strut};
		\end{tikzpicture}};
	\end{tikzpicture}
	\par\vspace*{230\p@}}
%% ======== 各章节标题部分定制结束 ========

%% ======== PART 页面定制 ========
\RequirePackage{wallpaper}
\RequirePackage[object=vectorian]{pgfornament} 

\newcommand{\lace}{
\begin{center}
\pgfornament[width=0.4\linewidth,color=structurecolor]{88}
\end{center}
}

\newcommand{\@mptof}[2]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{structurecolor!20}{\strut\parbox[c][.7cm]{1.1cm}{\color{second}\Large\bfseries\centering#1}}
	\hspace{4pt} \colorbox{structurecolor!20}{\strut\parbox[c][.7cm]{\linewidth-1.3cm}{\Large\centering\color{structurecolor} \ifdefstring{\ELEGANT@lang}{cn}{第#1部分}{PART #1} * #2}}}%

% unnumbered part in the table of contents
\newcommand{\@myparttocformat}[1]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{structurecolor!20}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}}%


\titlecontents{part}
[-2pt] % Left indentation
{\addvspace{20pt}\bfseries} % Spacing and font options for parts
{}
{}
{}

\newcommand{\thepartimages}{}%
\newcommand{\partimages}[1]{\ifusepartimage\renewcommand{\thepartimages}{#1}\fi}%
% 1. 定义存储文本的宏，默认为空
\newcommand{\thepartabstract}{}
% 2. 定义用户调用的命令，用来更新这个文本
\newcommand{\parttext}[1]{\renewcommand{\thepartabstract}{#1}}

\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >-2\relax
	\refstepcounter{part}%
	\addcontentsline{toc}{part}{
	\texorpdfstring{\protect\@mptof{\arabic{part}}{#1}}
	{\arabic{part}~\partname\ ---\ #1}
}
	\else
	\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	{\ThisCenterWallPaper{1}{\thepartsimage}
		\centering
		\interlinepenalty \@M
		\ifnum \c@secnumdepth >-2\relax
\vskip 2cm \Huge{\bfseries \color{structurecolor} \partname}  \\ \textcolor{structurecolor}{
    \pgfornament[scale=.3]{72}  {\bfseries #2} 
        \pgfornament[scale=.3]{73}\\[-5pt]
        \pgfornament[scale=.5]{85}} \\
		\vskip 80\p@
		\fi
                \begin{minipage}[c]{.95\textwidth}
                    \begin{tcolorbox}[enhanced jigsaw,
                        opacityframe=0.5,opacityback=0.25,opacitybacktitle=0.25,
                        colback=structurecolor!0,colframe=structurecolor,colbacktitle=structurecolor,
                        boxrule=0pt,
                        toprule=1.5pt,
                        bottomrule=1.5pt,
                        arc=0mm,
                        overlay = {%
                            %标题盒子
                            \node[rectangle, %opacity=.3,
                            text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
                            inner sep=1.5mm,fill=structurecolor,
                            anchor=center,
                            font =\bfseries] at ([yshift=.5mm]frame.north)%
                            {\bf \large \summerize};
                        }
                        ]
                        \textcolor{purples}{
                       \normalsize
                       \thepartabstract
                       }
                    \end{tcolorbox}
                 \end{minipage}
				%   \thispagestyle{empty}
    \vfill
    % 在 Part 结束后自动清空文本，防止下一画没有概述时显示旧内容
    \global\let\thepartabstract\@empty
	}%
	\@endpart}
\def\@spart#1{%
	{\centering
		\interlinepenalty \@M
		\normalfont
		\Huge \bfseries #1\par}%
	\@endpart}
\def\@endpart{\vfil\newpage
	\if@twoside
	\if@openright
	\null
	\thispagestyle{empty} %
	\fi
	\fi
	\if@tempswa
	\twocolumn
	\fi}
\newif\ifusepartsimage
\usepartsimagetrue
\newcommand{\thepartsimage}{}%
\newcommand{\partsimage}[1]{\ifusepartsimage\renewcommand{\thepartsimage}{#1}\fi}%
%% ======== PART 页面定制结束 ========
%%% ========== 全局图片定制结束 ==========

%%% ========== 数学环境 ==========
%% ======== 定理类环境 ==========
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[many]{tcolorbox}
\tcbuselibrary{theorems,xparse,listings,breakable}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}

% ------ 定理类盒子样式 ------
\ifdefstring{\ELEGANT@mode}{fancy}{
  \tcbset{
    common/.style={
      fontupper=\citshape,
      lower separated=false,
      % before upper={\setlength{\parindent}{\normalparindent}},
      coltitle=white,
      colback=gray!5,
      arc=1mm,
      boxrule=0.5pt,
      fonttitle=\bfseries,
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={
        yshift=-0.11in,
        xshift=0.15in},
      boxed title style={
        boxrule=0pt,
        colframe=white,
        arc=0pt,
        outer arc=0pt},
      separator sign={.},},
          % 定义样式
    defstyle/.style={
      common,
      coltitle=white, %定义标题颜色被使用者改动
      colframe=main,  
      colback=main!5,
      colbacktitle=main, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{main}{$\clubsuit$}};}},
         % 定理样式, 颜色被使用者改动, 原来是 red2, red3
    thmstyle/.style={
      common,
      colframe=structurecolor!90!black,  
      colback=structurecolor!5,
      colbacktitle=structurecolor!95!black, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{structurecolor}{$\heartsuit$}};}},
         % 公理样式
      axiostyle/.style={
          common,
          colframe=second,  
          colback=second!5,
          colbacktitle=second, 
          overlay unbroken and last={
              \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                  \textcolor{second}{$\heartsuit$}};}},
        % 公设样式
       poststyle/.style={
           common,
             coltitle=black,
           colframe=blue2,  
           colback=blue3,
           colbacktitle=blue2, 
           overlay unbroken and last={
               \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                   \textcolor{structurecolor}{$\heartsuit$}};}},
        % 引理样式
       lamstyle/.style={
    common,
    coltitle=white, %引理标题颜色被使用者改动, 原为 pur2
    colframe=structurecolor,  
    colback=structurecolor!4,
    colbacktitle=structurecolor, 
    overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
            \textcolor{structurecolor}{$\heartsuit$}};}},
        % 推论样式
   corostyle/.style={
       common,
       coltitle=white, %推论标题颜色被使用者改动, 原为 pink
       colframe=structurecolor,  
       colback=structurecolor!4,
       colbacktitle=structurecolor, 
       overlay unbroken and last={
           \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
               \textcolor{structurecolor}{$\heartsuit$}};}},
        % 命题样式
    propstyle/.style={
      common,
      colframe=third,  
      colback=third!5,
      colbacktitle=third, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{third}{$\spadesuit$}};}},
    }
  % \newtcbtheorem[auto counter,number within=chapter]{definition}{\definitionname}{defstyle}{def}
% ------ 定理类盒子样式结束 ------

% ------ 定理类盒子编号 ------
  % 盒子取消了标签参数.
  % 定义盒子
  % --- 定义 (Definition) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{definition}{ o }{
    common, defstyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\definitionname~\thetcbcounter\ (#1)}}
      {title={\definitionname~\thetcbcounter}}
  }

  % --- 定理 (Theorem) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{theorem}{ o }{
    common, thmstyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\theoremname~\thetcbcounter\ (#1)}}
      {title={\theoremname~\thetcbcounter}}
  }

  % --- 公设 (Postulate) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{postulate}{ o }{
    common, poststyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\postulatename~\thetcbcounter\ (#1)}}
      {title={\postulatename~\thetcbcounter}}
  }

  % --- 公理 (Axiom) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{axiom}{ o }{
    common, axiostyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\axiomname~\thetcbcounter\ (#1)}}
      {title={\axiomname~\thetcbcounter}}
  }

  % --- 推论 (Corollary) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{corollary}{ o }{
    common, corostyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\corollaryname~\thetcbcounter\ (#1)}}
      {title={\corollaryname~\thetcbcounter}}
  }

  % --- 引理 (Lemma) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{lemma}{ o }{
    common, lamstyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\lemmaname~\thetcbcounter\ (#1)}}
      {title={\lemmaname~\thetcbcounter}}
  }

  % --- 命题 (Proposition) ---
  \DeclareTColorBox[auto counter,number within=\ELEGANT@thmcnt]{proposition}{ o }{
    common, propstyle,
    code={\def\@currentlabel{\thetcbcounter}},
    IfValueTF={#1}
      {title={\propositionname~\thetcbcounter\ (#1)}}
      {title={\propositionname~\thetcbcounter}}
  }
}{\relax}

\ifdefstring{\ELEGANT@mode}{simple}{
  \let\openbox\relax
  \RequirePackage{amsthm}
  \let\proof\relax
  % \let\proofname\relax
  \let\endproof\relax
% ------ 定理类盒子编号结束 ------

% ------ 定理类环境定义 ------
  \newtheoremstyle{defstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{main}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{thmstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{second}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{prostyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{third}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

  \theoremstyle{defstyle} % definition style
  \newtheorem{definition}{\definitionname}[\ELEGANT@thmcnt]

  \theoremstyle{thmstyle} %theorem style
  \newtheorem{theorem}{\theoremname}[\ELEGANT@thmcnt]
  \newtheorem{lemma}{\lemmaname}[\ELEGANT@thmcnt]
  \newtheorem{corollary}{\corollaryname}[\ELEGANT@thmcnt]
  \newtheorem{postulate}{\postulatename}[\ELEGANT@thmcnt]
  \newtheorem{axiom}{\axiomname}[\ELEGANT@thmcnt]

  \theoremstyle{prostyle} % proposition style
  \newtheorem{proposition}{\propositionname}[\ELEGANT@thmcnt]
}{\relax}
% ------ 定理类环境定义结束 ------

% ------ 证明环境 ------
\newcommand{\qedsquare}{%
\ifdefstring{\ELEGANT@font}{cm}{%
  $\Box$%
  }{\relax}%
\ifdefstring{\ELEGANT@font}{termes}{%
  $\char"25A1$%
  }{\relax}%
\ifdefstring{\ELEGANT@font}{stix2}{%
  $\char"25A1$%
  }{\relax}%
}

\newenvironment{proof}{
\showqedtrue\par\noindent\textbf{\color{structurecolor}\proofname\hspace{1em}}
  \color{black!90}\cfs}{
   \ifshowqed\hfill\qedsquare\fi\quad
  \par}
% ------ 证明环境结束 ------

% ------ 解题环境 ------
\newcommand{\qedhere}{\tag*{\qedsquare}\global\showqedfalse}

\newif\ifshowqed
\showqedtrue

\newenvironment{solution}{\showqedtrue\par\noindent\textbf{\color{main}\solutionname}\hspace{1em} \citshape}{\ifshowqed\hfill\qedsquare\fi\par}
% ------ 解题环境结束 ------
%% ======== 定理类环境结束 ========

% main（green-def): example exercise problem solution
% second（orange-thm）: proof note remark  
% third（blue-prop):  assumptions property conclusion custom

%% Example with counter
%\newcounter{exam}[chapter]
%\setcounter{exam}{0}
%\renewcommand{\theexam}{\thechapter.\arabic{exam}}
%\newenvironment{example}[1][]{
%  \refstepcounter{exam}
%  \par\noindent\textbf{\color{main}{\examplename}  #1 }\rmfamily}{
%  \par\ignorespacesafterend}

%% Exercise with counter
% 习题环境被使用者大改动。去掉了计数器，并且重写了标题样式
% \newcounter{exer}[chapter]
% \setcounter{exer}{0}
% \renewcommand{\theexer}{\thechapter.\arabic{exer}}
%\newenvironment{exercise}[1][]{
  %\refstepcounter{exer}
%  \par\vspace{0.5em}\noindent\makebox[-3pt][r]{
%   \scriptsize\color{red!90}\HandPencilLeft\quad}
%   \textbf{\large{\exercisename}\vspace{0.5em} \thesection #1 }\rmfamily}{
%   \par\ignorespacesafterend}

%% ======== 习题与注释类环境 ========
% ------ 每节习题环境 ------
\newenvironment{exercise}[1][]{
  \par\vspace{0.5em}
  \noindent
  \begin{center}
    \textcolor{structurecolor}{
    % --- 左侧横线 ---
    %\leaders\hrule height \dimexpr0.55ex+0.3pt\relax depth \dimexpr-0.55ex+0.3pt\relax \hfill\quad
     \large \bfseries
     \adftripleflourishleft \quad {\normalfont\scriptsize\color{red!90}\HandPencilLeft\,\,}
     习题~\thesection~ \quad
    \adftripleflourishright
    % --- 右侧横线 ---
    %\leaders\hrule height \dimexpr0.55ex+0.3pt\relax depth \dimexpr-0.55ex+0.3pt\relax \hfill
    }
  \end{center}
  \rmfamily
}{\par\ignorespacesafterend}
% ------ 每节习题环境结束 ------

%% Problem with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{main}{\problemname} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend}

% ------ 注记环境 ------
\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend\quad}
    \textbf{\color{structurecolor}\notename}\hspace{1em} \citshape}{\par}
% ------ 注记环境结束 ------ 

\newenvironment{remark}{\noindent\textbf{\color{structurecolor}\remarkname}\hspace{1em}}{\par}
%\newenvironment{assumption}{\par\noindent\textbf{\color{third}\assumptionname} \citshape}{\par}
%\newenvironment{conclusion}{\par\noindent\textbf{\color{third}\conclusionname} \citshape}{\par}
%\newenvironment{property}{\par\noindent\textbf{\color{third}\propertyname} \citshape}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third} #1} \citshape}{\par}

% ------ 介绍环境 ------
\tcbset{
  introductionsty/.style={
    enhanced,
    breakable,
    colback=structurecolor!10,
    colframe=structurecolor,
    fonttitle=\bfseries,
    colbacktitle=structurecolor,
    fontupper=\citshape,
    attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
    boxrule=0pt,
    toprule=0.5pt,
    bottomrule=0.5pt,
    top=8pt,
    before skip=8pt,
    sharp corners
  },
}

\newenvironment{introduction}[1][\introductionname]{
  \begin{tcolorbox}[introductionsty,title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}
% ------ 介绍环境结束 ------

% ------ 介绍环境 (s) ------
\tcbset{
    alphasty/.style={
        enhanced,
        breakable,
        colback=azures1,
        colframe=azures2,
        boxrule=0pt,
        top=8pt,
        before skip=12pt,
        sharp corners,
        arc=0mm,
        drop lifted shadow={color=black!20!white,opacity=.3,shadow xshift=0.1cm},%盒子阴影
        overlay = {%
            %标题盒子
            \node[rectangle, %opacity=.3,
            text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
            inner sep=1.5mm,fill=azures2,
            anchor=west,
            font=\bfseries] at ([xshift=.45\textwidth,yshift=.5mm]frame.north west)%
            {\bf \introductionsname};
        },
    }
}

\newenvironment{introductions}[1][\introductionsname]{\smallskip
    \begin{tcolorbox}[alphasty]
        \begin{multicols}{2}
            \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
            \end{itemize}
        \end{multicols}
    \end{tcolorbox}\smallskip}
% ------ 介绍环境 (s) 结束 ------

% ------ 评析环境(经使用者改动，去除了标题栏) ------
\tikzset{
    wnodeTheorem/.style={%
        rectangle,top color=lightergray, bottom color=lightergray,
        inner sep=1mm,anchor=west,font=\bf\rmfamily},
    % wnodeminimum/.style={%
        % 	rectangle,  top color=white, bottom color=white,
        % 	text=Emerald,inner sep=1mm,anchor=west,font=\bf\rmfamily}
}

\newtcolorbox{anybox}[1][]{%
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
    top=2mm,fontupper=\normalsize,%step and label={tcbremark}{#3},
    overlay unbroken  = {
        %垂直条%更改有效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题：定义%更改有效
        %\node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        %{\textbf{\color{Mandarine} #2}};
        % \draw[color=Mandarine,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    overlay first  = {
        %垂直线段%跨页时生效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题:定义 %跨页时生效
        %\node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        %{\textbf{\color{Mandarine} #2}};
        % \draw[color=Mandarine,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    % 保持边缘的变化
    overlay last    = {
        %垂直线段%跨页时生效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
    },
    #1
}
% anymark 的参数由 0{} +m 改成 om。前者会导致原因不详的缩进和空行。
\NewDocumentEnvironment{anymark}{om}{%
  \smallskip
  \begin{anybox}
    \IfNoValueTF{#1}{}{%
      {\textbf{\color{structurecolor} #1}}\hspace{0.5em}%
    }\ignorespaces #2
}{%
  \end{anybox}%
}
% ------ 评析环境结束 ------

% ------ 例环境 (本环境的编号方式被使用者改为 section) ------
% Example with counter，此处被使用者改动，例题按 section 编号
\newcounter{exam}[section]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thesection.\arabic{exam}}

\newtcolorbox{wwexample}[3][]{%
    arc=0mm,
    breakable,drop fuzzy shadow=black!20!white,
    enhanced,
    colback=lightergray,
    boxrule=0pt,
    top=8mm, %分隔垂直-开始文本
    % enlarge top by=\baselineskip/2+1mm,
    % enlarge top at break by=0mm,pad at break=2mm,
    fontupper=\normalsize,
    %step and label={exam}{#3},%标签
    before upper=\refstepcounter{exam},% 此处被使用者改动，先递增并允许引用
    overlay unbroken = {%
        %垂直线段%更改有效
        %\draw[color=gray!5,line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %底部装饰矩形%更改有效
        \fill[fill=main] (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
        % 图像框示例
        %\node[rectangle,
        %         text=black, ,fill=ALamarillo!20,
        %         inner sep=1mm,anchor=west,font=\small\bf\sffamily] at ([xshift=-10.3pt,yshift=-3.2mm]frame.north west)%
        %{ };
        %框编号和描述%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=main,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}例 \theexam. ~#2};%标题
    },
    % fin overlay
    overlay first  = {%
        %标题框编号和描述%跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=main,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf \color{white} 例 \theexam.~#2};
    },
    % overlay
    %边缘改变%跨页时生效
    overlay middle={\draw[color=lightergray,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
    },
    overlay last={\draw[color=lightergray,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
        %底部装饰矩形%跨页时生效
        \fill[fill=main] (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm); }
    #1}
%
\NewDocumentEnvironment{example}{O{} O{} O{}}{\smallskip\begin{wwexample}{#1}{#2}%
        #3}{\end{wwexample} }
% ------例环境结束 ------

% ------假设环境 ------
\newcounter{assumption}
\setcounter{assumption}{1}
\renewcommand{\theassumption}{\arabic{assumption}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtcolorbox{wwproposition}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=second,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white} 假设~\theassumption. ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=second]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=second,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  假设~\theassumption. #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=second]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{assumption}{O{} O{} O{}}{\smallskip\begin{wwproposition}{#1}{#2}#3}{\end{wwproposition} }
% ------ 假设环境结束 ------

% ------ 性质环境 ------
\newcounter{property}
\setcounter{property}{1}
\renewcommand{\theproperty}{\arabic{property}}

\newtcolorbox{wwproposition3}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=structurecolor,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white} 性质~\theproperty. ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  性质~\theproperty. #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{property}{O{} O{} O{}}{\smallskip\begin{wwproposition3}{#1}{#2}#3}{\end{wwproposition3} }
% ------ 性质环境结束 ------

% ------ 结论环境 ------
\newtcolorbox{keypointbox}[2][]{%
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
    top=6mm,fontupper=\normalsize,%step and label={tcbremark}{#3},
    overlay unbroken  = {
        %垂直条%更改有效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题：定义%更改有效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{Mandarine} 性质~#2}};
        % \draw[color=Mandarine,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    overlay first  = {
        %垂直线段%跨页时生效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题:定义 %跨页时生效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{Mandarine} 性质~#2}};
        % \draw[color=Mandarine,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    % 保持边缘的变化
    overlay last    = {
        %垂直线段%跨页时生效
        \draw[color=Mandarine,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
    }
    #1
}
%
\NewDocumentEnvironment{conclusion}{O{} O{} O{}}{\smallskip\begin{keypointbox}{#1}{#2} #3}{\end{keypointbox}}
% ------ 结论环境结束 ------

% ------ 章末习题环境 ------
\RequirePackage{mdframed}
\RequirePackage{adforn}

\newenvironment{problemset}[1][\texorpdfstring{\exercisename\zhnumber{\arabic{chapter}}}{\exercisename\zhnumber{\arabic{chapter}}}]{
  \vspace*{10pt}
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{~\exercisename\zhnumber{\arabic{chapter}}}{\exercisename\zhnumber{\arabic{chapter}}}}
    % \markboth{#1}{\rightmark}
    \markright{#1}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
  \end{center}
  }{\par\ignorespacesafterend}

\def\relsec{\endgroup start}
\def\endrelsec{end\begingroup\def \@currenvir {relsec}}

\ifdefstring{\ELEGANT@result}{noanswer}{
  \AtBeginDocument{
  \excludecomment{solution}
  \excludecomment{proof}
  \excludecomment{inline}
  }
}{\relax}
% ------ 章末习题环境结束 ------
%% ======== 习题与注释类环境结束 ========
%%% ========== 数学环境结束 ==========

%%% ========== 页眉页脚 ==========
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome}
\RequirePackage{xhfill}
\fancyhf{}

\fancyfoot[c]{\color{structurecolor} \faGg \pagename \faGg}

\if@twoside
\fancyhead[EL]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyhead[ER]{\color{structurecolor}\cnormal\rightmark}
\fancyhead[OR]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyhead[OL]{\color{structurecolor}\cnormal\rightmark}
\fancyfoot[EL]{\color{red}{\faLink} }
\fancyfoot[ER]{\color{red}{\faLink} }
\fancyfoot[OR]{\color{structurecolor}{\faUnlink}}
\fancyfoot[OL]{\color{structurecolor}{\faUnlink}}
\else
\fancyhead[R]{\color{structurecolor}\cnormal\rightmark}
\fancyhead[L]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyfoot[L]{\color{red}{\faLink}}
\fancyfoot[R]{\color{cyan}{\faUnlink}}
\fi
\renewcommand{\headrule}{\color{second}\hrule width\textwidth}
\pagestyle{fancy}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}
%%% ========== 页眉页脚结束 ==========

%%% ========== 封面页设计 ==========
\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \pagecolor{white}
  \newgeometry{margin = 0in}
  \parindent=0pt
  \ifdefstring{\ELEGANT@device}{normal}{
    \ifcsname @cover\endcsname
      \includegraphics[width=\linewidth]{\@cover}
    \else
      \includegraphics[width=\linewidth]{example-image}
    \fi
  }{\relax}%
  \ifdefstring{\ELEGANT@device}{pad}{
    \ifcsname @cover\endcsname
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
    \else
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
    \fi
  }{\relax}%
  \setlength{\fboxsep}{0pt}%
  \par\nointerlineskip%
  \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \vskip-2ex
  \hspace{2em}
  \parbox{0.8\textwidth}{
    \bfseries\Huge 
      \ifcsname @title\endcsname \@title \fi
    \par}
  \vfill
  \vspace{-1.0cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{darkgray}\bfseries\Large
      \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
    \color{gray}\normalsize
    {\renewcommand{\arraystretch}{0.618}
    \begin{tabular}{l}
      % \ifcsname @author\endcsname \authorname \@author\\\fi
      \ifx\@author\empty\else\authorname\cnormal\@author\\ \fi
      \ifcsname @institute\endcsname \institutename \cnormal\@institute\\ \fi
      % \ifcsname @date\endcsname  \@date\\\fi
      \ifx\@date\empty\else\datename\cnormal\@date \\ \fi
      \ifcsname @version\endcsname \cnormal\versionname\@version\\ \fi
      \ifcsname @bioinfo\endcsname \cnormal\@bioinfo\\ \fi
    \end{tabular}}
  \end{minipage}
  \begin{minipage}[c]{0.27\linewidth}
  \begin{tikzpicture}[remember picture,overlay]
    \begin{pgfonlayer}{background}
      \node[opacity=0.8,
            anchor=south east,
            outer sep=0pt,
            inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {
              \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
    \end{pgfonlayer}
  \end{tikzpicture}
  \end{minipage}
  \vfill
  \begin{center}
    \setstretch{1.3}
    \parbox[t]{0.7\textwidth}{\centering \citshape 
      \ifcsname @extrainfo\endcsname\@extrainfo\fi}
  \end{center}
  \vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}
\globalpagecolor}
%%% ========== 封面页设计结束 ==========

%%% ========== 自定义闲置盒子 ==========
\RequirePackage{varwidth}

\DeclareTColorBox{simplesquarebox}{ o m O{.5} O{} }% 
{empty, left=2mm, right=2mm, top=-1mm, attach boxed title to top left={xshift=1.2zw}, boxed title style={empty,left=-2mm,right=-2mm}, colframe=black, coltitle=black, coltext=black, breakable, 
    underlay unbroken={\draw[black,line width=#3pt](title.east) -- (title.east-|frame.east) -- (frame.south east) -- (frame.south west) -- (title.west-|frame.west) -- (title.west); },
    underlay first={\draw[black,line width=#3pt](title.east) -- (title.east-|frame.east) -- (frame.south east) ;
        \draw[black,line width=#3pt] (frame.south west) -- (title.west-|frame.west) -- (title.west); },
    underlay middle={\draw[black,line width=#3pt](frame.north east) -- (frame.south east) ;
        \draw[black,line width=#3pt](frame.south west) -- (frame.north west) ;},
    underlay last={\draw[black,line width=#3pt](frame.north east) -- (frame.south east) -- (frame.south west) -- (frame.north west) ;},
    fonttitle=\rmfamily, IfValueTF={#1}{title=【#2】〈#1〉}{title=【#2】},#4}

% ------ 盒子 ascolorbox1 ------
\DeclareTColorBox{ascolorbox1}{ o m O{}}%
{enhanced,colback=faint, skin=enhancedlast jigsaw,breakable, attach boxed title to top left={xshift=-4mm,yshift=-0.5mm}, fonttitle=\bfseries\rmfamily, varwidth boxed title=0.85\linewidth, colbacktitle=Violet,colframe=Violet,
    boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
    underlay boxed title={%
        \fill[Violet] (title.north west) -- (title.north east) -- +(\tcboxedtitleheight-1mm,-\tcboxedtitleheight+1mm)
        -- ([xshift=4mm,yshift=0.5mm]frame.north east) -- +(0mm,-1mm) -- (title.south west) -- cycle;
        \fill[Deepviolet] ([yshift=-0.5mm]frame.north west)
        -- +(-0.4,0) -- +(0,-0.3) -- cycle;
        \fill[Deepviolet] ([yshift=-0.5mm]frame.north east)
        -- +(0,-0.3) -- +(0.4,0) -- cycle;  },
    IfValueTF={#1}{title=#2〈#1〉}{title=#2},#3}

% ------ 盒子 ascolorbox2 ------
\DeclareTColorBox{ascolorbox2}{ O{} m O{Bviolet} O{} }%
{enhanced,colback=faint, colframe=white, coltext=#3, attach boxed title to top left={xshift=1mm,yshift=0mm}, fonttitle=\bfseries\rmfamily,varwidth boxed title=0.85\linewidth, colbacktitle=Bviolet, breakable,
    enlarge top by=3mm, enlarge bottom by=3mm, 
    boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
    underlay boxed title={\fill[#3] (title.north west) 
        -- (title.north east) --node[right=3mm]{{#1}}+(0,-\tcboxedtitleheight+.5mm)
        -- ([xshift=-1mm,yshift=.5mm]frame.north east) 
        -- +(0mm,-.5mm) -- (title.south west) -- cycle;
        \draw[#3] ([yshift=-.5mm]title.south west) --
        ([xshift=-1mm,yshift=-.5mm]frame.north east);},
    underlay unbroken={\draw[#3, ultra thick] ([xshift=1mm,yshift=-.3mm]frame.south west)
        -- ([xshift=-1mm,yshift=-.3mm]frame.south east);
        \draw[#3] ([xshift=1mm,yshift=.5mm]frame.south west) 
        -- ([xshift=-1mm,yshift=.5mm]frame.south east);
        \draw[#3,thick,Bviolet,dotted] ([yshift=\tcboxedtitleheight+1mm]frame.north west) 
        -- ([yshift=\tcboxedtitleheight+1mm]frame.north east) 
        -- ([yshift=-2mm]frame.south east) -- ([yshift=-2mm]frame.south west) -- cycle;},
    underlay first={\draw[#3,thick,Bviolet,dotted] ([yshift=\tcboxedtitleheight+1mm]frame.north west) 
        -- ([yshift=\tcboxedtitleheight+1mm]frame.north east) 
        -- (frame.south east);
        \draw[#3,thick,zihong,dotted] (frame.south west)
        -- ([yshift=\tcboxedtitleheight+1mm]frame.north west);},
    underlay middle={\draw[#3,thick,Bviolet,dotted] (frame.north east) -- (frame.south east);
        \draw[#3,thick,Bviolet,dotted] (frame.south west) -- (frame.north west);},
    underlay last={\draw[#3,thick,Bviolet,dotted] (frame.north east) -- ([yshift=-2mm]frame.south east) 
        -- ([yshift=-2mm]frame.south west) -- (frame.north west);
        \draw[#3, zihong,ultra thick] ([xshift=1mm,yshift=-.3mm]frame.south west)
        -- ([xshift=-1mm,yshift=-.3mm]frame.south east);
        \draw[#3] ([xshift=1mm,yshift=.5mm]frame.south west) 
        -- ([xshift=-1mm,yshift=.5mm]frame.south east);},
    title={#2},#4
    }
%%% ========== 自定义闲置盒子结束 ==========

%%% ============ 目录部分 ============
%% ======== 目录命令重定义 ========
\renewcommand\tableofcontents{%
  \hypersetup{linktoc=all, linkcolor=black}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \ifdefstring{\ELEGANT@toc}{twocol}{
      \setlength{\columnsep}{2em}
      \begin{multicols}{2}%
        \@starttoc{toc}
      \end{multicols}}{
      \@starttoc{toc}}
    \if@restonecol\twocolumn\fi
    \hypersetup{linkcolor=purples}}

% ------ 双面排版 (twoside) 时, 确保每章从奇数页开始 ------
\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{empty}%
\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% ======== 目录全局文本控制 ========
% https://tex.stackexchange.com/questions/56839/chaptername-is-used-even-for-appendix-chapters-in-toc
\usepackage{calc}
\usepackage[titles]{tocloft}
% ------ 章标题和附录标题文本和对齐控制 ------
\ifdefstring{\ELEGANT@lang}{cn}{
  \renewcommand{\cftchappresnum}{\beforechap\space}
  \renewcommand{\cftchapaftersnum}{\space\afterchap}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{附录~999}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
    }%
  }
}{
  \renewcommand{\cftchappresnum}{\chaptername\space}
  \renewcommand{\cftchapaftersnum}{\space}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
      \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
    }%
  }
}
% -------------------
% restore the tt default family to lmodern tt family
\renewcommand\ttdefault{lmtt}

%% ======== 各级标题的目录格式 ========

% ------ Part 目录格式 ------
\titlecontents{part}
[-2pt] % Left indentation
{\addvspace{10pt}\bfseries} % Spacing and font options for parts
{}
{}
{}
[\addvspace{-12pt}]

\newcommand{\tocchaptername}{%
  \ifdefstring{\ELEGANT@lang}{cn}{%
      第\zhnumber{\thecontentslabel} 章%
  }{\chaptername~\thecontentslabel}%
}

\ifdefstring{\ELEGANT@lang}{cn}{
% ------ Chapter 目录格式 ------
\titlecontents{chapter}
[16.5mm] % 左缩进
{\addvspace{1em}\bftitle\hspace{-1pt}} %
{\contentslabel[\bftitle \tocchaptername]{16mm}}
{\hspace{-16mm}} % 无编号时的倒缩进
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\titlerule*[0.5pc]{$.$}\contentspage}

% ------ Section 目录格式 ------
\titlecontents{section}
[16.9mm] % 左缩进
{\hspace{-2pt}} %
{\contentslabel[\bftitle \thecontentslabel]{9.8mm}}
{\ittitle\hspace{-11.8mm}}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\titlerule*[0.5pc]{$.$}\contentspage}

% ------ Subsection 目录格式 ------
\titlecontents{subsection}
[20.5mm] % 左缩进
{\hspace{-2pt} \ittitle} % % 改为小号楷体
{\contentslabel[\bftitle \thecontentslabel]{10mm}}
{\small}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\titlerule*[0.5pc]{$.$}\normalsize\contentspage}
}{
% ------ Chapter ------
\titlecontents{chapter}
[23mm] % 左缩进
{\addvspace{1em}\bftitle\hspace{-1pt}} 
{\contentslabel[\bftitle \tocchaptername]{22.5mm}} %
{\hspace{-22.5mm}} % 3. 无编号倒缩进
{\bfseries\titlerule*[0.5pc]{$.$}\contentspage}

% ------ Section ------
\titlecontents{section}
[13.5mm] % 1. 左缩进：使标题起始位置与 Chapter 的 'r' 对齐
{\hspace{-2pt}} 
{\contentslabel[\bftitle \thecontentslabel]{8.5mm}} % 2. 标签宽度：13.5 - 8.5 = 5mm，对齐 Chapter 的 'a'
{\hspace{-8.5mm}} % 3. 无编号倒缩进：与标签宽度一致，确保左侧对齐
{\titlerule*[0.5pc]{$.$}\contentspage}

% ------ Subsection ------
\titlecontents{subsection}
[19.8mm] % 整体向左拉（原为 20.5mm）
{\hspace{-2pt} \ittitle} 
{\contentslabel[\bftitle \thecontentslabel]{9mm}} % 标签宽度
{\hspace{-9mm}} % 无编号倒缩进
{\titlerule*[0.5pc]{$.$}\normalsize\normalfont\contentspage}
}
%% ======== 目录格式制作完成 ========
%%% ========== 目录部分结束 ==========



