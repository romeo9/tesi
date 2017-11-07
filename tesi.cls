
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{tesi}[2017/11/04 v1.0 Tesi]

\LoadClass[a4paper,11pt,oneside,italian]{memoir}

% Si utilizza la sillabazione italiana
\RequirePackage[italian,english]{babel}

% Load graphicx
\RequirePackage{graphicx}
% Line spacing
\RequirePackage{setspace}

% pacchetti per i font
\usepackage[T1]{fontenc}
% interlinea
\linespread{1.4}
% margini (la dimensione del blocco di testo viene regolata di conseguenza)
\setlrmarginsandblock{3.5cm}{3cm}{*}
% profondità dell'indice (settato per stampare fino alle sottosezioni)
\setcounter{tocdepth}{2}
% numera parti, capitoli, sezioni, sottosezioni e sotto-sottosezioni
\maxsecnumdepth{subsubsection}
\setsecnumdepth{subsubsection}

% header personalizzati
\let\footruleskip\relax % for compatibility of memoir and fancyhdr
\let\rm\rmfamily        % for compatibility of memoir and blindtext (demo only)
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\addtolength{\headheight}{14pt}
\fancyhead[R]{\textbf{\thepage}}
\fancyhead[L]{\textbf{\leftmark}}

% AnnoAccademico (Anno/Anno+1)
\newcommand{\@annoAccademico}{2016/2017}
\newcommand{\annoAccademico}[1]{\renewcommand{\@annoAccademico}{#1}}
% Autore 
\newcommand{\@autore}{Claudia Romeo}
\newcommand{\autore}[1]{\renewcommand{\@autore}{#1}}
% Titolo
\newcommand{\@titolo}{Strumenti di analisi per la rete delle transazioni Bitcoin}
\newcommand{\titolo}[1]{\renewcommand{\@titolo}{#1}}
% Matricola 
\newcommand{\@matricola}{461963}
\newcommand{\matricola}[1]{\renewcommand{\@matricola}{#1}}
% Relatore (Titolo Nome Cognome, es: Prof. Pippo Caruso)
\newcommand{\@relatore}{Prof. Maurizio Pizzonia}
\newcommand{\relatore}[1]{\renewcommand{\@relatore}{#1}}
% Correlatore (Titolo Nome Cognome, es: Dott. Pippo Caruso)
\newcommand{\@correlatore}{}
\newcommand{\correlatore}[1]{\renewcommand{\@correlatore}{#1}}
% Dedica
\newcommand{\@dedica}{}
\newcommand{\dedica}[1]{\renewcommand{\@dedica}{#1}}

% Generazione del FRONTESPIZIO
\newcommand{\generaFrontespizio}{
   \thispagestyle{empty}
   \begin{center}
      \vspace{10mm}
      {\includegraphics[width=0.4 \linewidth]{figure/uniroma3-logo}} \\
      \vspace{10mm}
      {\Large UNIVERSIT\`A DEGLI STUDI ROMA TRE} \\
      \vspace{5mm}
      {\LARGE Facolt\`a di Ingegneria} \\
      {\Large Corso di Laurea Magistrale in Ingegneria Informatica} \\
      \vspace{15mm}
      {\LARGE Tesi Di Laurea} \\
      \vspace{15mm}
      {\HUGE \@titolo} \\
      \vspace{15mm}
      {\large Laureando \\ \textbf{\@autore} \\ Matricola \@matricola} \\
      \vspace{7mm}
%
% scommenta questo blocco...
%
%      {\large Relatore \\ \textbf{\@relatore}} \\
%
% ... oppure scommenta questo blocco
%
      \begin{tabular}{c  @{\hspace{2.5cm}} c}
        Relatore & Correlatore \\
        \textbf{\@relatore} & \textbf{\@correlatore} \\
      \end{tabular} \\
%
      \vfill
      {\large Anno Accademico \@annoAccademico} \\
   \end{center}
   \newpage 
}

% Generazione della DEDICA (posizionata ad un terzo della pagina)
\newcommand{\generaDedica}{
   \thispagestyle{empty}
   \null\vspace{\stretch{1}}
   \begin{flushright}
      \emph{{\@dedica}}
   \end{flushright}
   \vspace{\stretch{2}}\null
   \newpage
}

% Comandi riguardanti l'inserimento di capitoli
\newcommand{\ringraziamenti}[1]{\newpage \chapter*{Ringraziamenti} \input{#1}}
\newcommand{\introduzione}[1]{\newpage \chapter{Introduzione} \input{#1}}
\newcommand{\conclusioni}[1]{\newpage \chapter{Conclusioni e sviluppi futuri} \markboth{CONCLUSIONI E SVILUPPI FUTURI}{CONCLUSIONI E SVILUPPI FUTURI} \input{#1}}
\newcommand{\capitolo}[2]{\newpage \chapter{#1}\label{cap:#2}\input{#2}}

% Comandi riguardanti la generazione di indici
\newcommand{\generaIndice}{
	%\fancyhead[L]{\textbf{\rightmark}}
	\newpage
	\tableofcontents
	\clearpage
	%\fancyhead[L]{\textbf{\leftmark}}
}
\newcommand{\generaIndiceTabelle}{\newpage \listoftables}
\newcommand{\generaIndiceFigure}{\newpage \listoffigures}

% Bibliografia in ordine alfabetico
\let \OldBib \bibliography
\renewcommand{\bibliography}[1]{\newpage \markboth{Bibliografia}{Bibliografia} \OldBib{#1}}
\bibliographystyle{alpha}
