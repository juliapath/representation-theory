% Copyright (c) Lars Niedorf, Jan Path 2018
%
% This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
% International License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative
% Commons, PO Box 1866, Mountain View, CA 94042, USA.

	\ProvidesClass{template}[2018/02/02, Lars Niedorf]
	\LoadClass[12pt,a4paper,twoside=semi]{scrbook}
	\PassOptionsToClass{\CurrentOption}{scrbook}

% General Setup
%--------------------------------------------
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[english]{babel}
	\RequirePackage{lmodern}
	\usepackage[pdfpagelabels=true,unicode]{hyperref}
	\usepackage{makeidx}
	\makeindex

% Layout
%--------------------------------------------
	\RequirePackage[protrusion=true,expansion=true]{microtype}
	\RequirePackage{ellipsis}
	\RequirePackage{enumitem}
	\setlist[enumerate,1]{label=\textup{(\arabic*)}}

	\setlength{\parindent}{0em}
	\setlength{\parskip}{\medskipamount}
	\usepackage{scrlayer-scrpage}
	\clearpairofpagestyles
	\chead{\headmark}
	\automark[chapter]{chapter}
	\cfoot*{\pagemark}

% Math Packages
%--------------------------------------------
	\RequirePackage{amsmath,amssymb,amsmath,amsthm,mathtools,stmaryrd,tikz-cd}
	\SetSymbolFont{stmry}{bold}{U}{stmry}{m}{n}

% Mathematical Environments
%--------------------------------------------
	\swapnumbers
	\newtheorem{theorem}{Theorem}[section]
	\newtheorem{lemma}[theorem]{Lemma}
	\newtheorem{proposition}[theorem]{Proposition}
	\newtheorem{corollary}[theorem]{Corollary}

	\newtheorem*{theorem*}{Theorem}
	\newtheorem*{lemma*}{Lemma}
	\newtheorem*{corollary*}{Corollary}

	\theoremstyle{definition}
	\newtheorem*{definition}{Definition}
	\newtheorem*{remark}{Remark}
	\newtheorem*{example}{Example}

	% Formatting of proof environment
	\makeatletter
	\renewenvironment{proof}[1][\proofname]
	{\par\pushQED{\qed}\normalfont\topsep6\p@\@plus6\p@\relax\trivlist\item[\hskip\labelsep
	{\textbf{#1}}\@addpunct{\textbf{.}}]\ignorespaces}
	{\popQED\endtrivlist\@endpefalse}
	\makeatother

    \renewcommand\thechapter{\Roman{chapter}}
    \renewcommand\thesection{\arabic{section}}
	\renewcommand{\thetheorem}{\arabic{section}.\arabic{theorem}}

	\makeatletter
	\g@addto@macro\bfseries{\boldmath}              % Formulas are set bold when using \bf-command
	\def\th@plain{\thm@notefont{}\itshape}          % Optional title in theorems is set bold
	\def\th@definition{\thm@notefont{}\normalfont}  % Optional title in theorems is set bold
	\g@addto@macro{\@afterheading}{\vspace{-\parskip}} % No additional skip after heading
	\makeatother

% Symbols, Commands and Shortcuts
%--------------------------------------------
    \newcommand{\qq}[1]{\ensuremath\quad\text{#1}\quad}

	\newcommand{\N}{\mathbb{N}}
	\newcommand{\Z}{\mathbb{Z}}
	\newcommand{\Q}{\mathbb{Q}}

	\DeclareMathOperator{\id}{id}
	\DeclareMathOperator{\Mat}{Mat}
	\DeclareMathOperator{\Char}{char}
	\DeclareMathOperator{\Hom}{Hom}
	\DeclareMathOperator{\End}{End}
	\DeclareMathOperator{\Aut}{Aut}

	\DeclareMathOperator{\add}{add}

	\makeatletter
		\def\moverlay{\mathpalette\mov@rlay}
		\def\mov@rlay#1#2{\leavevmode\vtop{%
		\baselineskip\z@skip \lineskiplimit-\maxdimen
		\ialign{\hfil$\m@th#1##$\hfil\cr#2\crcr}}}
		\newcommand{\charfusion}[3][\mathord]{
		#1{\ifx#1\mathop\vphantom{#2}\fi
		\mathpalette\mov@rlay{#2\cr#3}
		}
		\ifx#1\mathop\expandafter\displaylimits\fi}
	\makeatother

	\newcommand{\cupdot}{\charfusion[\mathbin]{\cup}{\cdot}}
	\newcommand{\bigcupdot}{\charfusion[\mathop]{\bigcup}{\cdot}}

	\DeclareMathOperator{\Rad}{Rad}
	\DeclareMathOperator{\Id}{Id}
	\DeclareMathOperator{\ord}{ord}

	\newcommand{\op}{\mathrm{op}}
	\DeclareMathOperator{\im}{im}
	\newcommand{\pr}{\mathrm{pr}}

    \makeatletter
    \DeclareRobustCommand{\triangleleftneq}{\mathrel{\text{$\m@th\proper@ideal$}}}
    \newcommand{\proper@ideal}{%
    \ooalign{$\lneq$\cr\raise.22ex\hbox{$\lhd$}\cr}%
    }
    \makeatother

	\DeclareMathOperator{\Mod}{Mod}
	\DeclareMathOperator{\Soc}{Soc}
	\DeclareMathOperator{\Ob}{Ob}
	\DeclareMathOperator{\coker}{coker}
	\DeclareMathOperator{\PHom}{PHom}
	\let\mod\relax
    \DeclareMathOperator{\mod}{mod}
	\newcommand{\umod}{\underline{\mod}}

	\DeclareMathOperator{\Ind}{Ind}
	\let\Vec\undefined
	\DeclareMathOperator{\Vec}{Vec}
	\DeclareMathOperator{\Top}{Top}
    \renewcommand{\vec}[2]{\binom{#1}{#2}}
	\newcommand{\factor}[2]{#1/#2}
    \newcommand{\surrj}{\twoheadrightarrow}
    \newcommand{\injection}{\hookrightarrow}
    \newcommand{\surjection}{\twoheadrightarrow}
    \newcommand{\isomorphic}{\cong}
    \newcommand{\isomorphismarrow}{\xrightarrow{\sim}}

	\DeclareMathOperator{\Ext}{Ext}
	\DeclareMathOperator{\Stable}{\underline{\mod}}
	\newcommand{\Simples}[1]{\mathcal S(#1)}
	\newcommand{\J}[1]{J(#1)}

	\newcommand{\disjointunion}{\cupdot}
	\newcommand{\Center}[1]{C(#1)}
	\newcommand{\Proj}{\mathcal{P}}
	\newcommand{\Projectives}{\mathcal{P}}
	\newcommand{\pf}{\mathrm{pf}}
	\newcommand{\modpf}[1]{(\mod #1)_\pf}
	\DeclareMathOperator{\StableHom}{\underline{\Hom}}
	\DeclareMathOperator{\StableEnd}{\underline{\End}}
	\newcommand{\Indpf}[1]{(\mathrm{Ind}(#1))_{\mathrm{pf}}}
	\newcommand{\generator}[1]{\left\langle #1 \right\rangle}
	
	\newcommand{\declaremap}[4]{\left\{ \begin{matrix} #1 & \to & #2 \\ #3 & \mapsto & #4 \end{matrix} \right.}

    \makeatletter
        \newcommand*{\triplerightarrow}[1]{\mathrel{
        \settowidth{\@tempdima}{$\scriptstyle#1$}
        \mathop{\vcenter{
        \offinterlineskip\ialign{\hbox to\dimexpr\@tempdima+1em{##}\cr
        \rightarrowfill\cr\noalign{\kern.5ex}
        \rightarrowfill\cr\noalign{\kern.5ex}
        \rightarrowfill\cr}}}\limits^{\!#1}}}
    \makeatother

    \newcommand{\KroneckerQuiver}{\triplerightarrow{}}

    \newcommand{\length}[1]{\ell(#1)}
    \newcommand\restr[2]{{#1}|_{#2}}
    
% Bibliography
%--------------------------------------------
	\usepackage{csquotes}
	\usepackage[backend=biber,bibencoding=utf8,bibwarn=true,style=numeric]{biblatex}
	% Linebreaking of URLs
	\setcounter{biburllcpenalty}{7000}
	\setcounter{biburlucpenalty}{8000}
