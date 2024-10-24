
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que codifica 
%              una lista usando codificación Run-Length.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar una lista usando codificación Run-Length en C#.
%     static List<(int count, T item)> Encode<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         
%         var result = new List<(int, T)>();
%         if (list.Count == 0) return result; // Caso base: lista vacía.

%         int count = 1;
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 count++; // Incrementa el contador si son iguales.
%             }
%             else
%             {
%                 result.Add((count, list[i - 1])); // Agrega la pareja (N, X) al resultado.
%                 count = 1; // Reinicia el contador.
%             }
%         }

%         result.Add((count, list[^1])); // Agrega la última pareja.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'd', 'd', 'd' };
%         var listaCodificada = Encode(lista);
% 
%         foreach (var (count, item) in listaCodificada)
%         {
%             Console.WriteLine($"({count}, {item})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode(List, Encoded) que codifica
% una lista usando codificación Run-Length.

% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :-
    length([X|Xs], N), 
    transform(Ys, Zs).

% Ejemplo de uso:
% ?- encode([a, a, b, c, c, d, d, d], Encoded).
% Encoded = [[2, a], [1, b], [2, c], [3, d]].
% ----------------------------------------------
