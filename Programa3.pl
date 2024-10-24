
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el k-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el k-ésimo elemento de una lista en C#.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || k <= 0 || k > list.Count)
%             throw new ArgumentException("El índice K debe ser mayor que 0 y menor o igual al tamaño de la lista.");
%         
%         return list[k - 1]; // Devuelve el k-ésimo elemento (índice base 1).
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char elemento = ElementAt(lista, 3);
% 
%         Console.WriteLine("El elemento en la posición 3 es: " + elemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que determina el k-ésimo
% elemento X de la lista List.

% Caso base: el primer elemento de la lista es el k-ésimo cuando K es 1.
element_at(X, [X|_], 1).

% Caso recursivo: disminuye el valor de K y sigue evaluando con la cola de la lista.
element_at(X, [_|Tail], K) :-
    K > 1,
    K1 is K - 1,
    element_at(X, Tail, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d], 3).
% X = c.
% ----------------------------------------------

