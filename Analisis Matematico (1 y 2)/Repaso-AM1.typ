#set page(margin: -2pt)

#let primaryColor = rgb("#1288A5");
#image("assets/banner.png", width: 100%)
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
    #pad(bottom: -19pt)[#align(center)[
        #square(size: 30pt, fill: rgb("#1288A5"))[

          #pad(4.5pt)[
            #text(fill: white, weight: "bold", size: 10pt)[
              #counter(page).display()
            ]

          ]
        ]
      ]]
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

            #underline[ Si alguno de estas condiciones no se cumpliese: ]
            #set text(13pt);

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

  if title-direction == "center" {
    dir = (bottom-right: 0pt, top-left: 7pt, top-right: 7pt)
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

      #set text(15pt)
      - Una funcion $f$ es continua por izquierda en un valor $a$ si:
      #align(center)[
        #set text(size: 16pt)
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
        #set text(size: 15pt)
        - Una funcion $f$ es continua por derecha en un valor $a$ si:
        #align(center)[
          #set text(size: 16pt)
          $
            lim_(x->a^+)f(x) = f(x)
          $
        ]
      ],
    )

  ],
)

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Continuidad en Intervalo:]]

#v(10pt)

#recuadro(
  title: text(white, size: 15pt, baseline: 8pt, weight: "regular")[Definición], title-width: 25%, height: 13%, title-direction: "left", body: [
    #align(
      center,
    )[
      #set text(size: 15pt)
      - Una funcion $f$ es continua en un intervalo abierto $(a,b)$ si es continua en
        todo #underline()[número del intervalo]
    ]
  ],
)

#recuadro(
  title: text(white, size: 15pt, baseline: 8pt, weight: "regular")[Definición], title-width: 25%, height: 22%, title-direction: "left", body: [
    #align(center)[
      #v(7pt)
      #text(
        size: 15pt,
      )[- Una funcion $f$ es continua en un intervalo abierto $[a,b]$ si:]
      #pad(left: 4%, top: 13%)[
        #set align(left)
        #set text(size: 15pt)
        1. Es continua en todo número del intervalo abierto $(a,b)$
        2. Es continua por #underline[derecha] en $a$
        3. Es continua por #underline[izquierda] en $b$
      ]
    ]
  ],
)

#recuadro(
  title: text(
    white, size: 15pt, baseline: 8pt, weight: "regular",
  )[Propiedades de funciones continuas], title-width: 39%, height: 24%, title-direction: "left", body: [
    #align(
      center,
    )[
      #v(3pt)
      #text(
        size: 15pt,
      )[- Sean $f$ y $g$ continuas en $a$, entonces tambien son continuas en $a$ las
          siguientes funciones:]
      #pad(
        left: 4%, top: 13%,
      )[
        #set align(left)
        #grid(
          columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 30%)[
            #set text(size: 15pt)

            #set par(leading: 0.8em)
            1. $(f + g)(x)$
            2. $(f dot g)(x)$
            3. $c dot f(x), "siendo " c "constante."$
          ], box[
            #set par(leading: 0.9em)
            #set text(size: 15pt)

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
  )[Resultados utiles para demostrar la continuidad], title-width: 59%, height: 26%, title-direction: "left", body: [
    #align(
      center,
    )[
      #v(5pt)
      #text(
        size: 15pt,
      )[- Sea $a$ un punto cualquiera #underline[dentro del dominio] #text(size: 12pt, baseline: -1.3pt)[(sin los extremos)]]
      #pad(
        left: 4%, top: 5%,
      )[
        #set align(left)

        #set text(14pt)
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

#set text(size: 15pt);
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

#v(15pt)
#recuadro(
  title: text(
    white, size: 15pt, baseline: 8pt, weight: "regular",
  )[Teorema del valor intermedio], title-width: 46%, height: 27%, title-direction: "left", body: [
    #pad(
      10pt,
    )[
      #set text(size: 15pt)
      - Si $f$ es continua en el intervalo cerrado $[a,b]$, y $N$ es un número
        estrictamente situado entre $f(a)$ y $f(b)$, entonces existe un número $c in (a,b)$ tal
        que $f(c)=N$

      #underline(offset: 8pt, evade: false)[$f$ continua en [a,b]:]

      #align(center)[
        #pad(top: -6pt)[
          #set text(size: 15pt, style: "italic")
          $
            \ "si" f(a)<N<f(b) or f(b)<N<f(a)\
            => exists c : a<c<b | f(c) = N
          $
        ]
      ]
    ]
  ],
)
#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 15pt, baseline: 8pt, weight: "regular",
    )[Ejemplo en gráfica], title-width: 40%, height: 28%, width: 100%, title-direction: "left", body: [
      #set align(center)
      #pad(top: -11pt)[
        #image("assets/TVINTER.png", height: 78%)
      ]
    ],
  )
]
#subtitle(true)[
  Ejercicios de aplicación:
]

#set text(size: 15pt);

Dada la ecuación $cos(x) = 2x$ demostar que tenga solución en el intervalo $(0,pi/2)$

$
  cos(x) = 2x => cos(x)-2x =0
$

Tomemos la función $f(x)= cos(x) - 2x$ y tomamos el intervalo $[0,pi/2]$
#pad(
  left: 10%,
)[

  - $f(x)$ es continua en $[0,pi/2]$ debido a que tenemos una suma de funciones
    continuas

  #grid(
    columns: (1fr, 1fr), rows: (auto, auto), gutter: 2pt, box(width: 50%)[
      #set text(size: 12.77pt)
      $
        f(0)   &=cos(0) - 0 = 1, #h(15pt) 1>0\
        f(pi/2)&=cos(pi/2) - 2(pi/2) \ &= 0 - pi, #h(15pt) -pi < 0
      $

    ], [#pad(
        top: -21pt,
      )[
        #set par(justify: true)
        #set text(size: 13.4pt)
        por el teorema del valor intermedio,si $f$ es continua en $[0,pi/2]$, puedo
        elegir $N=0$ ya que $f(pi/2)<0<f(0)$, entonces puedo asegurar que existe al
        menos un $c in (0,pi/2)$ tal que $f(c)=0$
      ]
    ],
  )

]

#pagebreak()

#v(15pt)
#recuadro(
  title: text(
    white, size: 16.5pt, baseline: 8pt, weight: "regular",
  )[Teorema de Weierstrass], title-width: 46%, height: 20%, title-direction: "left", body: [
    #pad(
      left: 10pt, top: 7pt, bottom: -2pt,
    )[
      #set par(justify: true)
      - Si $f$ es continua en el intervalo cerrado $[a,b]$, entonces hay al menos dos
        puntos $x_1 "y " x_2$ en el $[a,b]$,tales que:
    ]

    #align(center)[
      #set text(size: 16pt)
      $
        f(x_1)<=f(x)<=f(x_2)$ $forall x in [a,b] $
    ]

    - En otras palabras, $f$ alcanza su valor mínimo y máximo en $[a,b]$
  ],
)

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 8pt, weight: "regular",
    )[Ejemplo en gráfica], title-width: 50%, height: 30%, title-direction: "left", body: [
      #set align(center)
      #pad(top: -10pt, left: -6pt)[
        #image("assets/weiertrass.png", height: 82%)
      ]
    ],
  )
]

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 8pt, weight: "regular",
    )[La importancia de la hipótesis], title-width: 50%, height: 27%, title-direction: "left", body: [
      #set align(center)
      #pad(top: -11pt, left: -6pt)[
        #image("assets/TDW.png", height: 176pt)
      ]
    ],
  )
]

#pagebreak()

#v(15pt)
#underline[#title[2. Derivación:]]

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 4pt, weight: "regular",
    )[Información acerca de $f(x)$], title-width: 50%, height: 44%, title-direction: "left", width: 90%, body: [
      #set text(size: 16pt);
      #pad(
        10pt, left: 12%,
      )[

        #set par(leading: 1em)

        1. Dominio: $DD$om $f$ = ${x in RR | exists f(x)}$
        2. Continuidad en $II$ : $lim_(x->a)f(x) = f(a) , forall a in II$
        3. Discontinuidades evitables y de salto
        4. Discontinuidades esenciales:
          #align(left)[ - Asíntota Vertical en $x=a$:
            $
              lim_(x->a^(#math.plus.minus))f(x) = #math.plus.minus infinity$ ]
        5. Comportamiento en $abs(x)$ grandes:
          #align(left)[- Asíntotas Horizontales en:\ $y=L$ #h(7pt)y/o #h(7pt) $y=M$
            $
              lim_(x->-infinity)f(x)=L " y/o " "" lim_(x->+infinity)f(x)=L$]
      ]
    ],
  )
]

#subtitle(true)[Introducción:]

Sea $m$ las pendientes secantes que pasan por el punto $a$:

#text(
  size: 14pt,
)[$
    m= underbrace((f(x) - f(a))/(x-a), "Cociente incremental") = (#sym.triangle.t f)/(#sym.triangle.t x)
  $
]
y la pendiente en si de la recta tangente se define:

#text(
  size: 14pt,
)[$
    lim_(x->a) (f(x) - f(a))/(x-a) underbrace(" " = " ", x = a+h) lim_(h->0)(f(a+h) - f(a))/h
  $]
#recuadro(
  title: text(
    white, size: 15pt, baseline: 7pt, weight: "regular",
  )[Definición formal de la derivada], title-width: 50%, height: 17%, title-direction: "left", width: 100%, body: [

    Sea $a$ un número en el dominio de $f$, la derivada de la función $f$ en $a$ es
    la #underline[pendiente] de la recta #underline[tangente] a la función en ese
    punto
    $
      (d f)/(d x) = f'(a) = lim_(h->0)(f(a+h) - f(a))/(h)
    $

  ],
)

#pagebreak()

#v(10pt)

#recuadro(
  title: text(white, size: 15pt, baseline: 7pt, weight: "regular")[Observación], title-width: 20%, height: 10%, title-direction: "left", width: 100%, body: [

    #align(
      center,
    )[
      #v(4pt)
      Si $" "exists lim_(h->0)(f(a+h)-f(a))/h$ entonces decimos que $f$ es _diferenciable_ en $a$
    ]
  ],
)

#recuadro(
  title: text(white, size: 15pt, baseline: 7pt, weight: "regular")[Teorema], title-width: 20%, height: 13%, title-direction: "left", width: 100%, body: [

    #align(
      center,
    )[Si $f$ es _diferenciable_ en $a$ entonces $f$ es #underline[continua] en $a$. ]
    #v(14pt)
    #text(
      size: 13pt,
    )[ - Hay que tener en cuenta que no vale la recíproca del teorema ]
  ],
)

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Derivadas laterales:]]
#grid(
  columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, block(
    width: 100%, height: 27%,
  )[
    #recuadro(
      title: text(
        white, size: 11pt, baseline: 8pt, weight: "regular",
      )[Derivada por Izquierda], title-width: 56%, height: 100%, body: [

        #set text(15pt)
        - Si nos acercamos al punto $a$ con valores negativos de $h$, es decir:
        $
          (a+h)<a,
        $
        Entonces:
        #align(center)[
          #set text(size: 16pt)
          $
            f'^- =lim_(h->0^-)(f(a+h) -f(a) )/h
          $
        ]
      ],
    ),

  ], [
    #recuadro(
      title: text(
        white, size: 11pt, baseline: 8pt, weight: "regular",
      )[Derivada por Derecha], title-width: 56%, height: 27%, title-direction: "right", body: [
        #set text(15pt)
        - Si nos acercamos al punto $a$ con valores positivos de $h$, es decir:
        $
          (a+h)>a,
        $
        Entonces:
        #align(center)[
          #set text(size: 16pt)
          $
            f'^+ =lim_(h->0^+)(f(a+h) -f(a) )/h
          $
        ]
      ],
    )

  ],
)

#align(
  center,
)[#recuadro(
    title: text(white, size: 14pt, baseline: 7pt, weight: "regular")[Observación], title-width: 100%, height: 8%, title-direction: "center", width: 50%, body: [

      #align(center)[
        #v(-10%)
        $exists f'(x) <=> f'^-(x) = f'^+(x)$
      ]
    ],
  )

]
#pagebreak()

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 8pt, weight: "regular",
    )[Ejemplo gráfico: La derivada], title-width: 55%, height: 50%, title-direction: "left", body: [
      #set align(center)
      #pad(
        top: -16pt, left: 40pt,
      )[
        #image("assets/Derivada.svg", fit: "stretch", width: 540pt, height: 350pt)
      ]
    ],
  )
]

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Propiedades y Reglas de Derivación:]]

#move(
  dx: 16pt, dy: 10pt,
)[#grid(
    columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 15%)[
      #set text(size: 13pt)
      #set par(leading: 1.2em)

      - $(c)' = 0, forall c in RR$
      - $(f + g)'(x) = f'(x) + g'(x)$
      - $(f dot g)'(x) = f'(x)g(x) + f(x)g'(x)$
      - $(a x + b)'(x) = a$
      - $(1/g(x))'(x)= -(g'(x))/(g(x)^2)$

    ], box[
      #set par(leading: 1.2em)
      #set text(size: 13pt)
      - $(c dot f)'(x) = c dot f'(x), forall c in RR $
      - $(f/g)'(x) = ( f'(x)g(x) - f(x)g'(x) )/(g(x)^2)$, #text(size: 10pt, weight: "extrabold")[$forall$ $g$(x) $!=$ 0]
      - _Si_ $f(x)=x^r => f'(x) = r dot x^(r-1)$
      - $underbrace((f circle.small g)'(x) = f'(g(x)) dot g'(x), "Regla de la cadena")$
      - $(sqrt(g(x)))'(x) = (g'(x))/(2sqrt(g(x)))$

    ],
  )]

#text(primaryColor, size: 20pt)[#sym.square.filled ] #underline[#subtitle(true)[Derivadas trigonométricas, logarítmicas y exponenciales:]]

#move(
  dx: 16pt, dy: 3pt,
)[#grid(
    columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 14%)[
      #set text(size: 13pt)
      #set par(leading: 1em)

      - $(e^g(x))'(x) = g'(x) dot e^g(x) $
      - $(ln g(x))'(x) = (g'(x)) / (g(x)) $
      - $ (x^(g(x)))'(x)= (e^(g(x) dot ln x))'$
      - $(a^x)'(x) = ln (a) dot a^x ,a>0$
      - $(ln x)'(x) = 1/x, x > 0$

    ], box[
      #set par(leading: 1em)
      #set text(size: 13pt)
      - $(e^x)' =e^x$
      - $(log_a(x))'(x) = 1/(ln(a) dot x), a>0 and x>0$
      - $ (sin g(x))' = g'(x) dot cos(g(x)) $
      - $ (cos g(x))' = - g'(x) dot sin(g(x)) $
      - $ (tan g(x))' = sec^2(g(x)) dot g'(x) $
    ],
  )]

#pagebreak()

#v(15pt)

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Derivada de la función inversa:]]

#set text(size: 15pt)

Antes de continuar con la derivada de la función inversa, primero quiero hacer
un breve repaso de los conceptos básicos relevantes para entender este tema.

#align(
  center,
)[
  #image("assets/def.funcion.png", height: 60%, fit: "stretch", width: 110%)

]
#pad(
  left: -20pt, top: -10pt,
)[
  #grid(
    columns: (0.2fr, 0.2fr, 0.2fr), rows: (25%, auto), gutter: 0pt, image("assets/inyectiva.png", width: 110%), image("assets/sobreyectiva.png", fit: "stretch", width: 100%, height: 101%), image("assets/biyectiva.png", fit: "stretch", width: 110%, height: 100%),
  )
]

#pagebreak()

#v(15pt)

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Función inversa:]]

#align(center)[
  #image("assets/fn-inversa.png")
]

#subtitle(true)[Derivada de la función inversa:]

$
  f(f^(-1)(x))                   &= x \
  [f(f^(-1)(x))]'                &= (x)' \
  f'(f^(-1)(x)) dot (f^(-1)(x))' &= 1 \
$
#v(15pt)
#align(
  center,
)[#recuadro(
    title: text(
      white, size: 16pt, baseline: 7pt, weight: "regular",
    )[Despejamos finalmente], width: 60%, height: 10%, title-width: 100%, title-direction: "center", body: [
      #set text(size: 16pt)
      #move(dx: 70pt, dy: -8pt)[$
          (f^(-1)(x))'
          = 1/(f'(f^(-1)(x)))
        $
      ]
    ],
  )]

#pagebreak()

#v(15pt)

#text(primaryColor, size: 20pt)[#sym.square.filled ] #underline[#subtitle(true)[Derivada de funciones trigonometricas inversas:]]

#v(6pt)
#grid(
  columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 7%)[
    #set text(size: 15pt)
    #set par(leading: 1.5em)

    - $(arcsin(x))' = 1/(sqrt(1-x^2)), -1<=x<=1$
    - $(arccos(x))' = -1/(sqrt(1-x^2)), -1<=x<=1 $

  ], box[
    #set par(leading: 1em)
    #set text(size: 15pt)
    - $(arctan(x))' = 1/(1+x^2) $
  ],
)

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Ecuación de la recta tangente:]]

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 8pt, weight: "regular",
    )[Introducción gráfica], title-width: 55%, height: 50%, title-direction: "left", body: [
      #set align(center)
      #pad(
        top: -20pt, left: 40pt,
      )[
        #image(
          "assets/recta-tangente.svg", fit: "contain", width: 540pt, height: 360pt,
        )
      ]
    ],
  )
]
#v(15pt)
#align(
  center,
)[#recuadro(
    title: text(
      white, size: 16pt, baseline: 7pt, weight: "regular",
    )[Ecuación de la recta tangente], width: 60%, height: 10%, title-width: 100%, title-direction: "center", body: [
      #set text(size: 20pt)
      #move(dx: 40pt, dy: 0pt)[$
          y = f'(a)(x-a) + f(a)
        $
      ]
    ],
  )]

#pagebreak()

#v(15pt)

#text(primaryColor, size: 20pt)[#sym.square.filled ] #text(size: 18pt)[#underline[Ejemplo]]

Sea la elipse:
#text(size: 18pt)[$
    (x^2)/(3^2) + (y^2)/(6^2) = 1
  $]
Dar la ecuación de la recta tangente al gráfico de la elipse en el punto $(-1,4sqrt(2))$ \

$
  y^2 = 6^2(1-(x^2)/(3^2)) #h(50pt) y = plus.minus sqrt(6^2-(6^2)/(3^2)x^2)
$

$
  (-1, underbrace((4 sqrt(2) ), "> 0") ) -> #rect(height: 30pt)[#pad(5pt)[$f(x)= sqrt(6^2 -4x^2)$]] #h(50pt)f(-1)=sqrt(6^2-4)=sqrt(32)=4sqrt(2) \

  r=A x+B #h(50pt) A=f'(-1) #h(50pt) f'(x)=1/2 dot (6^2 -2^2x^2)^(-1/2) dot (-8x) \

  f'(-1)=1/(2sqrt(6^2 -2^2)) dot (-8)dot (-1) = 8/(2 dot 4 dot sqrt(2)) = 1/sqrt(2) = #rect(height: 30pt)[#pad(top: 3pt)[$sqrt(2)/2 = A$]] \

  x= 1-> r=f(-1)=4sqrt(2) => 4sqrt(2) = A(-1) + B
  -> 4sqrt(2) = -(sqrt(2))/(2) + B \

  -> B = 4sqrt(2)+(sqrt(2))/(2) = sqrt(2)(4 - 1/2) = #rect(height: 30pt)[#pad(top: 3pt)[$ 9/2 sqrt(2) =B$]]
$
#v(25pt)
#align(
  center,
)[#recuadro(
    title: text(white, size: 16pt, baseline: 7pt, weight: "regular")[Resultado], width: 40%, height: 14.5%, title-width: 100%, title-direction: "center", body: [
      #set text(size: 17pt)
      #move(dx: 19.2pt, dy: 0pt)[$
          r = underbrace(sqrt(2)/2, "A")x + underbrace(9/2 sqrt(2), "B")
        $
      ]
    ],
  )]

#pagebreak()

#v(15pt)

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Derivadas de orden superior:]]
\

La derivada de una función $f$ es una función $f'$ que a su vez puede ser
derivable en ciertos puntos.

La derivada de la derivada se llama #underline()[_Derivada segunda_] y se denota $f'' o f^((2)$

Si se continúa este proceso, se puede definir la *_n-ésima_* derivada, es decir _derivada de orden n_: $f^((n)) $ o
también $(d^n)/(d x^n)f(x) = f^((n))$

#v(15pt)
#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16.5pt, baseline: 8pt, weight: "regular",
    )[Ejemplo Ilustrativo], title-width: 46%, height: 20%, width: 80%, title-direction: "left", body: [
      #move(
        dx: 10%, dy: 3%,
      )[#grid(
          columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 60%)[

            #set text(size: 18pt)
            - $f(x) &= x^4 $

            - $f'(x) &= 4x^3$

            - $f''(x) &= 12x^2$
          ], box[
            #set text(size: 18pt)

            - $f^((3))(x) &= 24x$

            - $f^((4))(x) &= 24$

            - $f^((5))(x) &= 0$

          ],
        )
      ]
    ],
  )
]

#align(center)[_Como se puede observar, se va bajando el grado del monomio_
]

#text(primaryColor, size: 30pt)[#sym.square.filled ] #underline[#title[Diferenciación logarítmica:]]

Esta técnica de derivación facilita en ciertas ocasiones hallar la derivada de
una función $f$; a continuación veremos cómo realizar el procedimiento con un
ejemplo.
#pad(top: -15pt, left: -15pt)[
  $
    f(x) = (x^(5/4) dot sqrt(x^2 + 4))/((4x -2)^2)
  $
]

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 15pt, baseline: 8pt, weight: "regular",
    )[Repaso de propiedades básicas de lo logaritmos y exponencial], title-width: 100%, height: 20%, width: 90%, title-direction: "center", body: [
      #move(
        dx: 07%, dy: 3%,
      )[#grid(
          columns: (1fr, 1fr), rows: (auto, auto), gutter: 20pt, box(width: 100%, height: 60%)[

            #set text(size: 14pt)
            - $ log_a (x dot y) = log_a (x) + log_a (y)$

            - $log_a (x / y) = log_a (x) - log_a (y)$

            - $log_a (x^n) = n dot log_a (x)$
            - $ln(e^x) = x $ y $ e^ln(x) =x$
          ], box[
            #set text(size: 14pt)

            - $log_a (1/x) = -log_a (x)$

            - $log_a (x) = ln(x) / ln(a)$

            - $a^x = e^(x dot ln(a))$

            - $ ln(e) = 1$

          ],
        )
      ]
    ],
  )
]
#pagebreak()

#v(15pt)

Sea
#move(dy: -15pt, dx: 36%)[$
    f(x) = (x^(5/4) dot sqrt(x^2 + 4))/((4x -2)^2)
  $
]
1. Tomar logaritmo natural de ambos lados
$
  ln(f(x)) = ln((x^(5/4) dot sqrt(x^2 + 4))/((4x -2)^2)) underbrace(=, "Prop.Logaritmos") ln(x^(5/4))+ ln(sqrt(x^2+4)) - ln((4x -2)^2) \

  ln(f(x)) = 5/4 dot ln(x) + 1/2 dot ln(x^2 +4) - 2 dot ln((4x-2)^2)
$
\
2. Derivar ambos miembros

$
  (ln(f(x)))' = (5/4 dot ln(x))' + (1/2 dot ln(x^2 +4))' - (2 dot ln((4x-2)^2))'
$

\
3. Despejar $f'(x)$

$
  f'(x) &= f(x) dot (5/(4x) + (x)/((x^2+4)) - 8/(4x -2) ) \
$
#v(30pt)
#align(
  center,
)[#recuadro(
    title: text(white, size: 16pt, baseline: 7pt, weight: "regular")[Resultado], width: 80%, height: 14.5%, title-width: 100%, title-direction: "center", body: [
      #set text(size: 17pt)
      #move(
        dx: 8pt, dy: 4pt,
      )[
        $
          f'(x)=(x^(5/4) dot sqrt(x^2 + 4))/((4x -2)^2) dot (5/(4x) + (x)/((x^2+4)) - 8/(4x -2) )
        $
      ]
    ],
  )]
#v(30pt)

#pagebreak()

#v(15pt)

#underline[#title[3. Análisis de funciones:]]

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 4pt, weight: "regular",
    )[Información acerca de $f(x)$], title-width: 50%, height: 49.5%, title-direction: "left", width: 90%, body: [
      #set text(size: 16pt);
      #pad(
        10pt, left: 12%,
      )[

        #set par(leading: 1em)

        1. Dominio: $DD$om $f$ = ${x in RR | exists f(x)}$
        2. Continuidad en $II$ : $lim_(x->a)f(x) = f(a) , forall a in II$
        3. Discontinuidades evitables y de salto
        4. Discontinuidades esenciales:
          #align(left)[ - Asíntota Vertical en $x=a$:
            $
              lim_(x->a^(#math.plus.minus))f(x) = #math.plus.minus infinity$ ]
        5. Comportamiento en $abs(x)$ grandes:
          #align(left)[- Asíntotas Horizontales en:\ $y=L$ #h(7pt)y/o #h(7pt) $y=M$
            $
              lim_(x->-infinity)f(x)=L " y/o " "" lim_(x->+infinity)f(x)=L$]

        6. Cuando crece y y decrece la funcion #text(
            size: 9pt, baseline: -2pt, fill: blue,
          )[#link((page: 10, x: 1pt, y: 1pt))[(en base a la pendiente)]].
      ]
    ],
  )
]

#recuadro(
  title: text(
    white, size: 15pt, baseline: 7pt, weight: "regular",
  )[Máximos y mínimos absolutos ], title-width: 45%, height: 35%, title-direction: "left", width: 100%, body: [
    #align(
      center,
    )[
      #v(10pt)
      - Una función $f$ tiene un máximo absoluto en un punto $c$ de su dominio si $f(c) >= f(x), forall x in DD"om" f $.
      El punto $c$ se llama *_punto de máximo_* de $f$, y $f(c)$ se llama *_valor de
      máximo_*
      #v(30pt)
      - Una función $f$ tiene un mínimo absoluto en un punto $c$ de su dominio si $f(c) <= f(x), forall x in DD"om" f$;\
      El punto $c$ se llama *_punto de mínimo_* de $f$ y $f(c)$ se llama *_valor de
      mínimo_*
    ]
  ],
)

#pagebreak()
#v(15pt)

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 8pt, weight: "regular",
    )[Ejemplo en gráfica], title-width: 45%, height: 26%, title-direction: "left", body: [
      #set align(center)
      #pad(
        top: -50pt,
      )[
        #image("assets/max-min-abs.png", fit: "contain", width: 440pt, height: 240pt)
      ]
    ],
  )
]

#recuadro(
  title: text(
    white, size: 15pt, baseline: 8pt, weight: "regular",
  )[Máximos y mínimos locales ], title-width: 45%, height: 28%, title-direction: "left", width: 100%, body: [
    #align(
      center,
    )[
      #v(10pt)
      - Una función $f$ tiene un máximo local en un punto $c$ de su dominio si hay un
        intervalo abierto $italic(II)$ que contiene a $c$ tal que $f(c) >= f(x), forall x in II$ \
      El punto $c$ se llama *_punto de máximo local_* de $f$

      #v(20pt)
      - Una función $f$ tiene un mínimo local en un punto $d$ de su dominio si hay un
        intervalo abierto $italic(JJ)$ que contiene a $d$ tal que $f(d) <= f(x), forall x in JJ$ \
        El punto $d$ se llama *_punto de mínimo local_* de $f$
    ]
  ],
)

#align(
  center,
)[
  #recuadro(
    title: text(
      white, size: 16pt, baseline: 8pt, weight: "regular",
    )[Ejemplo en gráfica], title-width: 45%, height: 31%, title-direction: "left", body: [
      #set align(center)
      #pad(
        top: -35pt,
      )[
        #image(
          "assets/max-min-local.png", fit: "contain", width: 340pt, height: 240pt,
        )
      ]
    ],
  )
]

#pagebreak()
#v(15pt)

#recuadro(
  title: text(
    white, size: 15pt, baseline: 8pt, weight: "regular",
  )[Teorema de Fermat ], title-width: 45%, height: 23.5%, title-direction: "left", width: 100%, body: [
    #align(
      center,
    )[
      #v(10pt)
      Si $f$ tiene un extremo local (ya sea máximo o mínimo) en $x = c$ y si $f$ es
      derivable #text(
        size: 8pt, baseline: -4pt, fill: blue,
      )[#link((page: 11, x: 1pt, y: 1pt))[[Véase]] ] en $x=c$, entonces $f'(c) =0$. Es
      decir:
      $
        underbrace("Si" x=c "es extremo" and exists f'(c), "Hipotesis") =>f'(c)=0
      $

      #align(left)[- Es importante aclarar que NO vale la recíproca.]
    ]
  ],
)

#recuadro(
  title: text(
    white, size: 15pt, baseline: 8pt, weight: "regular",
  )[Definición de punto crítico ], title-width: 45%, height: 19%, title-direction: "left", width: 100%, body: [
    #align(
      center,
    )[
      #v(10pt)
      Un punto crítico de una función es un número $c$ del dominio de $f$ tal que $f'(c) = 0 $ ó $f'(c)$ no
      exista, es decir:
      #v(10pt)
      $
        P.C = {x in DD"om" f | f'(x) = 0 or exists.not f'(x) }
      $
    ]
  ],
)

#recuadro(
  title: text(
    white, size: 15pt, baseline: 8pt, weight: "regular",
  )[Máximos y mínimos en intervalos cerrados ], title-width: 65%, height: 34%, title-direction: "left", width: 100%, body: [
    #align(
      center,
    )[
      #v(6pt)
      Podemos encontrar el lugar donde se encuentran el máximo y el mínimo en un
      intervalo cerrado, el #link((page: 9, x: 1pt, y: 1pt))[#text(fill: blue)[Teorema de Weierstrass]] nos
      asegura que existen.

      #move(
        dy: 10pt,
      )[
        #align(
          left,
        )[
          1. Verificar continuidad en el intervalo cerrado

          2. Buscar los puntos críticos

          3. Evaluar la función en los extremos del intervalo y en los $P.C$ que yacen en el
            intervalo

          4. Comparar los valores encontrados y elegir cuál es el máximo y cúal el mínimo.
        ]
      ]
    ]
  ],
)

#pagebreak()

#v(15pt)
#text(primaryColor, size: 20pt)[#sym.square.filled ] #text(size: 18pt)[#underline[Ejemplo]]

- Sea $f(x) = (x^2)/(x+2)$, $x in [-1,2]$
$
  DD"om" f: (- infinity,-2 ) union (-2,infinity) \

  f'(x) = (x^2 +4x)/((x+2)^2), exists f'(x) forall x in DD"om" f \

  P.C: x_c_1 =0, x_c_2=-4,\ x_c_2 in.not [-1,2] \

  f(-1) = 1 , f(2)=1 " y " f(0) =0 \
$
- Tiene máximos absolutos en $x =-1$ y en $x=2$ y tiene mínimo absoluto\ en $x=0$
#pagebreak()
#v(15pt)
#recuadro(
  title: text(
    white, size: 14pt, baseline: 4pt, weight: "regular",
  )[Extremos absolutos en $RR$ ], title-width: 37%, height: 39%, title-direction: "left", width: 100%, body: [
    #align(
      left,
    )[

      En este caso no podremos aplicar el #link((page: 9, x: 1pt, y: 1pt))[#text(fill: blue)[Teorema de Weierstrass]] por
      lo que a continuación se listarán algunos criterios para saber cuando la función
      no tiene máximos ni mínimos absolutos.

      - Si $lim_(x ->+infinity) f(x) = +infinity or lim_(x ->-infinity) f(x) = +infinity$ $=>$ $f(x)$ NO
        tiene máximo absoluto.

      - Si $lim_(x ->+infinity) f(x) = -infinity or lim_(x ->-infinity) f(x) = -infinity$ $=>$ $f(x)$ NO
        tiene mínimo absoluto.

      - Si $f(x)$ tiene $A.V$ tampoco tendrá máximos o mínimos absolutos (esto
        dependiendo del valor de los límites alrededor de las $A.V$ )
      \
      Es importante aclarar que PUEDE tener máximos o mínimos locales. ]
  ],
)

#align(
  center,
)[
  #recuadro(
    title: text(white, size: 14pt, baseline: 8pt, weight: "regular")[Teorema de Rolle], title-width: 37%, height: 28%, title-direction: "left", width: 83%, body: [
      #align(left)[
        #v(10pt)
        Sea $f$ una función tal que:
        #move(dx: 30%)[
          1. $f$ es continua en [a,b]

          2. $f$ es derivable en (a,b)

          3. $f(a) = f(b)$
        ]
        \
        Entonces, existe al menos un valor $c in (a,b)$ tal que $f'(c)=0$
      ]
    ],
  )
]

#align(
  center,
)[
  #recuadro(
    title: text(white, size: 15pt, baseline: 8pt, weight: "regular")[Definición], title-width: 32%, height: 14%, title-direction: "left", width: 83%, body: [
      #align(
        center,
      )[
        #v(0pt)
        #move(dx: -28%)[Sea $f$ una función _*buena*_ si:]
        #v(3pt)
        #grid(
          columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box(width: 100%, height: 60%)[

            1. $f$ es continua en [a,b]

          ], box[

            2. $f$ es derivable en (a,b)

          ],
        )
      ]
    ],
  )
]

#pagebreak()

#v(15pt)

