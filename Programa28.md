```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 19 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista 
%              de listas según la longitud de sus sublistas. 
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     // Función para ordenar una lista de listas según la longitud de las sublistas.
%     static List<List<T>> OrdenarPorLongitud<T>(List<List<T>> listas)
%     {
%         return listas.OrderBy(lista => lista.Count).ToList(); // Ordena por longitud.
%     }

%     static void Main()
%     {
%         var listas = new List<List<char>> 
%         { 
%             new List<char> { 'a', 'b', 'c' }, 
%             new List<char> { 'd', 'e' }, 
%             new List<char> { 'f' } 
%         };
%         
%         var listasOrdenadas = OrdenarPorLongitud(listas);

%         Console.WriteLine("Listas ordenadas por longitud:");
%         foreach (var lista in listasOrdenadas)
%         {
%             Console.WriteLine($"[{string.Join(", ", lista)}]);
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lsort(L, S) que ordena una lista de listas 
% de acuerdo con la longitud de sus sublistas.

lsort(L, S) :- 
    map_list_to_pairs(length, L, P), % Asocia cada sublista con su longitud.
    keysort(P, SP),                  % Ordena las parejas por clave (longitud).
    pairs_values(SP, S).             % Extrae las sublistas ordenadas.

% Ejemplo de uso:
% ?- lsort([[a, b, c], [d, e], [f]], S).
% S = [[f], [d, e], [a, b, c]].
% ----------------------------------------------
```
