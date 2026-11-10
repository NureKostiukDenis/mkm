\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nure}[2026/11/21]

\LoadClass[14pt,oneside]{extreport}

\RequirePackage{cmap}
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,ukrainian]{babel}
\RequirePackage[a4paper, top=2cm, bottom=2cm, left=2.5cm, right=1cm]{geometry}
\RequirePackage{indentfirst}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xcolor}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{lipsum}
% КОЛОНТИТУЛИ
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Абзацний відступ
\setlength{\parindent}{5ex}
\setlength{\parskip}{0pt}
% Інтервал — полуторний
\linespread{1.3}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Глибина нумерації
\setcounter{secnumdepth}{3}
% Глибина змісту
\setcounter{tocdepth}{2}
% Керування заголовками
\RequirePackage[raggedright]{titlesec}
% Керування змістом
\RequirePackage{titletoc}
%\titleformat{command}[shape]
%	{format}
%	{label}
%	{sep}
%	{before-code}
%	[after-code]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	РОЗДІЛ
\titleformat{\chapter}[display]
	{\filcenter}
    {\MakeUppercase{\chaptertitlename} \thechapter}
    {0pt}
	{\MakeUppercase}
	{}
\assignpagestyle{\chapter}{fancy}
\titlespacing{\chapter}
	{0ex}
	{-30pt}
	{8pt}
\titlecontents{chapter}
	[0ex]
	{}
	{\bfseries{\chaptername\ \thecontentslabel {}\quad}\bfseries}
	{}
	{\dotfill\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	ПІДРОЗДІЛ
\titleformat{\section}[block]
    {\normalsize}
    {\thesection\quad}
    {1em}
    {}
\titlespacing{\section}
	{\parindent}
	{0pt}
	{0pt}
\titlecontents{section}
	[5ex] %
	{}
	{\thecontentslabel\quad}
	{}
	{\dotfill\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	ПУНКТ
\titleformat{\subsection}[block]
    {\normalsize}
    {\thesubsection\quad}
    {1em}
    {}
\titlespacing{\subsection}
	{\parindent}
	{12pt}
	{0pt}
\titlecontents{subsection}
	[10ex]
	{}
	{\thecontentslabel {}\quad}
	{}
	{\dotfill\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	ПІДПУНКТ
\titleformat{\subsubsection}[block]
    {\normalsize}
    {\thesubsubsection\quad}
    {1em}
    {}
\titlespacing{\subsubsection}
	{\parindent}
	{0pt}
	{0pt}
\titlecontents{subsubsection}
	[15ex]
	{}
	{\thecontentslabel {}\quad}
	{}
	{\dotfill\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% СТРУКТУРНА ЧАСТИНА % Вступ, Висновки і т.п.
\newcommand{\likechapterheading}[1]{
	\newpage
	\begin{center}
	\MakeUppercase{#1}
	\end{center}
	\mbox{}\newline}

	\makeatletter
		\renewcommand{\@dotsep}{2}
		\newcommand{\l@likechapter}[2]{{\@dottedtocline{0}{0pt}{0pt}{\bfseries #1}{#2}}}
	\makeatother

	\newcommand{\likechapter}[1]{
		\likechapterheading{#1}
		\addcontentsline{toc}{likechapter}{{#1}}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{longtable}
\RequirePackage{caption}
\DeclareCaptionLabelFormat{tablecap}{Таблиця #2}
\captionsetup[table]{
format=hang,
margin=0em,
indention=0em,
singlelinecheck=false,
justification=justified,
labelsep=endash,
labelformat=tablecap,
belowskip=18pt,
aboveskip=3pt
}

\renewenvironment{table}[4]{
	\begingroup\centering
	\setlength{\LTpre}{-14pt}
	\setlength{\LTpost}{14pt}
	\setlength{\LTcapwidth}{0pt}
	\begin{longtable}{#1}
		\kill
		\caption{#2}\label{#3}\\
		#4
		\endfirsthead
		\kill
		\caption*{Продовження таблиці \thetable}\\
		#4
		\endhead
		\hline
		\endfoot
}
	{%
	\end{longtable}
	\endgroup
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval}
\RequirePackage{ifthen}
\makeatletter

\define@cmdkey[CW]{TitlePage}{MinistryName}[Міністерство освіти і науки України]{}
\define@cmdkey[CW]{TitlePage}{UniversityName}[Херсонський державний університет]{}
\define@cmdkey[CW]{TitlePage}{FacultyName}[Факультет фізики, математики та інформатики]{}
\define@cmdkey[CW]{TitlePage}{DepartmentName}[Назва кафедри]{}
\define@cmdkey[CW]{TitlePage}{CityOfResearch}[Місто]{}
\define@cmdkey[CW]{TitlePage}{YearOfResearch}[рік]{}
%%
\define@cmdkey[CW]{TitlePage}{ResearchTitle}[\LaTeX{} \,--\, шаблон студентських наукових робіт]{}
\define@cmdkey[CW]{TitlePage}{StudentName}[ПІБ]{}
\define@cmdkey[CW]{TitlePage}{StudentSex}[male]{}
\define@cmdkey[CW]{TitlePage}{StudentGroup}[група]{}
\define@cmdkey[CW]{TitlePage}{StudentCourse}[курс]{}
\define@cmdkey[CW]{TitlePage}{StudentSpeciality}[Спеціальність]{}
%%
\define@cmdkey[CW]{TitlePage}{SupervisorDegree}[професор]{}
\define@cmdkey[CW]{TitlePage}{SupervisorName}[ПІБ]{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\MakeTitlePage}[1]{
	\setkeys[CW]{TitlePage}{#1}
	\thispagestyle{empty}
%
	\begin{center}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@MinistryName}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@UniversityName}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@FacultyName}
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@DepartmentName}
		\vfill
		\par\noindent\MakeUppercase{\cmdCW@TitlePage@ResearchTitle}
	\end{center}
%
	\vfill
%
\begin{flushleft}
	\hyphenpenalty=10000
	\pretolerance=10000
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\begin{minipage}[t]{1\textwidth}
		\begin{minipage}[t]{0.3\textwidth}
			\ifthenelse
				{\equal{\cmdCW@TitlePage@StudentSex}{male}}
				{\par\noindent Виконав:}
				{\par\noindent Виконала:}
		\end{minipage}
		\hfill
		\begin{minipage}[t]{0.5\textwidth}
			\par\noindent
			\ifthenelse
				{\equal{\cmdCW@TitlePage@StudentSex}{male}}
				{студент}
				{студентка}
			\cmdCW@TitlePage@StudentCourse\ курсу \cmdCW@TitlePage@StudentGroup\ групи спеціальності
			\par\noindent\cmdCW@TitlePage@StudentSpeciality
			\par\noindent\cmdCW@TitlePage@StudentName
		\end{minipage}
	\end{minipage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bigskip\par\bigskip
	\begin{minipage}[t]{1\textwidth}
		\begin{minipage}[t]{0.3\textwidth}
			\par\noindent Науковий керівник:
		\end{minipage}
		\hfill
		\begin{minipage}[t]{0.5\textwidth}
			\par\noindent \cmdCW@TitlePage@SupervisorDegree
			\par\noindent \cmdCW@TitlePage@SupervisorName
		\end{minipage}
	\end{minipage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\end{flushleft}
\vfill
	\begin{center}
	\cmdCW@TitlePage@CityOfResearch\ \,--\, \cmdCW@TitlePage@YearOfResearch
	\end{center}
	\pagebreak
}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
