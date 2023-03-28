% syllabus.cls
% latex style for a thesis, created by Richelle F. van Capelleveen
% To be compiled with pdflatex

\typeout{}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout/observatory-thesis}[2023/03/28 v0.1]
\typeout{}
\typeout{Unofficial Leiden observatory thesis class, created for Leiden Observatory}
\typeout{}
\typeout{Copyright (c) 2023 Richelle F. van Capelleveen}
\typeout{Please submit questions, comments, additions, complaints to:}
\typeout{https://github.com/richellevc/observatory_thesis_style}
\typeout{This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA}
\typeout{}

% based on default book class
% NOTE:     default is oneside for digital version, change to twoside in thesis.tex for print version
% language
\newif\if@dutch
\newif\if@english
\DeclareOption{dutch}{\@dutchtrue\@englishfalse}
\DeclareOption{english}{\@dutchfalse\@englishtrue}
% thesis type
\newif\if@msc
\newif\if@bsc
\DeclareOption{msc}{\@msctrue\@bscfalse}
\DeclareOption{bsc}{\@mscfalse\@bsctrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt]{book}  % digital version
\if@dutch
    \RequirePackage[dutch]{babel}
\else
    \RequirePackage[english]{babel}
\fi
\if@msc
    \newcommand{\thesistypelong}{Master }
    \newcommand{\thesistypeshort}{MSc }
\else
    \newcommand{\thesistypelong}{Bachelor }
    \newcommand{\thesistypeshort}{BSc }
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import required packages %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[dvipsnames, table]{xcolor} % Driver-independent color extensions
\RequirePackage{mathtools}  % Mathematical tools to use with amsmath
\RequirePackage{amssymb}    % Extended symbol collection
\RequirePackage{siunitx}    % Comprehensive (SI) units package
\RequirePackage{tabularx}   % Tabulars with adjustable-width columns
\RequirePackage{array}      % Programmable format specification for tables and arrays
\RequirePackage{booktabs}   % Publication quality tables
\RequirePackage{longtable}  % Allow tables to flow over page boundaries
\RequirePackage{multirow}   % Create tabular cells spanning multiple rows
\RequirePackage{graphicx}   % Enhanced support for images
\RequirePackage{float}      % Improved interface for floating objects
\RequirePackage[margin=0cm,font={color=template_text,small,sl},labelfont={color=template_text,bf,sl},tableposition=top,singlelinecheck=false,hypcap]{caption} % caption
\RequirePackage[labelfont={color=template_text,bf},textfont=it,singlelinecheck=false, font={color=template_text,footnotesize},justification=raggedright]{subcaption} % Support for sub-captions
\RequirePackage{pdfpages}   % Include PDF documents
\RequirePackage{appendix}   % Extra formatting of appendix
\RequirePackage[pdfusetitle,hidelinks]{hyperref} % Extensive support for hypertext
\RequirePackage[noabbrev,nameinlink,]{cleveref} % Intelligent cross-referencing
\RequirePackage{tikz}       % Create PostScript and PDF graphics
\RequirePackage{xspace}     % Better spacing after certain (math) commands 
\RequirePackage{microtype}  % Refinements towards typographical perfection
\RequirePackage{fancyvrb}   % Fancy verbatim customizations
\RequirePackage{geometry}   % Customize document dimensions
\RequirePackage[export]{adjustbox}  % Allows figures to exceed the page margins whilst remaining centered
\RequirePackage{titlesec}   % Select alternative section titles
\RequirePackage{titletoc}   % Alternative headings for toc
\RequirePackage[nottoc]{tocbibind} % auto add stuff to toc
\RequirePackage{fancyhdr}   % Control of page headers and footers
\RequirePackage{enumitem}   % Control layout of itemize, enumerate, description
\RequirePackage{etoolbox}   % Toolbox of programming facilities
\RequirePackage{datetime}   % Change format of \today
\RequirePackage{listings, color} % Typeset code input
\RequirePackage{wrapfig}    % Allows making wrapfigures
\RequirePackage{xpatch}     % Used to apply things to only frontmatter / mainmatter /backmatter
\RequirePackage{natbib}     % Required for bibliography (includes commands like citep and citet)

%% fontpackages
\RequirePackage[sfdefault, light]{inter} %% Option 'sfdefault' sets inter light as base font
\RequirePackage[T1]{fontenc} % font encoding
\RequirePackage{textcomp}   % More in text symbols
\RequirePackage{amsmath, amsthm}
\RequirePackage[scaled=1.1, cmintegrals]{newtxsf} % sans math font support, scaling to match size of Inter
%% link to newtxsf docs: https://ctan.math.illinois.edu/fonts/newtxsf/doc/newtxsf-doc.pdf

%% glossary packages (must be loaded after fontenc and hyperref)
\RequirePackage[section, numberedsection=autolabel, acronyms, symbols]{glossaries-extra} % Used for acronym and symbol references
\RequirePackage{glossary-longextra} % additional styles


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set paper geometry and fonts %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\geometry{a4paper,hscale=0.74,vscale=0.78} % slightly smaller margins than default of 0.7, 0.7
 % inter documentation: https://ctan.org/tex-archive/fonts/inter
\def\largetitlestyle{\interlight}       % set title to be normal font
\def\lighttitlestyle{\interextralight}  % thinner version for large text
\def\thintitlestyle{\interthin}   % thinnest version for large text
\renewcommand{\bfseries}{\intermedium}  % set bold font to be less super insanely bold in comparison to light font


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define colorpalette of template %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{template_blue}{HTML}{003473}   % Color of Leiden University logo (Lei-Blauw)
\definecolor{subtitle}{cmyk}{0,0,0,0}       % Color for subtitle (white)
\definecolor{template_text}{HTML}{434655}   % Color for text
\definecolor{template_lightgrey}{HTML}{A8AABC}  % Color of the chapter banner     
\definecolor{template_mediumgrey}{HTML}{747687}
\definecolor{template_pink}{HTML}{BFA5A6}
\definecolor{template_lightred}{HTML}{A54653}
\definecolor{template_darkred}{HTML}{6C0F26}
\definecolor{template_beige}{HTML}{857555}
\definecolor{template_yellow}{HTML}{D2A517}

\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color
}
\AtBeginDocument{\globalcolor{template_text}}

 \hypersetup{   % define hyperlink colours
	colorlinks,
	allcolors = ., % this uses current / default text color as default
    linkcolor = .,  % uses default colour for links, if you change this it will also (negatively) change the table of contents
	citecolor = ., % default colour for citations
	urlcolor = {template_blue} % subtle colour difference for urls (including href) 
	}      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define commands for cover, authors, title, etc %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\subject[1]{\def\@subject{#1}}
\newcommand*\affiliation[1]{\def\@affiliation{#1}}
\newcommand*\address[1]{\def\@address{#1}}
\newcommand*\projectstart[1]{\def\@projectstart{#1}}
\newcommand*\projectend[1]{\def\@projectend{#1}}
\newcommand*\coverimage[1]{\def\@coverimage{#1}}
\newcommand*\covercredit[1]{\def\@covercredit{#1}}
\newcommand*\covertable[1]{\def\@covertable{#1}}
\newcommand*\affiliationlogo[1]{\def\@affiliationlogo{#1}}
\newcommand*\coveraffiliationlogo[1]{\def\@coveraffiliationlogo{#1}}
\newcommand*\studentid[1]{\def\@studentid{#1}}
\newcommand*\supervisor[1]{\def\@supervisor{#1}}
\newcommand*\secondsupervisor[1]{\def\@secondsupervisor{#1}}
\newcommand*\corrector[1]{\def\@corrector{#1}}
\newcommand{\imref}[1]{\vspace{-7pt}\caption*{\textbf{#1}}} % extra caption for ref

% Set default logo depending on language
\addto\captionsenglish{%
\coveraffiliationlogo{layout/figures/leidenuniv_logos/Observatory_diapositive.pdf}
\affiliationlogo{layout/figures/leidenuniv_logos/Observatory.pdf}
}
\addto\captionsdutch{%
\coveraffiliationlogo{layout/figures/leidenuniv_logos/Sterrewacht_diapositief.pdf}
\affiliationlogo{layout/figures/leidenuniv_logos/Sterrewacht.pdf}
}


%%%%%%%%%%%%%%%%%%%%%
%% Make cover page %%
%%%%%%%%%%%%%%%%%%%%%

%% Set cover image, university logo, title and author
\newcommand*\makecover{
    
    %% Use the Tikz library positioning and clear the page header and footer
    \usetikzlibrary{positioning}
    \thispagestyle{empty}

    %% Make coverpage
    \begin{tikzpicture}[overlay,remember picture]
    \node[above=0,inner sep=0] at (current page.south) {\includegraphics[height=\paperheight]{\@coverimage}};

% uncomment this node for affiliation vertical on left side
%    \node[rotate=90,below right=40mm and 3mm] at (current page.west) {\ifdefvoid{\@affiliation}{}{\color{white}\@affiliation}};

    \node[above right=4.5mm] at (current page.south west) {%
        \includegraphics[width=0.5\linewidth]{\@coveraffiliationlogo}};

    \node[below=1.5cm,fill=template_lightgrey,minimum width={\paperwidth},inner ysep=25pt,opacity=0.7,text opacity=1] at (current page.north) {%
        \begin{minipage}{0.9\paperwidth}
            \lighttitlestyle\fontsize{42}{50}\selectfont\color{template_blue}\@title \\[0.4ex]
            %\color{white}\normalfont\fontsize{22}{22}\selectfont%
            \bfseries\fontsize{22}{24}\selectfont\color{white}%
            \ifdefvoid{\@subtitle}{}{\@subtitle \\[2.5ex]}%
            \ifdefvoid{\@subject}{}{\@subject \\[0.4ex]}
            \lighttitlestyle\fontsize{26}{30}\selectfont\ifdefvoid{\@covertable}{\@author}{\@covertable}
        \end{minipage}};

    \end{tikzpicture}
    \newpage
}


%%%%%%%%%%%%%%%%%%%%%
%% Make title page %%
%%%%%%%%%%%%%%%%%%%%%

\renewcommand*{\maketitle}{%
    \newpage
    \thispagestyle{empty}  
    \begin{center}
    \begin{minipage}{0.86\textwidth}
        \begin{center}
             %% Print the title
            {\lighttitlestyle\fontsize{42}{50}\color{template_blue}\selectfont\@title}\\[1ex]
            %% Print the subtitle
            {\ifdefvoid{\@subtitle}{}{\lighttitlestyle\fontsize{22}{24}\color{template_mediumgrey}\selectfont\@subtitle}}
        \end{center}
    \end{minipage}\\[18ex]
   
   \ifdefvoid{\@secondsupervisor}{\vspace{0.6ex}}{} % add spacing if no second supervisor
    
    %% Print thesis submitted info
    {\lighttitlestyle\color{template_lightgrey}\fontsize{12}{14}\selectfont{A thesis submitted in partial fulfillment \\ of the requirements for the degree of}} \\[1.6ex]
    {\lighttitlestyle\fontsize{16}{20}\color{template_blue}\selectfont{\thesistypelong of Science}} \\[0.4ex]
    {\lighttitlestyle\color{template_lightgrey}\fontsize{12}{14}\selectfont{in}} \\[0.4ex]
    {\lighttitlestyle\fontsize{16}{20}\color{template_blue}\selectfont{Astronomy}} \\[18ex]

    \ifdefvoid{\@secondsupervisor}{\vspace{0.6ex}}{} % add spacing if no second supervisor

    %% Print author and supervisor info
    \begin{minipage}{0.86\textwidth}
    \begin{center}{\color{template_blue}
        Author: \hfill \@author \\
        Student ID: \hfill \@studentid \\
        Supervisor: \hfill \@supervisor \\
        \ifdefvoid{\@secondsupervisor}{}{Second supervisor: \hfill \@secondsupervisor \\}
        Second corrector: \hfill \@corrector \\
        Project duration: \hfill \@projectstart ~--~\@projectend
        }
    \end{center}
    \end{minipage} \\[6ex]

    \begin{minipage}{0.86\textwidth}
    \begin{center}{\color{template_blue}
        {\lighttitlestyle\fontsize{10}{12}\color{template_lightgrey}\selectfont{Cover image:}} \hfill {\lighttitlestyle\fontsize{10}{12}\color{template_lightgrey}\selectfont{\@covercredit}} \\ 
        {\lighttitlestyle\fontsize{10}{12}\color{template_lightgrey}\selectfont{Template style:}} \hfill {\lighttitlestyle\fontsize{10}{12}\color{template_lightgrey}\selectfont{Thesis style by Richelle F. van Capelleveen}} \\
        {\lighttitlestyle\fontsize{10}{12}\color{template_lightgrey}\selectfont{Template licence:}} \hfill 
        {\lighttitlestyle\fontsize{10}{12}\color{template_lightgrey}\selectfont{Licenced under \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{\color{template_lightgrey}{CC BY-NC-SA 4.0}}}}
        } % override blue href color with lightgrey to not draw attention to the link (hidden link)
    \end{center}
    \end{minipage}
    \end{center}
    
    \begin{tikzpicture}[remember picture,overlay]
    \node[above=8mm] at (current page.south) {%
    \includegraphics[width=0.5\linewidth]{\@affiliationlogo}};
    \end{tikzpicture}

    \begin{tikzpicture}[remember picture,overlay]
    \node[above=10mm] at (current page.south) {%
    {\lighttitlestyle\fontsize{10}{12}\color{template_blue}\selectfont{\@address}}};
    \end{tikzpicture}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (Multilanguage) Glossary settings %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\GlsLongExtraUseTabulartrue % if it fits on one page, turns of centering though
\setabbreviationstyle[acronym]{long-short}%
\glsnoexpandfields
%\glssetnoexpandfield{symbol} if specific field only
\renewcommand{\glslongextraSymSetDescWidth}{%
\glslongextraSetDescWidth
\addtolength{\glsdescwidth}{-5.5cm}%
}

% Make different glossaries for units and constants
\newcommand{\glossaryunitname}{Units}
\newcommand{\glossaryconstantsname}{Constants}

\newglossary[slg-c]{constants}{sls-c}{slo-c}{\glossaryconstantsname}
\newglossary[slg-u]{units}{sls-u}{slo-u}{\glossaryunitname}

% Set options for different languages
\addto\captionsdutch{% 
\renewcommand*{\acronymname}{Acroniemen}%
\renewcommand*{\symbolname}{Eenheid}%
\renewcommand*{\entryname}{Notatie}% because 'benaming' is a shitty translation in this situation
\renewcommand*{\glossaryconstantsname}{Constanten}%
\renewcommand*{\glossaryunitname}{Eenheden}%
}

\addto\captionsenglish{% 
\renewcommand*{\acronymname}{Acronyms} % 
\renewcommand*{\symbolname}{Unit}%
\renewcommand*{\glssymbolsgroupname}{Symbols and Constants}%
}

%\renewcommand*{\glossarysection}[2][]{\chapter{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make table of contents %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Don't add sections in frontmatter to toc
\xapptocmd{\frontmatter}{\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}}{}{}% unnumbered sections, subsections, subsubsections etc.
\xapptocmd{\mainmatter}{\addtocontents{toc}{\protect\setcounter{tocdepth}{2}}}{}{}% numbered parts, chapters, sections, subsections

\contentsmargin[1.25cm]{0cm} % add correction margin on right for double lined entries to make it more readable

% Chapter text styling
\titlecontents{chapter}[1.25cm] % Indentation
{\addvspace{12pt}\large\bfseries} 
{\color{template_blue!70}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{template_blue}} % Chapter number
{\color{template_blue}}  
{\color{template_blue!70}\normalsize\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number

% Section text styling
\titlecontents{section}[1.25cm] % Indentation
{\addvspace{3pt}\bfseries\color{template_mediumgrey}} % Spacing and font options for sections
{\contentslabel[\thecontentslabel]{1.25cm}} % Section number
{}
{\hfill\thecontentspage} % Page number
[]

% Subsection text styling
\titlecontents{subsection}[1.25cm] % Indentation
{\addvspace{1pt}\small\color{template_mediumgrey}} % Spacing and font options for subsections
{\contentslabel[\thecontentslabel]{1.25cm}} % Subsection number
{}
{\ \titlerule*[.5pc]{.}\;\thecontentspage} % Page number
[]

% List of figures
\titlecontents{figure}[1.25cm] % left margin
{\addvspace{1pt}} % Spacing and font options for figures
{{\bfseries\contentslabel[\thecontentslabel]{1.25cm}}} % Figure number
{}
{\ \titlerule*[.5pc]{.}\;\bfseries\thecontentspage} % Page number
%[]

% List of tables
\titlecontents{table}[1.25cm] % left margin
{\addvspace{1pt}} % Spacing and font options for table
{{\bfseries\contentslabel[\thecontentslabel]{1.25cm}}} % Table number
{}
{\ \titlerule*[.5pc]{.}\;\bfseries\thecontentspage} % Page number
%[]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Section title above page %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Change the header and footer of pages where chapters do not start (depends on twoside option)
\if@twoside
    \fancyhf{}
    \fancyhead[LE,RO]{\thepage}
    \fancyhead[RE]{\nouppercase{\leftmark}}
    \fancyhead[LO]{\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Remove header and footer on empty pages
\else
    \fancyhf{}
    \fancyhead[R]{\thepage}
    \fancyhead[L]{\nouppercase{\rightmark}}
\fi

\fancypagestyle{plain}{ % set page number for chapter pages to bottom right
    \fancyhead{}
    \fancyfoot[R]{\thepage}
}
\pagestyle{fancy} % Setting the package defaults and the additional changes as the style


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make chapter headings %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@makechapterhead#1{%
{\parindent \z@ \raggedright \normalfont
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node [rectangle, fill=template_lightgrey, anchor=north, minimum width=\paperwidth, minimum height=6.4cm] (box) at (current page.north){} ;
\draw[anchor=west] (\Gm@lmargin-.4cm,-4cm) node {{\fontsize{95}{95}\thintitlestyle\color{white}\thechapter.}
            {\fontsize{35}{35}\largetitlestyle\color{white}\hspace{0.5cm}#1}\strut};
\end{tikzpicture}};
\end{tikzpicture}

\else
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node [rectangle, fill=template_lightgrey, anchor=north, minimum width=\paperwidth, minimum height=6.4cm] (box) at (current page.north){} ;
\draw[anchor=west] (\Gm@lmargin-.4cm,-4cm) node {\fontsize{35}{35}\largetitlestyle\color{white}\hspace{0.5cm}#1\strut};
\end{tikzpicture}};
\end{tikzpicture}
\fi\fi\par\vspace*{150\p@}}}

%-------------------------------------------
% for chapters with no number like contents and bibliography
\def\@makeschapterhead#1{%
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node [rectangle, fill=template_lightgrey, anchor=north, minimum width=\paperwidth, minimum height=6.4cm] (box) at (current page.north){} ;
\draw[anchor=west] (\Gm@lmargin-.4cm,-4.5cm) node {\fontsize{35}{35}\largetitlestyle\color{white}\hspace{0.5cm}#1\strut};
\end{tikzpicture}};
\end{tikzpicture}
\par\vspace*{150\p@}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Section numbering in the margin %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Supress section numbers in frontmatter
\xapptocmd{\frontmatter}{\setcounter{secnumdepth}{0}}{}{}% unnumbered sections, subsections, subsubsections etc.
\xapptocmd{\mainmatter}{\setcounter{secnumdepth}{2}}{}{}% numbered parts, chapters, sections, subsections

% Section numbering in margin 
\makeatletter
\renewcommand{\@seccntformat}[1]{\llap{\textcolor{template_pink}{\csname the#1\endcsname}\hspace{0.8em}}}                          
\renewcommand{\section}{\@startsection{section}{1}{\z@}
{-4ex \@plus -1ex \@minus -.4ex}
{1ex \@plus.2ex }
{\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
{-3ex \@plus -0.1ex \@minus -.4ex}
{0.5ex \@plus.2ex }
{\normalfont\bfseries}}
\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
{-2ex \@plus -0.1ex \@minus -.2ex}
{.2ex \@plus.2ex }
{\normalfont\small\bfseries}}                        
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
{-2ex \@plus-.2ex \@minus -.2ex}
{.1ex}
{\normalfont\small\bfseries}}
\makeatother


%%%%%%%%%%%%%%%%%%%
%% miscellaneous %%
%%%%%%%%%%%%%%%%%%%
% slightly increase vertical spacing in longtables
\renewcommand*{\arraystretch}{1.15} %note: also applies to glossaries


%%%%%%%%%%%%%%%%%%%%%%%
%% List environments %%
%%%%%%%%%%%%%%%%%%%%%%%

% If you want to change the labeling of lists, uncomment and / or edit the lines below
%\renewcommand{\theenumi}{\alph{enumi}} % enumerate starts with lower case letters
%\renewcommand{\theenumii}{\roman{enumii}} % second level is lower case roman
%\renewcommand{\theenumiii}{\Alph{enumiii}} % third level is upper case letters
%\renewcommand{\theenumiv}{\Roman{enumiv}} % fourth level is upper case Roman


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set layout of script if included %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\lstset{
		%backgroundcolor=\color{template_lightgrey!15!white!},
		backgroundcolor=\color{template_text},
		extendedchars=true,
    	tabsize=4, 
%		literate
    	stepnumber=1,   
%   	rulecolor=,
    	language=Python,
        basicstyle=\scriptsize\color{template_lightgrey},
        upquote=true,
        aboveskip={1.5\baselineskip},
        columns=fixed,
        showstringspaces=false,
        extendedchars=false,
        breaklines=true,
        prebreak = \raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
        numbers=left,
        showtabs=false,
        showspaces=false,
        showstringspaces=false,
        identifierstyle=\ttfamily,
        keywordstyle=\ttfamily\color{template_yellow},
        commentstyle=\ttfamily\color{template_pink},
        stringstyle=\ttfamily\color{template_lightred},
        numberstyle=\ttfamily\tiny\color{template_text},
        %keywords=[2]{matplotlib, pyplot, plt},
        %keywordstyle=[2]\ttfamily\color{Orange!50!Red},
        %keywords=[3]{np, numpy},
        %keywordstyle=[3]\ttfamily\color{Sepia!50!Red},
        %keywords=[4]{natuurkunde, nat},
        %keywordstyle=[4]\ttfamily\color{OliveGreen!80!Black},
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Biblioghraphy abbreviations %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Avoid errors in bibliography by defining commands such as \aap
% Copied from AASTEX package
\makeatletter

\let\jnl@style=\sf

\def\ref@jnl#1{{\jnl@style#1}}% 
\newcommand\aj{\ref@jnl{AJ }}%          % Astronomical Journal 
\newcommand\araa{\ref@jnl{ARA\&A }}%    % Annual Review of Astron and Astrophys 
\newcommand\apj{\ref@jnl{ApJ }}%        % Astrophysical Journal 
\newcommand\apjl{\ref@jnl{ApJL }}       % Astrophysical Journal, Letters 
\newcommand\apjs{\ref@jnl{ApJS }}%      % Astrophysical Journal, Supplement 
\newcommand\ao{\ref@jnl{ApOpt }}%       % Applied Optics 
\newcommand\apss{\ref@jnl{Ap\&SS }}%    % Astrophysics and Space Science 
\newcommand\aap{\ref@jnl{A\&A }}%       % Astronomy and Astrophysics 
\newcommand\aapr{\ref@jnl{A\&A~Rv }}%   % Astronomy and Astrophysics Reviews 
\newcommand\aaps{\ref@jnl{A\&AS }}%     % Astronomy and Astrophysics, Supplement 
\newcommand\azh{\ref@jnl{AZh }}%        % Astronomicheskii Zhurnal 
\newcommand\baas{\ref@jnl{BAAS }}%      % Bulletin of the AAS 
\newcommand\icarus{\ref@jnl{Icarus }}%  % Icarus
\newcommand\jaavso{\ref@jnl{JAAVSO }}   % The Journal of the American Association of Variable Star Observers
\newcommand\jrasc{\ref@jnl{JRASC }}%    % Journal of the RAS of Canada 
\newcommand\memras{\ref@jnl{MmRAS }}%   % Memoirs of the RAS 
\newcommand\mnras{\ref@jnl{MNRAS }}%    % Monthly Notices of the RAS 
\newcommand\pra{\ref@jnl{PhRvA }}%      % Physical Review A: General Physics 
\newcommand\prb{\ref@jnl{PhRvB }}%      % Physical Review B: Solid State 
\newcommand\prc{\ref@jnl{PhRvC }}%      % Physical Review C 
\newcommand\prd{\ref@jnl{PhRvD }}%      % Physical Review D 
\newcommand\pre{\ref@jnl{PhRvE }}%      % Physical Review E 
\newcommand\prl{\ref@jnl{PhRvL }}%      % Physical Review Letters 
\newcommand\pasp{\ref@jnl{PASP }}%      % Publications of the ASP 
\newcommand\pasj{\ref@jnl{PASJ }}%      % Publications of the ASJ 
\newcommand\qjras{\ref@jnl{QJRAS }}%    % Quarterly Journal of the RAS 
\newcommand\skytel{\ref@jnl{S\&T }}%    % Sky and Telescope 
\newcommand\solphys{\ref@jnl{SoPh }}%   % Solar Physics 
\newcommand\sovast{\ref@jnl{Soviet~Ast. }}% % Soviet Astronomy 
\newcommand\ssr{\ref@jnl{SSRv }}%       % Space Science Reviews 
\newcommand\zap{\ref@jnl{ZA }}%         % Zeitschrift fuer Astrophysik 
\newcommand\nat{\ref@jnl{Nature }}%     % Nature 
\newcommand\iaucirc{\ref@jnl{IAUC }}%   % IAU Cirulars 
\newcommand\aplett{\ref@jnl{Astrophys.~Lett. }}% % Astrophysics Letters 
\newcommand\apspr{\ref@jnl{Astrophys.~Space~Phys.~Res. }}% % Astrophysics Space Physics Research 
\newcommand\bain{\ref@jnl{BAN }}%       % Bulletin Astronomical Institute of the Netherlands 
\newcommand\fcp{\ref@jnl{FCPh }}%       % Fundamental Cosmic Physics 
\newcommand\gca{\ref@jnl{GeoCoA }}%     % Geochimica Cosmochimica Acta 
\newcommand\grl{\ref@jnl{Geophys.~Res.~Lett. }}% % Geophysics Research Letters 
\newcommand\jcp{\ref@jnl{JChPh }}%      % Journal of Chemical Physics 
\newcommand\jgr{\ref@jnl{J.~Geophys.~Res. }}% % Journal of Geophysics Research 
\newcommand\jqsrt{\ref@jnl{JQSRT }}%    % Journal of Quantitiative Spectroscopy and Radiative Trasfer 
\newcommand\memsai{\ref@jnl{MmSAI }}%   % Mem. Societa Astronomica Italiana 
\newcommand\nphysa{\ref@jnl{NuPhA }}%   % Nuclear Physics A 
\newcommand\physrep{\ref@jnl{PhR }}%    % Physics Reports 
\newcommand\physscr{\ref@jnl{PhyS }}%   % Physica Scripta 
\newcommand\planss{\ref@jnl{Planet.~Space~Sci. }}% % Planetary Space Science 
\newcommand\procspie{\ref@jnl{Proc.~SPIE }}% % Proceedings of the SPIE 

\newcommand\actaa{\ref@jnl{AcA }}%      % Acta Astronomica
\newcommand\caa{\ref@jnl{ChA\&A }}%     % Chinese Astronomy and Astrophysics
\newcommand\cjaa{\ref@jnl{ChJA\&A }}%   % Chinese Journal of Astronomy and Astrophysics
\newcommand\jcap{\ref@jnl{JCAP }}%      % Journal of Cosmology and Astroparticle Physics
\newcommand\na{\ref@jnl{NewA }}%        % New Astronomy
\newcommand\nar{\ref@jnl{NewAR }}%      % New Astronomy Review
\newcommand\pasa{\ref@jnl{PASA }}%      % Publications of the Astron. Soc. of Australia
\newcommand\rmxaa{\ref@jnl{RMxAA }}%    % Revista Mexicana de Astronomia y Astrofisica

%% added feb 9, 2016
\newcommand\maps{\ref@jnl{M\&PS }}%     % Meteoritics and Planetary Science
\newcommand\aas{\ref@jnl{AAS Meeting Abstracts }}% % American Astronomical Society Meeting Abstracts
\newcommand\dps{\ref@jnl{AAS/DPS Meeting Abstracts }}% % American Astronomical Society/Division for Planetary Sciences Meeting Abstracts
\let\astap=\aap 
\let\apjlett=\apjl 
\let\apjsupp=\apjs 
\let\applopt=\ao 

\makeatother