
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que extrae una 
%              porción de una lista, dado un rango.
%              Los índices I y K deben ser mayores que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para extraer una porción de una lista dado un rango en C#.
%     static List<T> Slice<T>(List<T> list, int start, int end)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         if (start <= 0 || end <= 0 || start > end || end > list.Count)
%             throw new ArgumentOutOfRangeException("Los índices están fuera del rango válido.");

%         return list.GetRange(start - 1, end - start + 1); // Extrae la sublista basada en el rango.
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' };
%         int start = 3;
%         int end = 6;
%         var sublista = Slice(lista, start, end);

%         Console.WriteLine("Sublista: " + string.Join(", ", sublista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado slice(List, I, K, SubList) que extrae una 
% porción de la lista List desde el índice I hasta el índice K.

% Caso base: cuando I y K son 1, se toma el primer elemento.
slice([H|_], 1, 1, [H]).

% Caso recursivo: cuando I es 1, se toma el elemento y se continúa hasta K.
slice([H|T], 1, K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    slice(T, 1, K1, R).

% Caso recursivo: disminuye los índices I y K hasta llegar al rango deseado.
slice([_|T], I, K, R) :-
    I > 1,
    I1 is I - 1,
    K1 is K - 1,
    slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a, b, c, d, e, f, g, h], 3, 6, R).
% R = [c, d, e, f].
% ----------------------------------------------

