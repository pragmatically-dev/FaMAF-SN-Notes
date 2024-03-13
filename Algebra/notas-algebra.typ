#set page(margin: -2pt)

#let primaryColor = rgb("#1288A5");
#image("assets/banner.png")
#counter(page).update(0)
#pagebreak()
#set text(font: "Cambria")

#set page(
  paper: "a4", margin: (top: 46pt, left: 40pt, right: 40pt, bottom: 35pt), header: [
    #set text(size: 12pt)

    Notas de clase - Álgebra Lineal
    #h(1fr)
    _Santiago Emanuel Nieva_
    #line(stroke: 0.6pt + primaryColor, length: 100%  )
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

#let vspace()={v(15pt)}
#let bodyTextSize = 12pt;
#let mathTextSize = 14pt;
#let captionTextSize = 15pt;
#let title(underlined:true,body)={
  if underlined {
  underline()[   
       #text(size: 25pt, baseline: -.14em)[#body]
    ]
  }else{
    text(size: 25pt, baseline: -.14em)[#body]
  }
}

#let subtitle(underlined:true,body)={
  if underlined {
  underline()[   
       #text(size: 20pt, baseline: -.14em)[#body]
    ]
  }else{
    text(size: 20pt, baseline: -.14em)[#body]
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

#set text(size:bodyTextSize)

Al conjunto de los números complejos se los denota como $CC$ y está definido por
#text(size: mathTextSize)[$
  CC = {a+b  i | a,b in RR}
$
]

sea $z=a+b dot i$ un número complejo denotamos _parte real_ de $z$ a $a$ y parte imaginaria de $z$ a $b$ de la siguiente manera

#text(size: mathTextSize)[
  $
  Re(z) = a  "  y   " "  " Im(z)=b
$
]

Los números reales están contenidos en $CC$, son aquellos cuya parte imaginaria es nula, es decir

#text(size: mathTextSize)[
  $
  RR = {z in CC | Im(z)= 0}
$
]

#subtitle[ Operaciones en los Complejos:]

1. La suma de define de la siguiente manera:

#mate[
  $(a+b  i) + (c + d  i ) = (a+c)+(b+d)  i$
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
#subtitle[ Inverso de un número complejo:]

Dado un número complejo $z= a+b i$, se define su conjugado como $overline(z)=a-b i$  

Si $z,w in CC$,se cumple que:
#mate[$overline(z+w)=overline(z)+overline(w)$ #h(90pt) 
$overline(z dot w)=overline(z) dot overline(w)$
]

#pagebreak()

#vspace()

Además notamos que 



 

