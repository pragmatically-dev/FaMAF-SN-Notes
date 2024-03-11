#set page(margin: -2pt)

#let primaryColor = rgb("#1288A5");
#image("assets/banner.png")
#counter(page).update(0)
#pagebreak()
#set text(font: "Cambria")

#set page(
  paper: "a4", margin: (top: 46pt, left: 40pt, right: 40pt, bottom: 35pt), header: [
    #set text(size: 11pt)

    Notas de clase - Análisis Matemático II
    #h(1fr)
    _Santiago Emanuel Nieva_
  ], numbering: "1", footer: [
    #align(center)[
      #square(size: 30pt, fill: rgb("#1288A5"))[

        #pad(4.5pt)[
          #text(fill: white, weight: "bold", size: 10pt)[
            #counter(page).display()
          ]

        ]
      ]
    ]
  ],
)

#set align(center)

#v(50%)
= Intencionalmente dejada en blanco

#pagebreak()

#set align(center)

#v(50%)
= Intencionalmente dejada en blanco

#pagebreak()

#v(15pt)
#align(left)[
  #text(size: 36pt)[
    #underline(offset: 5pt, stroke: 1.2pt + primaryColor)[Breve repaso]
  ]
]

#set align(left);
#v(-10pt)

#set enum(
  numbering: (..args) => box(
    inset: (x: 0.25em), outset: (y: 0.25em), fill: primaryColor, text(white, baseline: 0pt)[#args.pos().first()],
  ),
)

#set list(
  marker: box(width: 0.3em, height: 0.3em, fill: primaryColor, baseline: .6em, [ ]),
)

#set underline(stroke: 1.3pt + primaryColor, offset: 4pt)

#let title(body)={
  text(size: 25pt, baseline: -2pt)[#body]
}

#text(size: 18pt)[
  + #title[Continuidad]
    #set text(size: 17pt)
    - En un punto
    - En un intervalo
    - Ejemplos
    - #underline[Teorema del Valor intermedio]:
      - Enunciado
      - Aplicación
    - #underline[Teorema de Weierstrass]:
      - Enunciado
  + #title[Derivación]
    #set text(size: 17pt)
    - Definición de derivadas, interpretacion geométrica
    - Reglas de Derivación
    - Derivada de funciones trigonométricas
    - Derivadas de exponenciales y logaritmos
    - #underline[Derivada de la función inversa]
      - Funciones trigonométricas inversas
    - Ecuación de la recta tangente
    - Derivadas de orden superior
    - Diferenciación logaritmica

  + #title[Análisis de funciones]
    #set text(size: 17pt)
    - Información a partir de $f(x)$
    - Información a partir de $f'(x)$
    - Información a partir de $f''(x)$
    - #underline[Ejemplos]:
      - Análisis completo y gráfica de $f(x)= -x^4+2x^2+3$
      - Análisis completo y gráfica de $f(x)= (x^2 + 1)/ (x^2 - 1)$

]

#pagebreak()

#v(20pt)

#let subtitle(sub, body)={
  if sub {
    underline[#text(size: 18pt)[#body]]
  } else {
    text(size: 18pt)[#body]
  }
}

#underline[#title[1. Continuidad:]]

//BOX: Continuidad en un punto
#box(
  width: 100%, height: auto, stroke: 1.9pt + primaryColor, radius: 7pt,
)[
  #align(
    left,
  )[
    #pad(
      top: 0pt, left: 0pt, right: 3pt,
    )[
      #box(
        width: 40%, height: 27pt, stroke: 1.3pt + primaryColor, radius: (bottom-right: 7pt, top-left: 7pt), fill: primaryColor,
      )[
        #align(center)[
          #text(
            size: 17pt, baseline: 0.4em, fill: white, weight: "regular",
          )[Continuidad en un punto]
        ]
      ]
      #set text(size: 15pt)
      #pad(
        left: 15pt, top: -5pt,
      )[
        - Una función $f$ es continua en un valor si:
        #align(center)[
          #set text(size: 16pt)
          $
            lim_(x->a)\f(x) = f(a)
          $
        ]
        #set text(size: 15pt)
        #underline[- Condiciones:]
        #v(3pt)

        #pad(left: 13pt)[#align(left)[
            #block[
              #set text(size: 13pt)
              #set align(left)
              1. $f$ debe estar definida en $x = a$:
                - $a in DD"om"$ de $f$ $=>$ $exists f(a)$
              2. Tiene que existir el limite de $f$ #underline[alrededor] de $a$
                - $
                    exists lim_(x->a)f(x)
                  $
              3. $f$ esta definida en un intervalo abierto que contiene a $a$
              4. Los limites laterales son iguales:
                #set text(size: 16pt)
                #pad(left: 25%, top: -6pt)[
                  - $
                      lim_(x->a^-) f(x) = lim_(x->a^+) f(x) = lim_(x->a) f(x)
                    $
                ]
            ]

            #v(3pt)

            #subtitle(true)[ Si alguno de estas condiciones no se cumpliese: ]

            - Diremos que $f$ es #underline[discontinua] en $a$
              #v(20pt)

          ]
        ]
      ]
    ]
  ]
]

//BOX: Continuidad en un punto
#box(
  width: 100%, height: 40%, stroke: 1.9pt + primaryColor, radius: 7pt,
)[
  #align(
    left,
  )[
    #pad(
      top: 0pt, left: 0pt, right: 3pt, bottom: 3pt,
    )[
      #box(
        width: 40%, height: 27pt, stroke: 1.3pt + primaryColor, radius: (bottom-right: 7pt, top-left: 7pt), fill: primaryColor,
      )[
        #align(center)[
          #text(
            size: 16pt, baseline: 0.46em, fill: white, weight: "regular",
          )[Tipos de discontinuidades]
        ]
      ]
      #set text(size: 15pt)
      #pad(
        left: 2pt, right: 2pt, top: -13pt,
      )[ #image("assets/TD-transformed.png", fit: "cover") ]

    ]
  ]
]

#pagebreak()
\

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Continuidad lateral:]]

#v(12pt)

#let recuadro(
  width: 100%, height: 30%, title-direction: "left", radius: 7pt, title: text["Default Title"], baseline: 0.6em, title-width: 45%, title-height: 27pt, body: text("Your text here"),
) = {
  let dir = ();
  let alignAux = left;
  if title-direction == "left" {
    dir = (bottom-right: 7pt, top-left: 7pt)
  } else {
    dir = (top-right: 7pt, bottom-left: 7pt)
    alignAux = right
  }

  box(
    width: width, height: height, stroke: 1.9pt + primaryColor, radius: radius,
  )[
    #align(
      alignAux,
    )[
      #pad(
        top: 0pt, left: 0pt, right: 0pt, bottom: 3pt,
      )[
        #box(
          width: title-width, height: title-height, stroke: 1.3pt + primaryColor, radius: dir, fill: primaryColor,
        )[
          #align(center)[
            #title
          ]
        ]
        #set text(size: 15pt)
        #pad(left: 1em, right: 1em, top: -0.4em)[
          #set align(left)
          #body
        ]

      ]
    ]
  ]
}

#grid(
  columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, block(width: 100%, height: 18%)[
    #recuadro(title: text(
      white, size: 11pt, baseline: 8pt, weight: "regular",
    )[Continuidad por Izquierda], title-width: 56%, height: 100%, body: [
      - Una funcion $f$ es continua por izquierda en un valor $a$ si:
      #align(center)[
        #set text(size: 18pt)
        $
          lim_(x->a^-)f(x) = f(x)
        $
      ]
    ]),

  ], [
    #recuadro(
      title: text(
        white, size: 11pt, baseline: 8pt, weight: "regular",
      )[Continuidad por Derecha], title-width: 56%, height: 18%, title-direction: "right", body: [
        - Una funcion $f$ es continua por derecha en un valor $a$ si:
        #align(center)[
          #set text(size: 18pt)
          $
            lim_(x->a^+)f(x) = f(x)
          $
        ]
      ],
    )

  ],
)

\
#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Continuidad en Intervalo:]]

#v(10pt)

#recuadro(
  title: text(white, size: 16pt, baseline: 8pt, weight: "regular")[Definición], title-width: 25%, height: 13%, title-direction: "left", body: [
    #align(
      center,
    )[
      - Una funcion $f$ es continua en un intervalo abierto $(a,b)$ si es continua en
        todo #underline()[número del intervalo]
    ]
  ],
)

#recuadro(
  title: text(white, size: 16pt, baseline: 8pt, weight: "regular")[Definición], title-width: 25%, height: 22%, title-direction: "left", body: [
    #align(center)[
      #v(7pt)
      #text(
        size: 16pt,
      )[- Una funcion $f$ es continua en un intervalo abierto $[a,b]$ si:]
      #pad(left: 4%, top: 13%)[
        #set align(left)
        1. Es continua en todo número del intervalo abierto $(a,b)$
        2. Es continua por #underline[derecha] en $a$
        3. Es continua por #underline[izquierda] en $b$
      ]
    ]
  ],
)

#recuadro(
  title: text(
    white, size: 16pt, baseline: 8pt, weight: "regular",
  )[Propiedades de funciones continuas], title-width: 39%, height: 24%, title-direction: "left", body: [
    #align(
      center,
    )[
      #v(3pt)
      #text(
        size: 16pt,
      )[- Sean $f$ y $g$ continuas en $a$, entonces tambien son continuas en $a$ las
          siguientes funciones:]
      #pad(
        left: 4%, top: 13%,
      )[
        #set align(left)
        #grid(
          columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 30%)[
            #set par(leading: 0.8em)
            1. $(f + g)(x)$
            2. $(f dot g)(x)$
            3. $c dot f(x), "siendo " c "constante."$
          ], box[
            #set par(leading: 0.9em)

            4. $(f/g)(x)$ _, si_ $g(a) != 0$
            5. $(f circle.small g)(x),$_si $f$ es continua en $g(a)$_
          ],
        )
      ]
    ]
  ],
)

#pagebreak()

#v(15pt)
#recuadro(
  title: text(
    white, size: 14pt, baseline: 8pt, weight: "regular",
  )[Resultados utiles para demostrar la continuidad], title-width: 59%, height: 30%, title-direction: "left", body: [
    #align(
      center,
    )[
      #v(5pt)
      #text(
        size: 18pt,
      )[- Sea $a$ un punto cualquiera #underline[dentro del dominio] #text(size: 12pt, baseline: -1.3pt)[(sin los extremos)]]
      #pad(
        left: 4%, top: 5%,
      )[
        #set align(left)

        #set text(14.6pt)
        #grid(
          columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(
            width: 100%, height: 30%,
          )[

            1. Los polinomios son continuos en $RR$

            \
            2. Toda función racional es continua en cualquier punto de #underline[su dominio]

          ], box[

            3. La radicación es continua en los puntos de su dominio\ #text(size: 12pt, baseline: -1.3pt)[(sin los extremos)]

            4. Las funciones trigonométricas $sin(x)$ y $cos(x)$ son continuas en $RR$
          ],
        )
      ]
    ]
  ],
)

#subtitle(true)[Ejercicios resueltos]

#set text(size: 14pt);
Usando la definición de continuidad y las propiedades de los limites:
- Demostrar que $f$ es continua en $a$ :
$
  f(x) = root(3, 3 dot.op x^2), #h(20pt)a = 3
$

#align(
  left,
)[
  #grid(
    columns: (1fr, 1fr), rows: (auto, auto), gutter: 2pt, box(width: 100%, height: 20%)[

      #subtitle(true)[Recordamos]
      #set text(size: 15pt)
      #set par(leading: 1.4em)
      1. $a in DD"om" f => f(a)$
      2. $exists lim_(x->a) f(x) $
      3. $f(a) = lim_(x->a)f(x)$

    ], box[
      #subtitle(true)[Resuelvo:]
      #set text(size: 15pt)
      #set align(left)
      $DD$om $f$ = $RR$,

      $f(3) = root(3, 3 dot.op (3^2))$
      $ = root(3, 27) = 3$ #h(10pt) #emoji.checkmark

      $lim_(x->a) root(3, 3 dot.op x^2) =_"prop.Raiz " root(3, lim_(x->a) (3 dot.op x^2))$

      $=_"prop.poliomio" root(3, 3 dot.op 3^2) = 3$ #h(10pt) #emoji.checkmark
    ],
  )
]
#v(2em)
#align(center)[
  #underline(
    offset: 10pt, evade: false,
  )[#text(size: 16pt)[ $f(x)$ es continua en $a=3$ ]]
]

#pagebreak()

ho