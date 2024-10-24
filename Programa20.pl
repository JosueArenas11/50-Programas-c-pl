
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que elimina el 
%              k-ésimo elemento de una lista.
%              El índice K debe ser mayor que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar el k-ésimo elemento de una lista en C#.
%     static void RemoveAt<T>(List<T> list, int k)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         if (k <= 0 || k > list.Count)
%             throw new ArgumentOutOfRangeException("El índice está fuera del rango válido.");

%         list.RemoveAt(k - 1); // Elimina el elemento en la posición k.
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         int k = 3;
%         RemoveAt(lista, k);

%         Console.WriteLine("Lista después de eliminar el k-ésimo elemento: " + string.Join(", ", lista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado remove_at(X, List, K, Result) que elimina el 
% k-ésimo elemento de la lista List y unifica el resultado con Result.

% Caso base: cuando K es 1, elimina el primer elemento y devuelve el resto.
remove_at(X, [X|T], 1, T).

% Caso recursivo: disminuye el índice K y continúa con el resto de la lista.
remove_at(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    remove_at(X, T, K1, R).

% Ejemplo de uso:
% ?- remove_at(X, [a, b, c, d, e], 3, R).
% X = c,
% R = [a, b, d, e].
% ----------------------------------------------
