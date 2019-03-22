clear all; clc
ca = getNoten()

ptStruct = umwandlung( ca )
ptStruct1 = umwandlungnested( ca )

[msem minfo mcad] = mittelwert(ptStruct)
[bestenote] = bestegesamtnote(ptStruct)
[nliste] = namensliste(ptStruct,1.85)