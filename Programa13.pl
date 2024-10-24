
% ==============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que codifica directamente 
%              una lista usando codificación Run-Length.
%              Cuenta cuántos elementos consecutivos son iguales.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar directamente una lista usando codificación Run-Length en C#.
%     static List<(int count, T item)> EncodeDirect<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");

%         var result = new List<(int, T)>();
%         if (list.Count == 0) return result; // Caso base: lista vacía.

%         int count = 1;
%         T currentItem = list[0];

%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], currentItem))
%             {
%                 count++; // Incrementa el contador si el elemento es igual al anterior.
%             }
%             else
%             {
%                 result.Add((count, currentItem)); // Agrega el par (N, X) al resultado.
%                 currentItem = list[i]; // Actualiza el elemento actual.
%                 count = 1; // Reinicia el contador.
%             }
%         }

%         result.Add((count, currentItem)); // Agrega el último par (N, X).
%         return result;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'd', 'd', 'd' };
%         var listaCodificadaDirecta = EncodeDirect(lista);

%         foreach (var (count, item) in listaCodificadaDirecta)
%         {
%             Console.WriteLine($"({count}, {item})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_direct(List, Encoded) que codifica directamente 
% una lista usando codificación Run-Length.

% Caso base: lista vacía.
encode_direct([], []).

% Caso recursivo: cuenta cuántos elementos consecutivos son iguales y codifica el resto.
encode_direct([X|Xs], [[N,X]|R]) :-
    count(X, [X|Xs], N, Rest),
    encode_direct(Rest, R).

% Predicado count(X, List, N, Rest) que cuenta cuántos elementos consecutivos 
% son iguales al elemento X.

% Caso base: si la lista está vacía, el contador es 0.
count(_, [], 0, []).

% Caso recursivo: incrementa el contador si el siguiente elemento es igual a X.
count(X, [X|Xs], N, Rest) :-
    count(X, Xs, N1, Rest),
    N is N1 + 1.

% Termina la cuenta cuando el siguiente elemento es diferente de X.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% Ejemplo de uso:
% ?- encode_direct([a, a, b, c, c, d, d, d], R).
% R = [[2, a], [1, b], [2, c], [3, d]].
% ----------------------------------------------
