
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que inserta un 
%              elemento en una lista en la posición 
%              dada. El índice K debe ser mayor que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para insertar un elemento en una lista en la posición dada en C#.
%     static void InsertAt<T>(List<T> list, T element, int k)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         if (k <= 0 || k > list.Count + 1)
%             throw new ArgumentOutOfRangeException("El índice está fuera del rango válido.");

%         list.Insert(k - 1, element); // Inserta el elemento en la posición k.
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char element = 'X';
%         int k = 3;
%         InsertAt(lista, element, k);

%         Console.WriteLine("Lista después de insertar el elemento: " + string.Join(", ", lista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado insert_at(X, List, K, Result) que inserta el 
% elemento X en la lista List en la posición K, unificando 
% el resultado con Result.

% Caso base: cuando K es 1, inserta el elemento en la cabeza de la lista.
insert_at(X, L, 1, [X|L]).

% Caso recursivo: disminuye el índice K y continúa con el resto de la lista.
insert_at(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    insert_at(X, T, K1, R).

% Ejemplo de uso:
% ?- insert_at(X, [a, b, c, d], X, 3, R).
% R = [a, b, X, c, d].
% ----------------------------------------------

