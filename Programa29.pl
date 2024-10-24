
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 19 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista 
%              de listas según la frecuencia de las longitudes 
%              de las sublistas. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     // Función que ordena las listas por la frecuencia de sus longitudes.
%     static List<List<T>> OrdenarPorFrecuenciaLongitud<T>(List<List<T>> listas)
%     {
%         var frecuencias = listas
%             .GroupBy(lista => lista.Count) // Agrupa por longitud.
%             .ToDictionary(g => g.Key, g => g.Count()); // Calcula la frecuencia.

%         return listas
%             .OrderBy(lista => frecuencias[lista.Count]) // Ordena por frecuencia.
%             .ThenBy(lista => lista.Count) // Desempate por longitud.
%             .ToList();
%     }

%     static void Main()
%     {
%         var listas = new List<List<char>> 
%         { 
%             new List<char> { 'a', 'b' }, 
%             new List<char> { 'c' }, 
%             new List<char> { 'd', 'e' }, 
%             new List<char> { 'f', 'g', 'h' } 
%         };

%         var listasOrdenadas = OrdenarPorFrecuenciaLongitud(listas);

%         Console.WriteLine("Listas ordenadas por frecuencia de longitud:");
%         foreach (var lista in listasOrdenadas)
%         {
%             Console.WriteLine($"[{string.Join(", ", lista)}]);
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado length_frequency(L, F) que ordena una lista 
% de listas según la frecuencia de las longitudes de las sublistas.

length_frequency(L, F) :-
    map_list_to_pairs(length, L, P), % Asocia cada sublista con su longitud.
    msort(P, SP),                    % Ordena las parejas por longitud.
    encode(SP, F).                   % Codifica las frecuencias de longitud.

% Predicado encode para calcular las frecuencias de los elementos.
encode([], []).
encode([K-V|T], [K-L|R]) :-
    encode_helper(T, K, [V], L, Rest),
    encode(Rest, R).

% Auxiliar que agrupa elementos con la misma clave.
encode_helper([K-V|T], K, Acc, L, Rest) :- 
    !, encode_helper(T, K, [V|Acc], L, Rest).
encode_helper(Rest, _, Acc, Acc, Rest).

% Ejemplo de uso:
% ?- length_frequency([[a, b], [c], [d, e], [f, g, h]], S).
% S = [[c], [a, b], [d, e], [f, g, h]].
% ----------------------------------------------

