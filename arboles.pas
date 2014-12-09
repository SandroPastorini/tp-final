{
 *Archivo: tp_final.pas
 *Creado: 08/12/2014
 *Editado: 08/12/2014
 *Autor: Sandro Pastorini
 *Comentario:
}
unit arboles;
interface

implementation
uses tipos;

function arbolvacio(A:aFactura):boolean;
begin
     arbolvacio:=(A=nil);
end;

function arbolvacio(A:aArticulo):boolean;
begin
     arbolvacio:=(A=nil);
end;

procedure insertarArbol(var A:aFactura; x:tFactura; campo:char);
begin
     if (A = nil) then
     begin
          new(A);
          A^.info:=x;
          A^.izq:=nil;
          A^.der:=nil;
    end
	else
	begin
		case campo of
			'1': begin
				if A^.info.nFactura<=x.nFactura then
					insertarArbol(A^.der,x, campo)
				else if A^.info.nFactura>x.nFactura then
					insertarArbol(A^.izq,x, campo)
				end;
			'2': begin
				if A^.info.nombre<=x.nombre then
					insertarArbol(A^.der,x, campo)
				else if A^.info.nombre>x.nombre then
					insertarArbol(A^.izq,x, campo)
				end;
		
			'3': begin
				if A^.info.fecha<=x.fecha then
					insertarArbol(A^.der,x, campo)
				else if A^.info.fecha>x.fecha then
					insertarArbol(A^.izq,x, campo)
			end;
end;
end;
end;
{
 *
}
procedure insertarArbol(var A:aArticulo; x:tArticulo; campo:char);
begin
     if A=nil then
     begin
          new(A);
          A^.info:=x;
          A^.izq:=nil;
          A^.der:=nil;
     end
	 else
	 begin
	case campo of
		'1': begin
			if A^.info.codigo<=x.codigo then
				insertarArbol(A^.der,x,campo)
			else if A^.info.codigo>x.codigo then
				insertarArbol(A^.izq,x,campo)
			end;
		'2': begin
			if A^.info.descripcion<=x.descripcion then
				insertarArbol(A^.der,x,campo)
			else if A^.info.descripcion>x.descripcion then
				insertarArbol(A^.izq,x,campo)
			end;
		'3': begin
			if A^.info.proveedor<=x.proveedor then
				insertarArbol(A^.der,x,campo)
			else if A^.info.proveedor>x.proveedor then
				insertarArbol(A^.izq,x,campo)
			end;
		end;
	end;
end;
{
 *Busca un articulo/factura en el arbol dado
}
procedure buscarArbol(A:aFactura;x:tFactura;var existe:boolean; var aux:aFactura; campo:char);
begin
	
	if not arbolvacio(A) then
	begin
		aux := A;
		case campo of
			'1': begin
				if aux^.info.nFactura=x.nFactura then existe := true
				else buscarArbol(aux^.der,x,existe,aux, campo)
				end;
			'2': begin
					if aux^.info.fecha=x.fecha then existe := true
					else buscarArbol(aux^.der,x,existe,aux, campo)
					end;
			'3': begin
				if aux^.info.nombre=x.nombre then existe := true
				else buscarArbol(aux^.der,x,existe,aux, campo)
				end;
	end
	else
		begin
		end;
	end;
end;

{
	if not vacioarbol(A) then
	begin
		aux:=A;
		case campo of
			'1': begin
			if aux^.info.nFactura=x.nFactura then
				existe := true
			else
				buscarArbol(aux^.der,x,existe,aux, campo);
		end;
			'2': begin
			if aux^.info.fecha=x.fecha then
				existe := true
			else
				buscarArbol(aux^.der,x,existe,aux, campo);
		end;
			'3': begin
			if aux^.info.nombre=x.nombre then
				existe := true
			else
				buscarArbol(aux^.der,x,existe,aux, campo);
		end;
	end
	else
	begin
		case campo of
			'1': begin
			if aux^.info.nFactura=x.nFactura then existe := true
			else buscarArbol(aux^.izq,x,existe,aux, campo);
		end;
			'2': begin
			if aux^.info.fecha=x.fecha then existe := true
			else buscarArbol(aux^.izq,x,existe,aux, campo);
		end;
			'3': begin
			if aux^.info.nombre=x.nombre then existe := true
			else buscarArbol(aux^.izq,x,existe,aux, campo);
		end;
	end;
end;
end;}

end.