◊(require racket/list)

\mainlanguage[cs]
\setupinteraction
  [state=start,
  title={◊(or (select 'title metas) (select 'h1 doc))},
  author={◊|author|}]

\setuplayout[
  width=fit,
  height=fit,
  backspace=3.8cm,
  topspace=1.6cm,
]

\definelayout[titlepage][
  topspace=0cm,
  header=0cm,
  headerdistance=0cm,
  topdistance=0cm,
  top=0cm,
]

\definemakeup[titlepage][
  align=middle,
  style=\tfa,
]

\definemakeup[bottom][
  bottom=,
  pagestate=start,
]

% make chapter, section bookmarks visible when opening document
\placebookmarks[chapter, section, subsection, subsubsection, subsubsubsection, subsubsubsubsection][chapter, section]
\setupinteractionscreen[option=bookmark]

\setuppagenumbering[location={footer,middle}]
\setupbackend[export=yes]
\setupstructure[state=start,method=auto]

% use microtypography
\definefontfeature[default][default]
  [script=latn,
  protrusion=quality,
  expansion=quality,
  itlc=yes,
  textitalics=yes,
  onum=yes,
  pnum=yes]

\definefontfeature[smallcaps]
  [script=latn,
  protrusion=quality,
  expansion=quality,
  smcp=yes,
  onum=yes,
  pnum=yes]

\setupalign[hz,hanging]
\setupitaliccorrection[global, always]

% use italic as em, not slanted
\setupbodyfontenvironment[default][em=italic]

\definefallbackfamily[mainface][rm][CMU Serif][preset=range:greek, force=yes]
\definefontfamily[mainface][rm][IBM Plex Serif]
\definefontfamily[mainface][mm][IBM Plex Serif]
\definefontfamily[mainface][ss][IBM Plex Sans]
\definefontfamily[mainface][tt][IBM Plex Mono][features=none]
\setupbodyfont[mainface,12pt]

\setupwhitespace[medium]
\setupinterlinespace[line=3.8ex]

\setuphead[section]
  [style={\tfc\setupinterlinespace[line=3.4ex]},
  page=odd,
  align=flushleft]

\setuphead[subsection]
  [style={\tfb\setupinterlinespace[line=3.4ex]},
  align=flushleft]

\setuphead[subsubsection][style=\bf]
\setuphead[subsubsubsection][style=\sc]
\setuphead[subsubsubsubsection][style=\it]

\setuphead[section, subsection][number=yes]
\setuphead[subsubsection][number=no]

\setuplist[section][style=bold]
\setuplist[subsection][margin=1cm]
\setuplist[section, subsection, subsubsection][width=1cm]
\setupcombinedlist[content][list={section,subsection}]

\definedescription
  [description]
  [headstyle=bold,
  style=normal,
  location=hanging,
  width=broad,
  margin=1cm,
  alternative=hanging]

\setupitemize[autointro]% prevent orphan list intro
\setupitemize[indentnext=no]

\setupfloat[figure][default={here,nonumber}]
\setupfloat[table][default={here,nonumber}]

\setupxtable[frame=off]
\setupxtable[head][topframe=on,bottomframe=on]
\setupxtable[body][]
\setupxtable[foot][bottomframe=on]

\definemeasure[cslhangindent][1.5em]
\definenarrower[hangingreferences][left=\measure{cslhangindent}]
\definestartstop[cslreferences][
	before={%
	  \starthangingreferences[left]
      \setupindenting[-\leftskip,yes,first]
      \doindentation
  	},
  	after=\stophangingreferences,
]

\startsectionblockenvironment[frontpart]
\setuppagenumbering[location=]
\stopsectionblockenvironment

\setupdelimitedtext[blockquote][
  before={\blank[line]},
  after={\blank[line]},
  leftmargin=1cm,
  rightmargin=1cm,
]

\starttext

\startbodymatter
◊(apply string-append (filter string? (flatten doc)))
\stopbodymatter

\stoptext
