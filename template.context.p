◊(require racket/list)

\mainlanguage[cs]
\setupinteraction
  [state=start,
  title={◊(or (select 'title metas) (select 'title doc))},
  author={◊|author|}]

\setuplayout
  [width=fit,
  height=fit,
  backspace=3.2cm,
  topspace=1.4cm]

\placebookmarks[chapter, section, subsection, subsubsection, subsubsubsection, subsubsubsubsection][chapter, section]
\setupinteractionscreen[option=bookmark]

\setuppagenumbering[location={footer,middle}]
\setupbackend[export=yes]
\setupstructure[state=start,method=auto]

◊; \setupheader[style=\tfx]
◊; \setupheadertexts[◊(select 'title-short metas)][◊|author|]

% use microtypography
\definefontfeature[default][default]
  [script=latn,
  protrusion=quality,
  expansion=quality,
  itlc=yes,
  textitalics=yes]

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
\definefontfamily[mainface][rm][Libre Caslon Text]
\definefontfamily[mainface][mm][IBM Plex Serif]
\definefontfamily[mainface][ss][IBM Plex Sans]
\definefontfamily[mainface][tt][IBM Plex Mono][features=none]
\setupbodyfont[mainface,12pt]

\setupwhitespace[medium]
\setupinterlinespace[line=3.2ex]

\setuphead[chapter][style={\tfc\setupinterlinespace[line=3ex]}]
\setuphead[section][style={\bf\setupinterlinespace[line=3ex]}]
\setuphead[subsection][style=\bf]
\setuphead[chapter, section, subsection]
  [number=no,
  align=flushleft]

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
\definestartstop[cslreferences]
  [before={%
	  \starthangingreferences[left]
      \setupindenting[-\leftskip,yes,first]
      \doindentation
  	},
  after=\stophangingreferences]

\setupdelimitedtext[blockquote]
  [before={\blank[line]},
  after={\blank[line]},
  leftmargin=1cm,
  rightmargin=1cm]

\starttext

{\bf ◊(select 'title metas)}
\blank[halfline]
◊|author|

\blank[2*line]

◊(apply string-append (filter string? (flatten doc)))

\stoptext
