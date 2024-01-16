-- -*- coding: utf-8 -*-
----------------------------------------------------------------
--Json Read n Write Tool
--jrwtool v0.1
--
--Copyright Hector Rafael Gonzalez Vega -"RayKing"-
--
--jrwtool Es una herramienta para poder leer y escribir codigo
--JSON en un archivo.
--
--Para que esta Herramienta funcione correctamente se le debe pasar una
--estancia de la herramienta "Simple JSON Encode/Decode in Pure Lua"
--del programador Jeffrey Friedl.
--"JSON.lua package by Jeffrey Friedl (http://regex.info/blog/lua/json)"
--
--
--Este codigo esta bajo Creative Commons CC-BY "Atribución 3.0 No portada" License:
--https://creativecommons.org/licenses/by/3.0/deed.es
--
--Creacion: 17/02/2022
----------------------------------------------------------------
 
function creditos(opc)
	--[[
	Funcion: creditos
 
				nombre		tipo		val aceptado		val por defecto
	Parametro:	opc		//	String	//	"f1" -- "f2"	//	"f2"
 
	Descripcion:	Contiene variables con informacion hacerca de la herramienta
					jrwtool
 
	Funcionamiento:	La variable *opc por defecto contendra el valor "f2" lo que
					al momento de ser llamada devolvera, ya sea un String para
					la impresion de la informacion o un arreglo con llaves con
					la misma informacion de la herramienta.
 
				nombre		tipo
	Retorno:	info	// String -- Array
	]]--
	opc = opc or "f2"
 
	NOMBRE = 'jrwtool'
	VERSION = '0.1'
	CREACION = '17/02/2022'
	ACTUALIZACION = 'N/A'
	AUTOR = 'Hector Rafael Gonzalez Vega -"RayKing-"'
 
	if opc == "f1" then
		info = {
			nombre = NOMBRE,
			version = VERSION,
			creacion = CREACION,
			actualizacion = ACTUALIZACION,
			autor = AUTOR
		}
	elseif opc == "f2" then
		info = "----------> \n"..
			'--> '..NOMBRE..'\n'..
			'--> Version: '..VERSION..'\n'..
			'--> Creacion: '..CREACION..'\n'..
			'--> Actualizacion: '..ACTUALIZACION..'\n'..
			'--> Autor: '..AUTOR..'\n'..
			"----------> \n"
	end
	return info
end
 
 
function readJ(JSON,path)
	--[[
	Funcion: readJ
 
				nombre		tipo		val aceptado		val por defecto
	Parametro1:	JSON	//	String	//	estancia JSON	//	N/A
	Parametro2:	path	//	String	//	String			//	N/A
 
	Descripcion:	Funcion encargada de leer la informacion de un archivo
 
	Funcionamiento:	Para el correcto funcionamiento de esta funcion se
					necesita una instancia JSON, ademas de la ruta del
					archivo .json. readJ leera y codificara el archivo
					cuya informacion sera retornada como arreglo
 
				nombre		tipo
	Retorno:	data	//	Array
	]]--
 
	file = io.open(path, "r")
	textojson = file:read("*all")    
	data = JSON:decode( textojson )
	io.close()
 
	return data
end
 
function writeJ(JSON,data,path)
	--[[
	Funcion: readJ
 
				nombre		tipo		val aceptado		val por defecto
	Parametro1:	JSON	//	String	//	estancia JSON	//	N/A
	Parametro2:	data	//	String	//	Array			//	N/A
	Parametro2:	path	//	String	//	String			//	N/A
 
	Descripcion:	Funcion encargada de escribir la informacion en un archivo
 
	Funcionamiento:	Para el correcto funcionamiento de esta funcion se
					necesita una instancia JSON, la informacion a
					codificar y la ruta del	archivo .json. writeJ
					codificara la informacion de la variable *data
					la cual escribira en un archivo existente.
 
				nombre		tipo
	Retorno:	N/A		//	nil
	]]--
 
	file = io.open(path, "w")
	data = JSON:encode(data)
	file:write(data)
	file:close()
 
	return nil
end
 
function writePtyJ(JSON,data,path)
	--[[
	Funcion: readJ
 
				nombre		tipo		val aceptado		val por defecto
	Parametro1:	JSON	//	String	//	estancia JSON	//	N/A
	Parametro2:	data	//	String	//	Array			//	N/A
	Parametro2:	path	//	String	//	String			//	N/A
 
	Descripcion:	Funcion encargada de escribir la informacion en un archivo
 
	Funcionamiento:	Para el correcto funcionamiento de esta funcion se
					necesita una instancia JSON, la informacion a
					codificar y la ruta del	archivo .json. writeJ
					codificara la informacion de la variable *data
					la cual se escribira en un archivo existente
					con un formato de facil lectura.
 
					*Leer documentacion de "Simple JSON Encode/Decode 
					in Pure Lua" en la funcion "encode_pretty".
 
				nombre		tipo
	Retorno:	N/A		//	nil
	]]--
	file = io.open(path, "w")
	data = JSON:encode_pretty(data)
	file:write(data)
	file:close()
 
	return nil
end