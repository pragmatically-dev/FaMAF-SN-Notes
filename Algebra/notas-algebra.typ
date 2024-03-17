#import "@preview/cetz:0.2.1"

#set page(margin: -2pt)

#let primaryColor = rgb("#1288A5");
#image("assets/banner.png", width: 100%)
#counter(page).update(0)
#pagebreak()
#set text(font: "Cambria")

#set page(
  paper: "a4", margin: (top: 46pt, left: 40pt, right: 40pt, bottom: 35pt), header: move(dy: 4pt)[
    #set text(size: 12pt)

    Notas de clase - Álgebra Lineal
    #h(1fr)
    _Santiago Emanuel Nieva_
    #move(dy: -5pt)[ #line(stroke: 1.1pt + primaryColor, length: 100%) ]
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

#set enum(
  numbering: (..args) => box(
    inset: (x: 0.25em), outset: (y: 0.25em), fill: primaryColor, text(white, baseline: 0pt)[#args.pos().first()],
  ),
)

#set list(
  marker: box(width: 0.3em, height: 0.3em, fill: primaryColor, baseline: .6em, [ ]),
)

#set underline(stroke: 1.3pt + primaryColor, offset: 4.5pt)

#let vspace()={ v(15pt) }
#let bodyTextSize = 12pt;
#let mathTextSize = 14pt;
#let captionTextSize = 15pt;
#let title(underlined: true, body)={
  if underlined {
    underline()[
      #text(size: 25pt, baseline: -.14em)[#body]
    ]
  } else {
    text(size: 25pt, baseline: -.14em)[#body]
  }
}

#let subtitle(underlined: true, size: 20pt, body)={
  if underlined {
    underline()[
      #text(size: size, baseline: -.14em)[#body]
    ]
  } else {
    text(size: size, baseline: -.14em)[#body]
  }
}

#let mate(body)={
  text(size: mathTextSize)[$
      #body
    $
  ]
}
#vspace()
#title[0. Números complejos:]

#set text(size: bodyTextSize)

Al conjunto de los números complejos se los denota como $CC$ y está definido por
#text(size: mathTextSize)[$
    CC = {a+b i | a,b in RR}
  $
]

sea $z=a+b dot i$ un número complejo denotamos _parte real_ de $z$ a $a$ y parte
imaginaria de $z$ a $b$ de la siguiente manera

#text(size: mathTextSize)[
  $
    Re(z) = a "  y   " "  " Im(z)=b
  $
]

Los números reales están contenidos en $CC$, son aquellos cuya parte imaginaria
es nula, es decir

#text(size: mathTextSize)[
  $
    RR = {z in CC | Im(z)= 0}
  $
]

#subtitle[ Operaciones en los Complejos: ]

1. La suma de define de la siguiente manera:

#mate[
  $(a+b i) + (c + d i ) = (a+c)+(b+d) i$
]

2. El producto:

  - Recordamos que $i^2 = -1$
 
#mate[$
    (a + b i ) dot (c + d i ) &= a c + a d i + b c i +b d i^2 \ &=a c + b d(-1) + (a d + b c )i \
                              &=(a c - b d) + (a d + b c)i
  $] 

#subtitle[Cumple con los axiomas de cuerpo:]

- La suma y el producto son asociativos y conmutativos.
- El producto es distributivo con respecto a la suma
- Existe un elemento neutro para la suma y otro para el producto 
- Todo número complejo $z$ tiene un opuesto $-z$
- Todo número complejo $z$ distinto de _0_ tiene un inverso $z^(-1)$
#subtitle[ Inverso de un número complejo: ]

Dado un número complejo $z= a+b i$, se define su conjugado como $overline(z)=a-b i$ 

Si $z,w in CC$,se cumple que:
#mate[$overline(z+w)=overline(z)+overline(w)$ #h(90pt) 
  $overline(z dot w)=overline(z) dot overline(w)$
]

#pagebreak()

#vspace()

Además notamos que si $z = a+b i$ entonces:
#mate[$z dot overline(z)&=(a+b i)(a - b i) \ &= a^2 + b^2$]
Por lo tanto $z dot overline(z) >=0 " " forall z in CC " "$ y es igual a 0 $<=> z=0$.


\
#subtitle(size: 14pt)[Definición 1.0:] 

Si $z in CC$, el _módulo_ de $z$ es el número real dado por

#mate[$abs(z) = sqrt(z dot overline(z))$]

si $z=a + b i, " " a,b in RR => abs(z) = sqrt(a^2+b^2) $

si $z,w in CC $ entonces:
#mate[
  $abs(z dot w)^2 &= (z dot w )dot overline((z dot w)) \ &=z dot w dot overline(z)dot overline(w) \ &= abs(z)^2 dot abs(w)^2$
]

por lo tanto $abs(z dot w) = abs(z) dot abs(w)$

\
#subtitle(size: 14pt)[Definición 1.1:] 

Sea $z=a + b i ", "$ $a,b in CC, z!=0$. El inverso de un número complejo $z =a+b i$ es:
#mate[
  $z^(-1) =overline(z)/abs(z)^2 = a/(a^2+b^2) - b/(a^2+b^2)i$
]


#underline[Notación]: Si $z,w in CC" "$ y $w!=0$, $z/w = z dot w^(-1)$

\

#subtitle(size: 14pt)[Ejemplo 1.1]: 

Calculamos el inverso de los números complejos $2-3i " "$,$3i " "$ y $1/2 + sqrt(3)/2i$ 

\

#mate[
  $
    (2-3i)^(-1)             &= (2+3i)/(2^2+3^2) = 2/13 +3/13i \
    (3i)^(-1)               &= -(3i)/(9) = -1/3i \
    (1/2 + sqrt(3)/2i)^(-1) &= (1/2 - sqrt(3)/2i)/(1) = 1/2 - (sqrt(3))/(2)i
  $
]




#pagebreak()


#vspace()
#subtitle[Coordenadas polares:]

En lugar de describir un punto en e plano por sus coordenadas con respecto a dos
ejees perpendiculares, podemos describirlo como sigue. Trazamos una recta entre
el punto y un origen dado. El ángulo con el que esta recta corta la horizontal y
la distancia entre el punto y el origen determinan nuestro punto. 

Asi entonces el punto se describe por un par de números $(r,theta)$ que
constituyen sus coordenadas polares.
#pad[
  #align(
    center,
  )[
    #grid(
      columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, box[#image("assets/Coordenadas-polares.svg", height: 170pt)], box[
        #image("assets/Circulo-trigonometrico.svg", height: 170pt)
      ],
    );


  ]
]
Si tenemos nuestros ejes usuales y $x "e " y " "$ son las coordenadas ordinarias
de nuestro punto, entonces vemos que:
#mate[
  $
    x/r = cos(theta) "  " "  " "y " "  " " " y/r=sin(theta)
  $
] 


de donde

#mate[
  $
    x = r dot cos(theta) "  " "  " "y " "  " " " y=r dot sin(theta)
  $
]

Esto nos permite cambiar de coordenadas polares a coordenadas ordinarias.

Si trasladamos esto al mundo de los complejos, recordamos que si $z=a + b i, " " a,b in RR$ entonces $abs(z) = sqrt(a^2+b^2) $,
ahora si consideramos $z=a+ b i$ con $abs(z)= 1$, es decir:
#mate[$a^2+b^2=1$]
Sabemos por conceptos de trigonometría, especificamente las identidades
pitagóricas, que:
#mate[$cos(theta)^2 +sin(theta)^2 = 1 $]

Entonces existe un número $theta in [0,2pi)$ tal que:
#mate[
  $a = cos(theta)$, #h(10pt) $b=sin(theta)$
]
Luego $z = cos(theta) + sin(theta)i$ 
#move(dy: -5pt)[#line(stroke: 1.1pt + primaryColor, length: 137pt)]

#pagebreak()
#vspace();

Ahora si consideramos un número complejo $z = a+b i$ cualquiera,no nulo, se
cumple que:
#mate[$
    z = abs(z) dot z/abs(z)
  $]

Dado que el número complejo $z/abs(z) $ tiene módulo 1, se sigue que es de la
forma $cos(theta) + sin(theta)i$

Luego podemos representar a $z$ como:
#mate[
  $z = abs(z) dot (" "cos(theta)+sin(theta)i " ")$
] 
Por lo tanto, todo número complejo no nulo puede escribirse en su _forma polar_\ #mate[$z = r dot (" " cos(theta) + sin(theta)i " " ) $] 

donde estas expresiones están relacionadas por $a=r dot cos(theta)$ y $b=r dot sin(theta)$ ;
geométricamente hablando, $r = abs(z) $ representa la distancia del número
complejo al origen de coordenadas, y $theta$ es la medida #underline(stroke: 0.6pt, offset: 2.6pt)[en redianes] del
ángulo entre el eje real ($Re$) y la semi recta con origen en $0$, que pasa por $z$,
tomando el sentido antihorario.

#align(center)[
  #figure(caption: "Representación polar", numbering: none)[
    #image("assets/ejemplo-coord-polar.svg", height: 160pt)
  ]
]

#subtitle(size: 14pt)[
  Ejemplo:
]

- El número complejo $z = 1-i$ tiene modulo $sqrt(2)$, entonces:
#mate[
  $
    1-i &= sqrt(2) dot (1/sqrt(2) - 1/sqrt(2)i)\
    1-i &= underbrace((sqrt(2)), "r") dot (underbrace(1/sqrt(2), cos(theta)) + underbrace((-1/sqrt(2)), sin(theta))i)
  $
]

Luego el argumento de $z$ es $theta = 7/4pi$ y podemos escribir:

#mate[
  $
    z &= 1-i \ &= sqrt(2) dot (cos((7pi)/4) + sin((7pi)/(4))i)
  $
]


#pagebreak()

#vspace()
#title[1. Vectores en ℝ² y ℝ³:]

Se puede utilizar una túpla $(x,y)$ para representar un punto en el #underline[plano],
asi también una tripla $(x,y,z)$ para representar un punto en el #underline[espacio],
tambíen suele usarse la notación $(x_1,x_2,x_3)$

\

#align(
  center,
)[
  #grid(
    columns: (1fr, 1fr), rows: (auto, auto), gutter: 8pt, figure(
      caption: "(a) \n Representación de puntos en el plano", numbering: none,
    )[
      #image("assets/ejemplo-pto-plano.svg", height: 170pt)
    ], figure(
      caption: "(b) \n Representación de puntos en el espacio", numbering: none,
    )[
      #image("assets/ejemplo-pto-espacio.svg", height: 170pt)
    ],
  );

]
\
#subtitle[
  Definición:
]
#v(6pt)
Sea $RR$ el cuerpo de los números reales,entonces
#mate[
  $RR^n := {(x_1,x_2,...,x_n) : x_i in RR and 1<=i<=n}$
]

Todo $v$ en $RR^n$ será llamado _punto_ (vector en el origen o simplemente
vector). La mayoría de nuestros ejemplos tendrán lugar cuanto $n=2 $ o $n=3$;
para ello usaremos el _sistemas de coordenadas cartesianas_ para representar los
elementos de $RR^2$ y $RR^3$.

#subtitle[Suma en ℝⁿ:]

Si $(x_1,...,x_n)$, $" " (y_1,...,y_n)$ $in RR$, se define:
#mate[
  $
    (x_1,...,x_n) + (y_1,...,y_n) := (x_1+y_1,...,x_n+y_n)
  $
]
En otras palabras, la suma es _coordenada a coordenada_

#subtitle(size: 14pt)[Propiedades:]

#let Center(body) = align(center)[
  #body
]


La suma de vectores en $RR^n$ satisface que:

#align(
  center,
)[
  #grid(columns: (1fr, 1fr), rows: (60pt, auto), gutter: 0pt, box[
    #align(left)[
      1. Es asociativa
        - $u+(v+w) =(u+v)+w, forall u,v,w in RR^n$
      2. Es conmutativa
        - $v+w = w+v, forall v,w in RR^n$
    ]
  ], box[
    #align(left)[
      3. El vector $0:=(0,...,0)$, es el _elemento neutro_
        - $v+0=0+v=v, forall v in RR^n$
      4. El vector $-v = (-x_1,...-x_n)$ es el opuesto de $v=(x_1,...x_n)$
        - $ v+(-v) = (-v)+v=0$
    ]
  ]);

]

#pagebreak()

#vspace()
#title[ Ley del paralelogramo ] 


Sea $v = (2,3)$ y $w=(-1,1)$, entonces $v+w=(1,4)$
#v(10pt)

#grid(
  columns: (1fr, 1fr), rows: (24%, auto), gutter: 15pt, figure(
    caption: "Representación gráfica de:  " + $(2,3)+(-1,1)$, numbering: none,
  )[#Center[
      #cetz.canvas(
        length: 40pt, {
          import cetz.draw: *

          set-style(content: (padding: 4pt))

          set-style(mark: (symbol: ">", fill: black))
          //plano cartesiano
          line((-2.5, 0), (2.5, 0), mark: (end: "stealth"))
          content((), $ " "x $, anchor: "west")
          set-style(mark: (symbol: none))
          line((0, 0), (0, 3), mark: (end: "stealth"))
          content((), $ ""y $, anchor: "west")

          //escala
          set-style(mark: (symbol: none))
          for (x, ct) in ((-2, $ -2 $), (-1, $ -1 $), (1, $ 1 $), (2, $ 2 $)) {
            line((x, 3pt), (x, -3pt))
            content((), anchor: "north", ct)
          }

          for (y, ct) in ((1, $ 1 $), (2, $ 2 $)) {
            line((3pt, y), (-3pt, y))
            content((), anchor: "east", ct)
          }

          line(
            (1, 4), (2, 3, 0), stroke: (dash: "dotted", paint: yellow, thickness: 1.6pt),
          )
          line(
            (1, 4), (-1, 1, 0), stroke: (dash: "dotted", paint: yellow, thickness: 1.6pt),
          )


          //sln
          line((0, 0), (1, 4, 0), stroke: 1.3pt + primaryColor, name: "vec-(1,4)")
          circle("vec-(1,4).end", radius: 3pt, fill: primaryColor, stroke: none)
          content("vec-(1,4).end", $(1,4)$, anchor: "west")

          //(-1,1)
          line(
            (0, 0), (-1, 1, 0), stroke: 1.3pt + primaryColor, name: "vec-(-1,1)", mark: (fill: primaryColor, end: ">"),
          )
          content("vec-(-1,1).end", $(-1,1)$, anchor: "east")

          //(2,3)
          line(
            (0, 0), (2, 3, 0), stroke: 1.3pt + primaryColor, name: "vec-(2,3)", mark: (fill: primaryColor, end: ">"),
          )
          content("vec-(2,3).end", $(2,3)$, anchor: "west")
        },
      );
    ]
  ], [#set align(center);
    #figure(
      caption: "Representación general de:  " + $v+w$, numbering: none,
    )[#Center[
        #cetz.canvas(
          length: 55pt, {
            import cetz.draw: *

            set-style(content: (padding: 4pt))

            set-style(mark: (symbol: ">", fill: black))
            //plano cartesiano
            line((-1, 0), (2.5, 0), mark: (end: "stealth"))
            content((), $ " "x $, anchor: "west")
            set-style(mark: (symbol: none))
            line((0, 0), (0, 3), mark: (end: "stealth"))
            content((), $ ""y $, anchor: "west")

            //escala
            set-style(mark: (symbol: none))


            line(
              (2.6, 2.5, 0), (0.4, 2, 0), stroke: (dash: "dotted", paint: yellow, thickness: 1.6pt),
            )
            line(
              (2.6, 2.5, 0), (2, 0.5, 0), stroke: (dash: "dotted", paint: yellow, thickness: 1.6pt),
            )


            //sln
            line((0, 0), (2.6, 2.5, 0), stroke: 1.3pt + primaryColor, name: "vec-(1,4)")
            circle("vec-(1,4).end", radius: 3pt, fill: primaryColor, stroke: none)
            content("vec-(1,4).end", $v+w$, anchor: "west")

            //(-1,1)
            line(
              (0, 0), (2, 0.5, 0), stroke: 1.3pt + primaryColor, name: "vec-(-1,1)", mark: (fill: primaryColor, end: ">"),
            )
            content("vec-(-1,1).end", $w$, anchor: "west")

            //(2,3)
            line(
              (0, 0), (0.4, 2, 0), stroke: 1.3pt + primaryColor, name: "vec-(2,3)", mark: (fill: primaryColor, end: ">"),
            )
            content("vec-(2,3).end", $v$, anchor: "west")
          },
        );
      ]
    ]
  ],
)

#move(
  dy: -26%, dx: -3%,
)[
  #box(
    width: 130pt,
  )[
    #set align(center);
    #text(
      size: 10pt,
    )[
      _Como se puede observar, aparece un paralelogramo en el dibujo de los puntos #underline(stroke: (thickness: 1pt))[involucrados]_
    ]
  ]
]
#v(-10pt)
#subtitle[El opuesto de un vector]

#grid(
  columns: (2fr, 1fr), rows: (auto, auto), gutter: -51pt, move(
    dy: 1%,
  )[ El opuesto de un vector $v$ en el #underline[plano] \ es $-v$ y geometricamente
    es el vector \ reflejado respecto al centro. ], move(
    dy: -8%,
  )[
    #cetz.canvas(
      length: 30pt, {
        import cetz.draw: *

        set-style(content: (padding: 4pt))

        set-style(mark: (symbol: ">", fill: black))
        //plano cartesiano
        line((-2.5, 0), (2.5, 0), mark: (end: "stealth"))
        content((), $ " "x $, anchor: "west")

        line((0, -2), (0, 3), mark: (end: "stealth"))
        content((), $ ""y $, anchor: "west")

        //escala
        set-style(mark: (symbol: none))

        //(2,3)
        line(
          (0, 0), (2, 2, 0), stroke: 1.3pt + primaryColor, name: "vec-(2,2)", mark: (fill: primaryColor, end: ">"),
        )
        line(
          (0, 0), (-2, -2, 0), stroke: 1.3pt + primaryColor, name: "vec-(-2,-2)", mark: (fill: primaryColor, end: ">"),
        )
        content("vec-(2,2).end", $v$, anchor: "west")
        content("vec-(-2,-2).end", $-v$, anchor: "west")
      },
    );

  ],
)

#v(-20pt)


#subtitle[Resta de vectores]

#grid(
  columns: (2fr, 1fr), rows: (20%, auto), gutter: -51pt, [ Dados dos vectores $v,w$ en el plano, podemos representar\ la resta como la
    suma de $v$ más el opuesto de w, es decir:
    #move(dx: 24%)[
      #set text(size: mathTextSize)
      $
        v - w := v +(-w)
      $
    ]
    Como $(v-w)+w = v$, la ley del paralelogramo también\ es útil para representar
    geométricamente la resta ], move(
    dy: -8%,
  )[
    #cetz.canvas(
      length: 30pt, {
        import cetz.draw: *

        set-style(content: (padding: 4pt))

        set-style(mark: (symbol: ">", fill: black))
        //plano cartesiano
        line((-2.5, 0), (2.5, 0), mark: (end: "stealth"))
        content((), $ " "x $, anchor: "west")

        line((0, -2), (0, 3), mark: (end: "stealth"))
        content((), $ ""y $, anchor: "west")

        //escala
        set-style(mark: (symbol: none))

        line(
          (1, 2), (3, 1, 0), stroke: (dash: "dotted", paint: yellow, thickness: 1.6pt),
        )
        line(
          (1, 2), (-2, 1, 0), stroke: (dash: "dotted", paint: yellow, thickness: 1.6pt),
        )
        //(2,3)
        line(
          (0, 0), (1, 2, 0), stroke: 1.3pt + primaryColor, name: "vec-(2,2)", mark: (fill: primaryColor, end: ">"),
        )
        content("vec-(2,2).end", $v$, anchor: "west")

        line(
          (0, 0), (3, 1, 0), stroke: 1.3pt + primaryColor, name: "vec-(3,1)", mark: (fill: primaryColor, end: ">"),
        )
        content("vec-(3,1).end", $w$, anchor: "west")


        line(
          (0, 0), (-2, 1, 0), stroke: 1.3pt + primaryColor, name: "vec-(-2,-2)", mark: (fill: primaryColor, end: "o"),
        )
        content("vec-(-2,-2).end", $v - w$, anchor: "east")
      },
    );

  ],
)

#pagebreak()

#v(8pt)
#title[ Producto de un vector por un escalar ]

Sea $v=(x_1,...,x_n) in RR^n$ y $lambda in RR$, entonces:
#mate[
  $
    lambda. v = (lambda x_1,...,lambda x_n)
  $
]

También denotamos a esta multiplicación por $lambda v$ 

\
#subtitle(size:15pt)[Ejemplo:]

#v(9pt)

Si $v = (1,2)$ y $lambda=1/2$, entonces:
#grid(
  columns: (1fr, 1fr), rows: (26%, -24%), [
    #mate[$
        lambda v =(1/2 dot 1, 1/2 dot 2) = (1/2,1)
      $]
  ], [
    #move(
      dy: -30%, dx: 35%,
    )[#figure(
        caption: $"Representación de " lambda. v$, numbering: none,
      )[#Center[
          #cetz.canvas(
            length: 50pt, {
              import cetz.draw: *

              set-style(content: (padding: 4pt))
              set-style(mark: (fill: black))
              //plano cartesiano
              line((0, 0), (2.5, 0), mark: (end: "stealth"))
              content((), $ " "x $, anchor: "west")
              set-style(mark: (symbol: none))
              line((0, 0), (0, 2.5), mark: (end: "stealth"))
              content((), $ ""y $, anchor: "west")

              //escala
              set-style(mark: (symbol: none))

              //sln
              line((0, 0), (1, 2, 0), stroke: 1.3pt + primaryColor, name: "vec-(1,4)")
              circle("vec-(1,4).end", radius: 3pt, fill: primaryColor, stroke: none)
              content("vec-(1,4).end", $(1,2)$, anchor: "west")

              line((0, 0), (1 / 2, 1, 0), stroke: 1.3pt + primaryColor, name: "vec-(1,4)")
              circle("vec-(1,4).end", radius: 3pt, fill: yellow, stroke: 0.07pt)
              content("vec-(1,4).end", $1/2.(1,2)$, anchor: "west")
            },
          );
        ]
      ]]
  ],
)
 #move(dx: 86%,dy: -13%)[
 #box(width: 89pt)[#text(size:8pt)[
  #set align(center)
  _Como se puede observar, al multiplicar un vector por un escalar, como su nombre indica, este extiende o escala el vector original_
 ]]]


#subtitle[Propiedades]

La multiplicación por escalares satisface que:

#pad(
  top: 7pt,
)[#grid(
    columns: (1fr, 1fr), rows: (auto, auto), [
      1. Es asociativa:
      #mate[$
          (lambda mu)v = lambda(mu v), " "forall v in RR^n,lambda, mu in RR
        $]
    ], [
      2. Es distributiva:
      #mate[$
          lambda(v+w)    &=lambda v + lambda w," " forall v,w in RR^n , lambda in RR \
          (lambda + mu)v &= lambda v + mu v," " forall v in RR^n , lambda,mu in RR
        $]
    ], [
      3. Existencia del opuesto:
      #mate[
        $
          (-1)v =-v , " "forall v in RR^n
        $
      ]
    ],
  )
]

\

A continuación se introducirá un concepto #underline[_fundamental_] para los
temas sub-siguientes:

\
#subtitle[Combinación Lineal]

Sean $v_1,...,v_k$ vectores en $RR^n$

Una _combinación lineal_ de $v_1,...,v_k$ es un #underline[vector] de la forma
#mate[$
    lambda_1 v_1 +...+ lambda_k v_k
  $]

donde $lambda_1,...,lambda_k$ son números reales.

#pagebreak()
#vspace()
#subtitle(size:15pt)[Ejemplo:]

Sean $v_1=(1,2,3),v_2=(-1,3,0),v_3=(-1,0,1)" " y " " v_4=(-2,-1,-3)$ vectores en $RR^3$

Entonces:
#mate[
  $
    v &= 2v_1 -3v_2 +4v_3 -5v_4 \
      &= 2(1,2,3) - 3(-1,3,0) + 4(-1,0,1) -5(-2,-1,-3) \
      &= (2,4,6)+(3,-9,0)+(-4,0,4)+(10,5,15) \
      &= (11,0,25)
  $
]

Es una combinación lineal de $v_1,v_2,v_3,v_4$.


#subtitle[Base canónica]

Dado $i in {1,...,n}$, se denota $e_i in RR^n$ al vector cuyas coordenadas son
todas $0$ excepto la coordenada _i-ésima_ que es $1$.

#mate[$
    e_i = (0,...,1,...,0)
  $]

El conjunto ${e_1,...,e_n}$ se llama _base canónica_ de $RR^n$.

#v(10pt)
#subtitle(size:15pt)[Ejemplo:]

En $RR^3$ los vectores son $e_1=(1,0,0),e_2=(0,1,0),e_3=(0,0,1)$, estos vectores
son fundamentales para la materia.

\
#subtitle[Propiedad]

Todo vector de $RR^n$ se escribe como _combinación lineal_ de la #underline[base canónica].
#mate[$(x_1,...,x_n)= x_1e_1 + x_2e_2+...+x_n e_n$]

\

#subtitle(size: 14pt)[Ejemplo:]

#mate[
  $
    (1,2,3) &= (1,0,0) + (0,2,0)+(0,0,3) \
            &= 1(1,0,0)+2(0,1,0)+3(0,0,1) \
            &= 1 e_1 + 2 e_2 + 3 e_3
  $
]


#pagebreak()


