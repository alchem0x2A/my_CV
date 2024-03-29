%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{cv}[2019/04/04 My Personal cv LaTeX class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class optio-ns
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
\RequirePackage{booktabs, cellspace, tabularx, makecell}
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome

% --------------------------------------------------------------------------------
% Use Font Packages
% --------------------------------------------------------------------------------
\RequirePackage{fontawesome5} % Use fontawesome5 instead of version 4
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir                        %Default to be fonts/ as defined


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=0.75in, top=0.5in, right=0.75in, bottom=0.5in, footskip=0.25in}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{444444}
\definecolor{lightgray}{HTML}{777777}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{my-burgonde}{HTML}{AC3B61}
\definecolor{my-aqua}{HTML}{18678f}
\definecolor{my-concrete}{HTML}{BAB2B5}
\definecolor{my-pale}{HTML}{EEE2DC}
\definecolor{my-pink}{HTML}{EDC7B7}
\definecolor{my-purple}{HTML}{743481}
% Main theme color
\colorlet{main}{my-aqua}
% \colorlet{main}{gray}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Awesome section color
% \def\@sectioncolor#1#2#3{%
  % \ifbool{acvSectionColorHighlight}
  % {{\color{main}#1#2#3}}{#1#2#3}%
% }

\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}
  {{\color{main}#1}#2#3}{#1#2#3}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------

\newfontfamily\headerfont[
  Extension=.otf,
  UprightFont=*-Light,
  ItalicFont=*-LightItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{FiraSans}

\newfontfamily\headerfontlight[
  UprightFont=*-ExtraLight,
  ItalicFont=*-ExtraLightItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{FiraSans}

\newfontfamily\bodyfont[
  Extension=.otf,
  UprightFont=*-Light,
  ItalicFont=*-LightItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{FiraSans}


% \newcommand*{\footerfont}{\sourcesanspro}
% \newcommand*{\bodyfont}{\sourcesanspro}
% \newcommand*{\bodyfontlight}{\sourcesansprolight}

% --------------------------------------------------------------------------------
% Change to Plex Fonts
% --------------------------------------------------------------------------------
\newcommand*{\footerfont}{\headerfontlight}
% \newcommand*{\bodyfont}{\}
\newcommand*{\bodyfontlight}{\headerfontlight}
\newcommand*{\bodyfontsans}{\bodyfont}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\huge \bfseries \scshape \headerfont\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\huge \bfseries \scshape\headerfont\color{text} #1}}
% \newcommand*{\headerpositionstyle}[1]{{\fontsize{10pt}{1em}\scshape\bodyfontsans\color{main} #1}}
\newcommand*{\headerpositionstyle}[1]{{\large \headerfont\color{graytext} #1}}
\newcommand*{\headeraddressstyle}[1]{{\large \headerfont\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\scriptsize \headerfont\color{main} #1}}
\newcommand*{\headerquotestyle}[1]{{\small \bodyfont\itshape\color{graytext} #1}}
\newcommand*{\footerstyle}[1]{{\footnotesize \footerfont\scshape\color{graytext} #1}}
% \newcommand*{\sectionstyle}[1]{{\Large \bodyfont\bfseries\@sectioncolor #1}}
\newcommand*{\sectionstyle}[1]{{\Large \bodyfont\bfseries\textcolor{main}{#1}}}
\newcommand*{\subsectionstyle}[1]{{\large \bodyfont\scshape\textcolor{graytext}{#1}}}
\newcommand*{\paragraphstyle}{\normalsize \bodyfont\upshape\color{graytext}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\normalsize \bodyfont\bfseries\color{text} #1}}
\newcommand*{\entrypositionstyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\descriptionstyle}[1]{{\normalsize \bodyfont\upshape\color{graytext} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\small \bodyfont\mdseries\color{text} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\small \bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\small \bodyfont\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\small \bodyfont\slshape\color{main} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\small \bodyfont\upshape\color{graytext} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\normalsize \bodyfont\bfseries\color{graytext} #1}}
\newcommand*{\honordatestyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\normalsize \bodyfont\slshape\color{main} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\normalsize \bodyfont\bfseries\color{graytext} #1}}
\newcommand*{\skillsetstyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}

% References
\newcommand*{\refnamestyle}[1]{{\large \bodyfont\bfseries\color{graytext} #1}}
\newcommand*{\refaddressstyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\refcontactstyle}[1]{{\normalsize \bodyfont\color{my-aqua} #1}}

% For elements of the cover letter

\newcommand*{\letterfirstnamestyle}[1]{{\Large \bfseries \headerfont\color{text} #1}}
\newcommand*{\letterlastnamestyle}[1]{{\Large \bfseries \headerfont\color{text} #1}}
% \newcommand*{\headerpositionstyle}[1]{{\fontsize{10pt}{1em}\scshape\bodyfontsans\color{main} #1}}
\newcommand*{\letterpositionstyle}[1]{{\normalsize \headerfont\color{graytext} #1}}
\newcommand*{\letteraddressstyle}[1]{{\normalsize \headerfont\color{graytext} #1}}
\newcommand*{\lettersocialstyle}[1]{{\normalsize \headerfont\color{main} #1}}
\newcommand*{\letterquotestyle}[1]{{\small \bodyfont\itshape\color{graytext} #1}}
\newcommand*{\lettersectionstyle}[1]{{\large \bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\normalsize \bodyfont \color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\normalsize \bodyfont \color{graytext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\normalsize \bodyfont\bfseries\color{graytext} #1}}
\newcommand*{\letterdatestyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\normalsize \bodyfont\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\normalsize \bodyfont\color{graytext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\normalsize \bodyfont\slshape\color{graytext} #1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[2]{\def\@homepageurl{#1}\def\@homepagedisplayname{#2}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[2]{\def\@githubid{#1}\def\@githubdisplayname{#2}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}
\newcommand{\tabitem}{~~\llap{\textbullet}~~}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
        {\setlength{\photodim}{1.3cm}}%
        {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
        {\def\@photoborder{darkgray}}%
        {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}%
        {}%
        {%
          \faPhoneSquare\acvHeaderIconSep\@mobile%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{mailto:\@email}{\faEnvelope\acvHeaderIconSep\@email}%
        }%
      \ifthenelse{\isundefined{\@homepageurl}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{\@homepageurl}{\faHome\acvHeaderIconSep\@homepagedisplayname}%
        }%
      \ifthenelse{\isundefined{\@githubid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}       \href{https://github.com/\@githubid}{\faGithub\acvHeaderIconSep\@githubdisplayname}%
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\acvHeaderIconSep{}LinkedIn}%
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}%
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \faSkype\acvHeaderIconSep\@skype%
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}%
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}
        }%
      \ifthenelse{\isundefined{\@medium}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://medium.com/@\@medium}{\faMedium\acvHeaderIconSep\@medium}%
        }%
      \ifthenelse{\isundefined{\@googlescholarid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://scholar.google.com/citations?user=\@googlescholarid}{\faHome\acvHeaderIconSep\@googlescholarname}%
        }%
      \ifthenelse{\isundefined{\@extrainfo}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \@extrainfo%
        }%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
      {}%
      {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  % \color{gray}\vhrulefill{0.9pt}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  % \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  % \vspace{2mm}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}[t]{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
      {\entrytitlestyle{#2} & \entrydatestyle{#4} \\
       \entrypositionstyle{#1} & {} \\}
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
}{%
  \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}[t]{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
      {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}
      L{\textwidth - 2cm} R{2cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[2]{%
\honortitlestyle{\tabitem{}#1} & \honordatestyle{#2} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{5pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  % \makecell[tl]{\skilltypestyle{#1}} & \makecell[tl]{\skillsetstyle{#2}} \\
    \makecell[tl]{\skilltypestyle{#1}} & \skillsetstyle{\makecell[tl]{#2}} \\
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  % \vspace{-4.0mm}
}

\newenvironment{cvenum}{%
  \vspace{-4.0mm}
  \begin{justify}
    \begin{enumerate}[leftmargin=4ex, rightmargin=2ex,
      nosep, noitemsep]
    \setlength{\parskip}{1pt}
    % \renewcommand{\labelitemi}{\bullet}
}{%
  \end{enumerate}
  \end{justify}
  % \vspace{-4.0mm}
}

\newenvironment{cvtalks}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength\abovetopsep{0pt}
    \setlength\belowrulesep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}
      L{\textwidth - 4cm} R{4cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvtalk}[4]{%
  \honortitlestyle{\tabitem{}#1} &\subentrylocationstyle{#3} \\
  \subdescriptionstyle{\quad #2} & \honordatestyle{#4} \\
}


%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
  \lettertextstyle
}{%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  % \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
}

\newcommand*{\makeletterheader}[1][C]{%
  % \newlength{\headertextwidth}{\textwidth}
  % \newlength{\headerphotowidth}
   \begin{minipage}[c]{\textwidth} \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \letterfirstnamestyle{\@firstname}\letterlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\letterpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\letteraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%

    \ifthenelse{\isundefined{\@email}}{}{\lettersocialstyle{\faEnvelope\acvHeaderIconSep\@email\\[\acvHeaderAfterAddressSkip]}}%

    \ifthenelse{\isundefined{\@mobile}}{}{\lettersocialstyle{\faPhoneSquare\acvHeaderIconSep\@mobile\\[\acvHeaderAfterAddressSkip]}}%
    \end{minipage}
    
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \vspace{-0.5em} \recipientaddressstyle{\@recipientaddress} 
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}
    {}
    {\vspace{1em}\lettertitlestyle{\@lettertitle}\\\\}
  % \vspace{2em}
  \lettertextstyle{\@letteropening}
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  \vspace{1em}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname\ \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}
    {\\}
    {%
      \vspace{1em}
      \letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
    }
}

%-------------------------------------------------------------------------------
%                Bibliography
%-------------------------------------------------------------------------------
%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
\RequirePackage[ % BibLaTeX
	sorting=none, % Sorts entries by year (descending order), name, title
	style=chem-acs,
  articletitle=true,
	doi=false,
	isbn=false,
	url=false,
	eprint=false,
	backref = false, % include back references in bibliography
	maxcitenames=3, % affects only the citations in the document body
	maxbibnames=99, % affects only the bibliography, pass 99 to print all
	hyperref=true,
	% block=ragged,
  block=none,
	backend=biber % {Options: bibtex, biber}
	]{biblatex}

        
        

% Avoid splitting entries across page break (only for 3 or fewer lines)
% Tip: http://tex.stackexchange.com/a/51261
\AtBeginEnvironment{thebibliography}{%
   \clubpenalty10000
   \@clubpenalty \clubpenalty
   \widowpenalty10000
   \interlinepenalty5000}


% --------------------------------------------------------------------------------
% Customized bibliography formats
%-------------------------------------------------------------------------------- 
% Customized format, based on Fancy CV template created by Adrien Friggeri
\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}
\DeclareFieldFormat[incollection]{title}{#1\par}
\DeclareFieldFormat[unpublished]{title}{#1\par}
\DefineBibliographyStrings{english}{%
  url = {\underline{link}},
}
\DeclareFieldFormat{url}{%
  \ifhyperref
    {\href{#1}{\bibstring{url}}}
    {\url{#1}}
}


\DeclareFieldFormat{labelnumberwidth}{
  \normalsize\bodyfont\color{graytext}
  #1\adddot}

% \DeclareFieldInputHandler{journaltitle}{%
%   \def\NewValue{\JournalTitle{#1}}}

\DeclareBibliographyDriver{article}{%
  {\small \bodyfont \printfield{title}}
  %  \par}%
  \newblock%
  {\small \bodyfont \color{graytext}
  \hspace{-0.4em} 
  \printnames{author} 
  \par}
  \newblock
  % \printfield{title}
  {
  \small \bodyfont \color{graytext}
  \usebibmacro{journal+issuetitle}%
  \printfield{pages}%
  \newunit%
  \setunit{\space}%
  \small \bodyfont\color{my-aqua}
  \printfield{url}
  \par
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  {\small \bodyfont%
  \printfield{title}}%
  \newblock%
  {\small \bodyfont \color{graytext}
  \hspace{-0.4em} \printnames{author}%
  \par}%
  \newblock%
  {%
    \small \bodyfont\color{graytext}%
    \setunit{\space}%
    \printfield{booktitle}%
    \setunit{\space}%
    \textbf{\printfield{year}}%
    \newunit%
    \setunit{\space}%
    \small \bodyfont\color{my-aqua}
    \printfield{url}
    \par
  }
  \par\vspace{0.3\baselineskip}
}

% \DeclareBibliographyDriver{unpublished}{%
%   {\small \bodyfont%
%   \printfield{title}}%
%   % \newblock%
%   {\small \bodyfont \color{graytext}
%   \hspace{-0.5em} \printnames{author}%
%   \par}%
%   {\small \bodyfont
%   \printfield{journaltitle}
%   \par\vspace{0.3\baselineskip}}
% }




\renewcommand*{\mkbibcompletename}[1]{
\ifitemannotation{highlight}
{%
{\textbf{#1}}%
}%
{%
\ifitemannotation{corr-highlight}%
{\textbf{#1}\textsuperscript{*}}%
{%
\ifitemannotation{coauth-highlight}
{\textbf{#1}\textsuperscript{\textdagger}}
{%
\ifitemannotation{coauth}
{#1\textsuperscript{\textdagger}}%
{#1}%
}%
}  
}
}




% --------------------------------------------------------------------------------
% Typesetting for references
% --------------------------------------------------------------------------------
\newenvironment{cvrefs}{
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
}
{
  \par
}


\newcommand*{\cvref}[5]{
  \begin{minipage}[t]{1.0\textwidth}
  {\refnamestyle{#1} \par}          %Reference name
    % \vspace{1em}
  {\refaddressstyle{#2} \\ %address 1
  \refaddressstyle{#3} \\ %address 2
  \refcontactstyle{\faEnvelope\acvHeaderIconSep\href{mailto:#4}{#4}}
  \ifempty{#5}{}
  {\\ \refcontactstyle{\faHome\acvHeaderIconSep\href{#5}{#5}}}
  \par}
  \end{minipage}
  % \vskip{2.5em}
}