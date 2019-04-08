Program arboles;
Type
  lista=^nodo;
  nodo=record
    datos:integer;
    sig:lista;
    end;
  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;

Procedure CrearListaAgregarAdelante (var L:lista; per:integer);
Var nue:Lista;
Begin
     New(nue);
     nue^.datos:=per;
     nue^.sig:=L;
     L:=nue;
End;


{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atr�s en l}

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;

//procedure recorrerPostOrden(a:arbol) el write va al final primero recorre hijos dps hace algo con dato

// si se pone el write entre los dos hijos es en orden

{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
procedure CrearLista(var L:lista);
var
   n:integer;
   i:integer;
begin
 for i:=1 to 8 do begin
     n:=random(10);
     CrearListaAgregarAdelante(L,n);
 end;
end;

procedure insertarArbol(var a:arbol; d:integer);
var
   nue:arbol;
begin
 if (a=nil) then begin
 new(nue);
 nue^.dato:=d;
 nue^.hi:=nil;
 nue^.hd:=nil;
 a := nue;
 end
  else
  if (a^.dato>d) then
    insertarArbol(a^.hi,d)
   else
    if (a^.dato<d) then
      insertarArbol(a^.Hd,d);
 end;



Procedure armarArbolito(var a:arbol; pri:lista);
var
  aux:lista;
begin
   aux:=pri;
   while (aux <> NIL) do begin
     insertarArbol(a,aux^.datos);
     aux:= aux^.sig;
    end;
end;

Procedure ImprimirLista ( pri : lista);

Begin
 while (pri <> NIL) do begin
   write(pri^.datos,' | ') ;
          pri:= pri^.sig
 end;
 writeLn();
end;


{PROGRAMA PRINCIPAL}
var
   l:lista; a:arbol;
begin
 Randomize;
 l:=nil;
 a:=nil;
 CrearLista(L);
 ImprimirLista(l);
 armarArbolito(a,l);
 imprimirpornivel(a);

 readln;
end.
