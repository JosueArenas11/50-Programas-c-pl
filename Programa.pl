```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 19 de octubre de 2024
% Descripción: Programa en Prolog que genera todas 
%              las combinaciones posibles de K elementos 
%              seleccionados de una lista dada. Se incluye 
%              una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función que genera todas las combinaciones posibles de K elementos.
%     static List<List<T>> Combinaciones<T>(List<T> lista, int k)
%     {
%         var resultado = new List<List<T>>();
%         if (k == 0)
%         {
%             resultado.Add(new List<T>()); // Caso base: combinación vacía.
%         }
%         else if (lista.Count > 0)
%         {
%             T primero = lista[0];
%             var resto = lista.GetRange(1, lista.Count - 1);

%             // Combinaciones que incluyen el primer elemento.
%             foreach (var comb in Combinaciones(resto, k - 1))
%             {
%                 comb.Insert(0, primero);
%                 resultado.Add(comb);
%             }

%             // Combinaciones que no incluyen el primer elemento.
%             resultado.AddRange(Combinaciones(resto, k));
%         }
%         return resultado;
%     }

%     static void Main()
%     {
%         var lista = new List<char> { 'a', 'b', 'c', 'd' };
%         var combinaciones = Combinaciones(lista, 2);

%         Console.WriteLine("Combinaciones:");
%         foreach (var comb in combinaciones)
%         {
%             Console.WriteLine(string.Join(", ", comb));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado combination(K, L, C) que genera todas las combinaciones 
% posibles de K elementos seleccionados de la lista L y las unifica con C.

combination(0, _, []). % Caso base: si K es 0, devuelve la lista vacía.
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb). % Incluye el primer elemento.

combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb). % Excluye el primer elemento.

% Ejemplo de uso:
% ?- combination(2, [a, b, c, d], C).
% C = [a, b] ;
% C = [a, c] ;
% C = [a, d] ;
% C = [b, c] ;
% C = [b, d] ;
% C = [c, d].
% ----------------------------------------------
```
