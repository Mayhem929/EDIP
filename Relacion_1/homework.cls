\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{homework}[2018/03/12 Sebastiaans Homework package]

% load base class
\LoadClass[a4paper]{article}

% -----------------------------------------------------------------------------
% misc packages required for makeup
\RequirePackage{xcolor} % for other colors than black
\RequirePackage{kvsetkeys} % some improvements on keyval
\RequirePackage{keyval} % to process package options
\RequirePackage[
  % showframe,
  nomarginpar,
  top=1in,
  bottom=1in,
  left=1in,
  right=1in
]{geometry} % tighter margins

% -----------------------------------------------------------------------------
% hidequestions class option definition
\newcommand\question[1]{
  \fbox{\parbox{\dimexpr\linewidth - 2\fboxrule - 2\fboxsep}{#1}}
}

\DeclareOption{hidequestions}{
  \renewcommand\question[1]{}
}

\ProcessOptions\relax

\definecolor{titlecolor}{rgb}{0.0, 0.7, 1.0}
\definecolor{subtitlecolor}{rgb}{0.67, 0.88, 0.69}
% -----------------------------------------------------------------------------
% problem and subproblem definitions
\newcounter{problem}
\newcounter{subproblem}[problem]

\newcommand{\problem}{\@ifstar{\Problem}{\stepcounter{problem}\Problem{\theproblem}}}

% override this to change the appearance of the `Problem' header
\newcommand{\Problem}[1]{
  \setcounter{problem}{#1}
  \par
  {\mbox{\textbf{\Large Problema #1}}
  \leaders\hbox{\colorbox{titlecolor}{\phantom{\Large I}}}\hfill}
  \hspace{-2em}\colorbox{titlecolor}{\phantom{\Large I}}
  \par
}

\newcommand{\subproblem}{\@ifstar{\Subproblem}{\stepcounter{subproblem}\Subproblem{\thesubproblem}}}

% override this to change the appearance of the `Subproblem' header
\newcommand{\Subproblem}[1]{
  \setcounter{subproblem}{#1}
  \par\vspace{.5em}
  {\colorbox{subtitlecolor}{\makebox[\dimexpr\linewidth-2\fboxsep]{
    \textbf{\large Apartado #1} 
  }}}\par
}

% -----------------------------------------------------------------------------
% package option definitions: user, course, and set number
% set default options
\newcommand\@username{username}
\newcommand\@course{course}
\newcommand\@setnumber{0}

% override defaults if provided
\define@key{Homework}{username}{\renewcommand\@username{#1}}
\define@key{Homework}{course}{\renewcommand\@course{#1}}
\define@key{Homework}{setnumber}{\renewcommand\@setnumber{#1}}

\newcommand\homeworksetup{\kvsetkeys{Homework}}


% -----------------------------------------------------------------------------
% mark paragraphs with empty line instead of indented first line
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

% -----------------------------------------------------------------------------
% format for header
\newcommand{\@printtitle}{
  \begin{center}
  {\Large\bf\@course} \par\vspace{.5em}
  %{\Large\bf\@course: Homework set \@setnumber} \par\vspace{.5em}
  {\@username}
  \end{center}
}

% print header at start of document, right after \begin{document}
\let\@olddocument\document
\def\document{\@olddocument\@printtitle}

\endinput