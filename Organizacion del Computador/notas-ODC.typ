#set page(margin: -2pt)

#let primaryColor = rgb("#1288A5");
#image("assets/banner.svg", width: 100%)
#counter(page).update(0)
#pagebreak()
#set text(font: "Cambria")

#set page(
  paper: "a4", margin: (top: 46pt, left: 40pt, right: 40pt, bottom: 35pt), header: [
    #set text(size: 11pt)

    Notas de clase - Org. del computador
    #h(1fr)
    _Santiago Emanuel Nieva_
    #move(dy: -4pt)[ #line(stroke: 1.1pt + primaryColor, length: 100%) ]
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


#let hex2bin(body)={
  let body = upper(body)
  let tabla = (
    "0": "0000",
    "1": "0001",
    "2": "0010",
    "3": "0011",
    "4": "0100",
    "5": "0101",
    "6": "0110",
    "7": "0111",
    "8": "1000",
    "9": "1001",
    "A": "1010",
    "B": "1011",
    "C": "1100",
    "D": "1101",
    "E": "1110",
    "F": "1111"
  );
  
  tabla.at(body,default:text(fill: red)[NO EXISTE #body EN HEXADECIMAL])
}

#let bin2hex(body)={
  let body = upper(body)
  let tabla = (
    "0000": "0",
  "0001": "1",
  "0010": "2",
  "0011": "3",
  "0100": "4",
  "0101": "5",
  "0110": "6",
  "0111": "7",
  "1000": "8",
  "1001": "9",
  "1010": "A",
  "1011": "B",
  "1100": "C",
  "1101": "D",
  "1110": "E",
  "1111": "F"
  );
  
  tabla.at(body,default:text(fill: red)[NO EXISTE #body EN BINARIO])
}


#let pow(b,e) = {
  let result=1;
  let n =0;
  if e == 0  {
    result
  }else{
    if e == 1 {
      result=2
      result
    }else{
    while n < e {
      result = result * b 
      n=n+1; 
    }
    result
    }
    
  }
}

#let bin2dec(body)={
  let body = str(body)
  let decimal =0;
  let long = body.len()
  let n=0;
  let exponentes = ()

  for value in body {
    exponentes.insert(0,long - 1 -n)
    if int(value) == 0{
      decimal +=0
    }else{
      decimal = decimal+ pow(2,exponentes.at(0))
    }
    
    n=n+1;
  }

//exponentes
decimal
}
//TODO: Mejorar el spliteo de chunks creando funcion modulo 
#let lnbin2hex(bin)={
  let bin = str(bin)
  let chunks = bin.split(" ")
  
  for chunk in chunks {
    bin2hex(str(chunk))
  }

}

#let lnhex2bin(hex)={
  let bin = str(hex)
  let chunks = bin.split(" ")
  
  for chunk in chunks {
    hex2bin(str(chunk)) +" "
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

#title[Práctico 1]

\


#subtitle[Ejercicio 1]

Convertir los siguientes números en hexadecimal a binario de 32 bits:

- 0xABCDEF00  $->$ #lnhex2bin("A B C D E F 0 0")   
- 0x123456 $->$ #lnhex2bin("1 2 3 4 5 6")
- 0x8E3FC581 $->$ #lnhex2bin("8 E 3 F C 5 8 1")
- 0x10A6F2B $->$ #lnhex2bin("1 0 A 6 F 2 B")


#subtitle()[Ejercicio 2]

TODO: Completar lo del punto fijo
#table(
  columns: 3,  
   [*Binario*], [*Decimal*],[*Hexadecimal*],
  [1110011110000011],[#bin2dec("1110011110000011")],[#lnbin2hex("1110 0111 1000 0011")],
  [10110111001101000101111],[#bin2dec("10110111001101000101111")],[  #lnbin2hex("0101 1011 1001 1010 0010 1111")],
  [10110011011011.11000010000],[#bin2dec("10110011011011").],[#lnbin2hex("0010 1100 1101 1011").],
  [10001111110100011111.000001101],[#bin2dec("10001111110100011111").],[#lnbin2hex("1000 1111 1101 0001 1111")],
 
)


