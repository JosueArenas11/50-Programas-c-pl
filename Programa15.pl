
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que duplica los 
%              elementos de una lista un número dado de veces.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista un número dado de veces en C#.
%     static List<T> Dupli<T>(List<T> list, int n)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");

%         var result = new List<T>();

%         foreach (T item in list)
%         {
%             for (int i = 0; i < n; i++)
%             {
%                 result.Add(item); // Agrega el elemento 'n' veces.
%             }
%         }

%         return result;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         int n = 3;
%         var listaDuplicada = Dupli(lista, n);

%         Console.WriteLine("Lista duplicada: " + string.Join(", ", listaDuplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(List, N, Result) que duplica los 
% elementos de la lista List un número dado de veces N.

% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :-
    duplicate(H, N, D),
    dupli(T, N, R1),
    append(D, R1, R).

% Predicado duplicate(X, N, D) que crea una lista con N repeticiones del elemento X.

% Caso base: si N es 0, la lista está vacía.
duplicate(_, 0, []).

% Caso recursivo: agrega el elemento X y reduce el contador.
duplicate(X, N, [X|R]) :-
    N > 0,
    N1 is N - 1,
    duplicate(X, N1, R).

% Ejemplo de uso:
% ?- dupli([a, b, c], 3, R).
% R = [a, a, a, b, b, b, c, c, c].
% ---------------------------------------------

