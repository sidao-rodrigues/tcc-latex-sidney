\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{artigoifce}[2014/08/16 Example LaTeX class]

\LoadClass[% -- opções da classe memoir --
	article,			% indica que é um artigo acadêmico
	12pt,				% tamanho da fonte
	oneside,			% para impressão apenas no recto. Oposto a twoside
	a4paper,			% tamanho do papel. 
	% -- opções da classe abntex2 --
	%chapter=TITLE,		% títulos de capítulos convertidos em letras maiúsculas
	%section=TITLE,		% títulos de seções convertidos em letras maiúsculas
	%subsection=TITLE,	% títulos de subseções convertidos em letras maiúsculas
	%subsubsection=TITLE % títulos de subsubseções convertidos em letras maiúsculas
	% -- opções do pacote babel --
	english,			% idioma adicional para hifenização
	brazil,				% o último idioma é o principal do documento
	sumario=tradicional
	]{abntex2}

\usepackage{mathptmx}
\usepackage[T1]{fontenc}		% Selecao de codigos de fonte.
\usepackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
\usepackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\usepackage{nomencl} 			% Lista de simbolos
\usepackage{color}				% Controle das cores
\usepackage{graphicx}			% Inclusão de gráficos
\usepackage{microtype} 			% para melhorias de justificação
\usepackage[explicit]{titlesec}

\titleformat{\section}{\bfseries\normalsize}{\arabic{section} \MakeUppercase{#1}}{1em}{}
\titlespacing*{\section}{0pt}{9pt}{9pt}

\titleformat{\subsection}{\bfseries}{\arabic{section}.\arabic{subsection} {#1}}{1em}{}
\titlespacing*{\subsection}{0pt}{9pt}{9pt}
%\titlespacing*{\resumoname}{0pt}{10pt}{10pt}

\titleformat{\subsubsection}{\bfseries}{\textit{\arabic{section}.\arabic{subsection}.\arabic{subsubsection} #1}}{1em}{}
\titlespacing*{\subsubsection}{0pt}{9pt}{9pt}

\titleformat{\subsubsubsection}{}{\textit{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}\arabic{subsubsubsection}} \textit{#1}}{1em}{}
\titlespacing*{\subsubsubsection}{0pt}{9pt}{9pt}
\setSpacing{2}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\itshape}


\renewcommand{\sfdefault}{\rmdefault} % No serif fonts, use roman (times)
\renewcommand{\resumoname}{\bfseries\normalsize{RESUMO}}
\renewcommand{\bibname}{\bfseries\normalsize{REFER\^ENCIAS}}
\usepackage{caption} %alinhar a esquerda
%\renewcommand{\theequation}{Equação \arabic{equation}}
\renewcommand{\equationautorefname}{Equação}
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\tableautorefname}{Tabela}
%\renewcommand{\subsectionautorefname}{Subseção}
%\renewcommand{\subsubsectionautorefname}{Subsubseção}
\renewcommand{\fonte}{\fontsize{10}{12}\selectfont{Fonte: }}
\captionsetup[table]{name=Tabela}%, justification=raggedright,singlelinecheck=false}
\captionsetup[subfigure]{justification=centering}
%\captionsetup[table]{name=Tabela, justification=raggedright, singlelinecheck=false, margin=10pt}

%https://tex.stackexchange.com/questions/191376/autoref-and-braces-around-equation-number

%\usepackage[brazilian,hyperpageref]{backref}	 % Paginas com as citações na bibl
% ---

% % ---
% % Configurações do pacote backref
% % Usado sem a opção hyperpageref de backref
% \renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% % Texto padrão antes do número das páginas
% \renewcommand{\backref}{}
% % Define os textos da citação
% \renewcommand*{\backrefalt}[4]{
% 	\ifcase #1 %
% 		Nenhuma citação no texto.%
% 	\or
% 		Citado na página #2.%
% 	\else
% 		Citado #1 vezes nas páginas #2.%
% 	\fi}%
%% ---

%%%utilizado para tiks e pacote cisco
\usepackage{tikz, tkz-euclide}
\usepackage[american]{circuitikz}
\usepackage{siunitx}
\usepackage[shading]{moeptikz} %shapes for hubs, switches, routers, pc...
\moeptikzset{shading=true}
\usetikzlibrary{fit} % wall
\usetikzlibrary{shapes} % cloud
\newcommand*{\nodelabel}[2]{{\footnotesize\bfseries\ttfamily \textcolor{#1}{ #2}}}
\newcommand*{\nodelabelT}[4]{{\footnotesize\ttfamily \textcolor{#1}{ \fontsize{#3}{#4}\selectfont #2}}}

%gráficos
\usepackage{pgfplots}
\pgfplotsset{width=15cm, compat=1.9}

%%%utilizado para tiks e pacote cisco







\newcommand{\subtitle}[1]{\date{#1}}

%\usepackage[alf, bibjustif]{abntex2cite} %adiciona o justiciado as referências
\usepackage[alf, abnt-etal-cite = 3, abnt-etal-text=emph]{abntex2cite}

\renewcommand{\maketitle}{%
  \begin{center}
  {\bfseries\normalsize\MakeUppercase\thetitle}\par\vspace{8pt}
  {\bfseries\normalsize\MakeUppercase\thedate}\par
  
    \begin{flushright}
  	    \theauthor\hspace{3pt}\footnote{\notaAutor} \\
  	    \orientador \\
  	    \coorientador \\ 
     \end{flushright}
    
  \end{center}
  
  \thispagestyle{empty}
    \pagestyle{abntheadings}
    \makeheadrule{abntheadings}{0\textwidth}{\normalrulethickness}
}



  \renewcommand{\bibsection}{%
    \chapter*{\normalsize\bfseries{REFER\^ENCIAS}}
    %\vspace{-\onelineskip} %mudar o espaço entre o Título e as referências
    \vspace{-20pt}
    \bibmark
    \ifnobibintoc\else
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\bibname}}{\bibname}}
    \fi
    \prebibhook
}

%%%%%%%%%%%%
%

\newcommand{\palavraschaves}[1]{\noindent\vspace{\onelineskip}\textbf{Palavras-chave}: #1}
\newcommand{\keywords}[1]{\noindent\vspace{\onelineskip}\textbf{Keywords}: #1\vspace{-\onelineskip}}


 

%
\newenvironment{resumoartigo}{\begin{resumoumacoluna}\vspace{-10pt}}{\end{resumoumacoluna}}
%
%
\newenvironment{abstractartigo}{\begin{resumoumacoluna}[\bfseries\normalsize{ABSTRACT}]\vspace{-10pt}}{\end{resumoumacoluna}}
%


%%%%%%%%%%%%
\data{}
\local{}

\def\UrlLeft{}
\def\UrlRight{}

\definecolor{blue}{RGB}{41,5,195}

\makeatletter
\hypersetup{
     	%pagebackref=true,
		pdftitle={\@title}, 
		pdfauthor={\@author},
    	pdfsubject={Modelo de artigo científico com abnTeX2},
	    pdfcreator={LaTeX with abnTeX2},
		pdfkeywords={abnt}{latex}{abntex}{abntex2}{atigo científico}, 
		colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=black,
		bookmarksdepth=4
}
\makeatother
% --- 

% ---
% compila o indice
% ---
\makeindex
% ---

% ---
% Altera as margens padrões
% ---
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
 \setlength\absleftindent{0cm}
 \setlength\absrightindent{0cm}


\checkandfixthelayout
% ---

% --- 
% Espaçamentos entre linhas e parágrafos 
% --- 

% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.25cm}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{-0.01cm}  % tente também \onelineskip

% Espaçamento simples
\OnehalfSpace
%\OnehalfSpace

\selectlanguage{brazil}

\frenchspacing 

%%sidao

%%aling equation right
%https://tex.stackexchange.com/questions/428400/how-to-right-align-an-equation
%\makeatletter
%\newcommand{\mathleft}{\@fleqntrue\@mathmargin0pt}
%\newcommand{\mathcenter}{\@fleqnfalse}
%\makeatother

%\addtolength{\footnotesep}{0pt}

%%sidao
%\renewcommand{\sectionautorefname}{Seção}
%\renewcommand{\subsectionautorefname}{Subseção}
%\renewcommand{\subsubsectionautorefname}{Subsubseção}

%alinhamento tabela
\renewcommand{\arraystretch}{1.5}
\addtolength{\tabcolsep}{1.5pt}
