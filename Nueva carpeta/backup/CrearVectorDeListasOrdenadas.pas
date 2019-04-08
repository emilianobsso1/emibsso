program CrearVectorDeListasOrdenadas;
type
  libro=record
    codigo:integer;
    cantidad:integer;
    nombre:string;
  end;
  lista=^nodo;
  nodo=record
    datos:libro;
    sig:lista;
  end;
  vector=array[1..4]of lista;

  procedure cargarLibro(var Libros:libro);
  begin
    with libros do begin
      if (nombre<>'zzz') then begin
      write('Escribe el nombre del tipo de consumo: ');
      read(nombre);
      readln; //sin esta readln el compilador saltea la linea anterior
      codigo:= random(4)+1;

      cantidad:=random(10);

      end;
    end;
  end;


Procedure InsertarOrdenadoLista ( var pri: lista; per:libro);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.datos := per;
  act := pri;
  ant := pri; {Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.nombre < per.nombre) do begin
    ant := act;
    act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;


 Procedure recorrido ( pri : lista);
 Begin
   while (pri <> NIL) do begin  ///corregir
   writeln ('tipo de consumo  ' ,pri^.datos.nombre,' total  ',pri^.datos.cantidad);
   pri:= pri^.sig;
 end;
   readln;
 end;

 procedure inicializarVectorListas(var v:vector);
 var
   i:integer;
 begin
   for i:=1 to 4 do
       v[i]:=nil;
 end;

procedure CrearVectorListas(var v:vector);
var
  libros:libro;
begin
  inicializarVectorListas(v);
  cargarLibro(libros);



  while (libros.nombre<>'zzz') do begin
     InsertarOrdenadoLista(v[libros.codigo],libros);
     cargarLibro(Libros);
  end;

  readln;
end;

procedure AgregarAlFinal2 (var pri, ult: lista; m:integer;t:string);
 var  nue : lista;
  begin
    new (nue);
     nue^.datos.nombre:= t;
     nue^.datos.cantidad:=m;
      nue^.sig := NIL;
       if (pri <> Nil) then
          ult^.sig := nue
          else
          pri := nue;
       ult := nue;
  end;

procedure determinarMinimo(var v:vector; var cant:integer; var tipo:string);
var
  pos, i:integer;
  m: string;
begin
  tipo:='  ';
  m:='~~~';
  for i:=1 to 4 do
    if (v[i]<>nil) then
       if (v[i]^.datos.nombre<m) then begin
          m:=v[i]^.datos.nombre;
          pos:=i;
       end;

  if (m<>'~~~') then begin
    cant:=v[pos]^.datos.cantidad;
    tipo:=v[pos]^.datos.nombre;
    v[pos]:=v[pos]^.sig;
   end;
 end;
procedure Merge (var  v:vector; var L4:lista);
 var
   ult:lista;
   tipo,tipoAct:string;
   cant,acumulador:integer;
begin

 ult:=nil;
 determinarMinimo(v,cant,tipo);
 while (tipo<>'  ') do begin
      acumulador:=0;
      tipoAct:=tipo;
      while (tipo=tipoAct) do begin
          acumulador:=acumulador+cant;
          determinarMinimo(v,cant,tipo);
       end;
      writeln(' hay  ', acumulador,' de tipo   ', tipoAct); // porque tipo ahora es el nuevo
      readln;
      agregaralfinal2(L4,ult,acumulador,tipoAct);
 end;


end;

procedure recorrerVector(v:vector);
var
  i:integer;
begin
   for i:=1 to 4 do begin
   writeLn('Lista ', i);
   recorrido(v[i]);
 readln;
end;
end;
////////programa principal////////
var
 l,Lnueva:lista; v:vector;
  libros:libro; i: integer;
begin
 randomize;
Lnueva:=nil;
 CrearVectorListas(v);  // al recorrerse vector de listas no olvidar hacer recorrido individual de cada lista
 writeln('Las listas quedaron ordenadas de la siquiente manera');
 recorrerVector(v);
 writeln(' ahora si merge');
 readln;
 Merge(v,LNueva);
 writeLn('La lista nueva quedó  ');
 recorrido(LNueva);
 readln;
end.



