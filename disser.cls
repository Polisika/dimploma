\ProvidesClass{disser}[2014/10/11 Dissertation Class by Ilya Stupakov]
\LoadClass[a4paper,
	fontsize=14pt,
	headings=small,
	listof=leveldown,
	chapterentrydots=true,
	numbers=endperiod,
	%chapterprefix=true,
	%draft,
]{scrreprt}

\RequirePackage{iftex}
\ifxetex
	\RequirePackage{fontspec}                         % подготавливает загрузку шрифтов Open Type, True Type и др.
	\defaultfontfeatures{Ligatures={TeX}}             % свойства шрифтов по умолчанию
	\setmainfont{Times New Roman}                     % задаёт основной шрифт документа
	\setsansfont{Comic Sans MS}                       % задаёт шрифт без засечек
	\setmonofont{Courier New}                         % задаёт моноширинный шрифт
\else
	\RequirePackage{cmap}                             % Улучшенный поиск русских слов в полученном pdf-файле
	\RequirePackage[T2A]{fontenc}                     % Поддержка русских букв
	\RequirePackage[utf8]{inputenc}                   % Кодировка utf8
\fi

\RequirePackage[english,russian]{babel}                   % загружает пакет многоязыковой вёрстки

\RequirePackage[hidelinks, unicode=true, bookmarksnumbered=true]{hyperref}
\makeatletter
\renewcommand{\Hy@numberline}[1]{#1. } % Добавляем точки в оглавлении PDF
\makeatother

\RequirePackage{amsmath,amsfonts,amssymb,amsthm,mathtools} % AMS
\RequirePackage[usenames,dvipsnames,svgnames,table,rgb]{xcolor}

\RequirePackage{indentfirst} % Красная строка
\setlength{\parindent}{1cm} % Отступ для абзаца
\RequirePackage{setspace}

\RequirePackage{tabularx}
\RequirePackage{pdfpages}

%%% Страница
\RequirePackage[top=20mm,bottom=20mm,left=30mm,right=10mm,footskip=1cm,headsep=0.7cm]{geometry} % Поля страницы

%%% Выравнивание и переносы %%%

\sloppy                            % Избавляемся от переполнений
\clubpenalty=10000                 % Запрещаем разрыв страницы после первой строки абзаца
\widowpenalty=10000                % Запрещаем разрыв страницы после последней строки абзаца

%%% Настройка шрифтов и заголовков %%%

\renewcommand{\chapterformat}{\centering\chapapp~\thechapter\autodot\enskip}% Добавляем префиксы для глав и приложений
%font={\let\@hangfrom\relax}
\RedeclareSectionCommand[beforeskip=0cm,tocnumwidth=2cm,font={\bfseries\Large}]{chapter}
\RedeclareSectionCommand[font={\bfseries\large}]{section}
\RedeclareSectionCommands[font={\bfseries}]{subsection} % \it
\let\raggedchapter\centering  %Center all chapterheads
\let\raggedsection\centering
\setkomafont{disposition}{\bfseries}
\setkomafont{descriptionlabel}{\bfseries}

\renewcommand\addchaptertocentry[2]{% Добавляем префиксы для глав в оглавлении
  \ifstr{#1}{}{
    \addtocentrydefault{chapter}{}{#2}
  }{
    \addtocentrydefault{chapter}{\chapapp~#1}{#2}
  }
}

\newcommand*{\appendixmore}{% Добавляем префиксы для приложений в оглавлении
  \addtocontents{toc}{
    \RedeclareSectionCommand[tocnumwidth=3.7cm]{chapter}
  }
}

%%% Библиография %%%

%\usepackage{csquotes}
%\usepackage[backend=biber,
%	style=gost-numeric,         % стиль цитирования и библиографии
%	autolang=other,             % многоязычная библиография
%	maxbibnames=4,              % Максимальное число авторов в списке литературы.
%	minbibnames=2,              % Число авторов, отображаемое при сокращении.             
%]{biblatex}


%%% Переопределение именований %%%
\addto\captionsrussian{\renewcommand{\abstractname}{Аннотация}}
\addto\captionsrussian{\renewcommand{\appendixname}{Приложение}}
\addto\captionsrussian{\renewcommand{\bibname}{СПИСОК ЛИТЕРАТУРЫ}}
\addto\captionsrussian{\renewcommand{\chaptername}{Глава}}
\addto\captionsrussian{\renewcommand{\contentsname}{ОГЛАВЛЕНИЕ}}
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}
\addto\captionsrussian{\renewcommand{\indexname}{Предметный указатель}}
\addto\captionsrussian{\renewcommand{\listfigurename}{Список рисунков}}
\addto\captionsrussian{\renewcommand{\listtablename}{Список таблиц}}
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}

\RequirePackage{caption2} 
\addto\captionsrussian{\renewcommand\captionlabeldelim{ --}}
%%% Fix for some bug in biblatex %%%
%\NewBibliographyString{langjapanese} 
%\NewBibliographyString{fromjapanese}


\endinput