
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 19 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los 
%              elementos de un conjunto en subconjuntos 
%              disjuntos dados los tamaños especificados 
%              para los subgrupos. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     // Función que agrupa los elementos en subconjuntos dados los tamaños.
%     static List<List<List<T>>> Agrupar<T>(List<T> elementos, List<int> tamanos)
%     {
%         var resultado = new List<List<List<T>>>();

%         if (tamanos.Count == 0)
%         {
%             resultado.Add(new List<List<T>>()); // Caso base: sin más subgrupos.
%         }
%         else
%         {
%             int tam = tamanos[0];
%             var combinaciones = Combinaciones(elementos, tam); // Todas las combinaciones posibles.

%             foreach (var grupo in combinaciones)
%             {
%                 var resto = elementos.Except(grupo).ToList();
%                 var subgrupos = Agrupar(resto, tamanos.Skip(1).ToList());

%                 foreach (var sg in subgrupos)
%                 {
%                     sg.Insert(0, grupo);
%                     resultado.Add(sg);
%                 }
%             }
%         }
%         return resultado;
%     }

%     // Reutiliza la función Combinaciones del programa anterior.
%     static List<List<T>> Combinaciones<T>(List<T> lista, int k)
%     {
%         var resultado = new List<List<T>>();
%         if (k == 0)
%         {
%             resultado.Add(new List<T>());
%         }
%         else if (lista.Count > 0)
%         {
%             T primero = lista[0];
%             var resto = lista.GetRange(1, lista.Count - 1);

%             foreach (var comb in Combinaciones(resto, k - 1))
%             {
%                 comb.Insert(0, primero);
%                 resultado.Add(comb);
%             }

%             resultado.AddRange(Combinaciones(resto, k));
%         }
%         return resultado;
%     }

%     static void Main()
%     {
%         var elementos = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         var tamanos = new List<int> { 2, 2, 2 };
%         var grupos = Agrupar(elementos, tamanos);

%         Console.WriteLine("Agrupaciones:");
%         foreach (var grupo in grupos)
%         {
%             Console.WriteLine(string.Join(" | ", grupo.Select(g => string.Join(", ", g))));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado group(Ns, Es, Gs) que agrupa los elementos 
% de Es en subconjuntos disjuntos con tamaños dados en Ns.

group([], [], []). % Caso base: sin más elementos ni grupos.

group([N|Ns], Es, [G|Gs]) :- 
    combination(N, Es, G),       % Selecciona una combinación de tamaño N.
    subtract(Es, G, Rest),       % Resta los elementos seleccionados del conjunto original.
    group(Ns, Rest, Gs).         % Agrupa el resto de los elementos.

% Ejemplo de uso:
% ?- group([2, 2, 2], [a, b, c, d, e, f], Gs).
% Gs = [[a, b], [c, d], [e, f]] ;
% Gs = [[a, b], [c, e], [d, f]] ;
% Gs = [[a, b], [c, f], [d, e]] ;
% ...
% ----------------------------------------------


