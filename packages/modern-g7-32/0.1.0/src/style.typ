#import "component/headings.typ": headings,  structural-heading-titles
#import "component/annexes.typ": is-heading-in-annex

#let gost-style(year: none, city: "", hide-title: false, text-size: 14pt, small-text-size: 10pt, indent: 1.25cm, body) = {
  if small-text-size == none { small-text-size = text-size - 4pt }
  [#metadata(small-text-size) <small-text-size>]

  set page(
    margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm)
  )

  set text(
    size: text-size,
    lang: "ru",
    hyphenate: false
  )

  set par(
    justify: true,
    first-line-indent: (
      amount: indent,
      all: true,
    ),
    spacing: 1.5em
  )

  set outline(indent: indent, depth: 3)
  show outline: set block(below: indent / 2)
  show outline.entry: it => {
    show linebreak: [ ]
    if is-heading-in-annex(it.element) {
      let body = it.element.body
      link(
        it.element.location(),
        it.indented(
          none,
          [Приложение #it.prefix() #it.element.body] + sym.space + box(width: 1fr, it.fill) + sym.space + sym.wj + it.page()
        )
      )
    } else {
      it
    }
  }

  set ref(supplement: none)
  set figure.caption(separator: " — ")

  set math.equation(numbering: "(1)")

  show figure: pad.with(bottom: 0.5em)

  show image: set align(center)
  show figure.where(kind: image): set figure(supplement: [Рисунок])

  show figure.where(
    kind: table
  ): it => {
    set block(breakable: true)
    set figure.caption(position: top)
    it
  }
  show figure.caption.where(kind: table): set align(left)
  show table.cell: set align(left)
  // TODO: Расположить table.header по центру и сделать шрифт жирным

  set list(marker: [–], indent: indent, spacing: 1em)
  set enum(indent: indent, spacing: 1em)
  
  set page(footer: context [
    #let page = here().page()
    #align(center)[#{
      if page == 1 {
        if hide-title {page} else {[#city #year]}
      } 
      else {page}
    }]
  ])

  set bibliography(style: "gost-r-705-2008-numeric", title: upper(structural-heading-titles.references))
  
  show: headings(text-size, indent)
  body
}

// type: "alphanumeric" | "american-anthropological-association" | "american-chemical-society" | "american-geophysical-union" | "american-institute-of-aeronautics-and-astronautics" | "american-institute-of-physics" | "american-medical-association" | "american-meteorological-society" | "american-physics-society" | "american-physiological-society" | "american-political-science-association" | "american-psychological-association" | "american-society-for-microbiology" | "american-society-of-civil-engineers" | "american-society-of-mechanical-engineers" | "american-sociological-association" | "angewandte-chemie" | "annual-reviews" | "annual-reviews-author-date" | "associacao-brasileira-de-normas-tecnicas" | "association-for-computing-machinery" | "biomed-central" | "bristol-university-press" | "british-medical-journal" | "cell" | "chicago-author-date" | "chicago-fullnotes" | "chicago-notes" | "copernicus" | "council-of-science-editors" | "council-of-science-editors-author-date" | "current-opinion" | "deutsche-gesellschaft-für-psychologie" | "deutsche-sprache" | "elsevier-harvard" | "elsevier-vancouver" | "elsevier-with-titles" | "frontiers" | "future-medicine" | "future-science" | "gb-7714-2005-numeric" | "gb-7714-2015-author-date" | "gb-7714-2015-note" | "gb-7714-2015-numeric" | "gost-r-705-2008-numeric" | "harvard-cite-them-right" | "institute-of-electrical-and-electronics-engineers" | "institute-of-physics-numeric" | "iso-690-author-date" | "iso-690-numeric" | "karger" | "mary-ann-liebert-vancouver" | "modern-humanities-research-association" | "modern-language-association" | "modern-language-association-8" | "multidisciplinary-digital-publishing-institute" | "nature" | "pensoft" | "public-library-of-science" | "royal-society-of-chemistry" | "sage-vancouver" | "sist02" | "spie" | "springer-basic" | "springer-basic-author-date" | "springer-fachzeitschriften-medizin-psychologie" | "springer-humanities-author-date" | "springer-lecture-notes-in-computer-science" | "springer-mathphys" | "springer-socpsych-author-date" | "springer-vancouver" | "taylor-and-francis-chicago-author-date" | "taylor-and-francis-national-library-of-medicine" | "the-institution-of-engineering-and-technology" | "the-lancet" | "thieme" | "trends" | "turabian-author-date" | "turabian-fullnote-8" | "vancouver" | "vancouver-superscript" | [csl] | bytes | str