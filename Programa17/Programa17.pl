
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que divide una 
%              lista en dos partes. La longitud de la
%              primera parte está dada por el segundo argumento.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para dividir una lista en dos partes en C#.
%     static void Split<T>(List<T> list, int n, out List<T> firstPart, out List<T> secondPart)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         if (n < 0 || n > list.Count)
%             throw new ArgumentOutOfRangeException("El valor de n está fuera del rango válido.");

%         firstPart = list.GetRange(0, Math.Min(n, list.Count)); // Toma los primeros 'n' elementos.
%         secondPart = list.GetRange(firstPart.Count, list.Count - firstPart.Count); // Toma el resto de la lista.
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' };
%         int n = 3;
%         Split(lista, n, out List<char> primeraParte, out List<char> segundaParte);

%         Console.WriteLine("Primera parte: " + string.Join(", ", primeraParte));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", segundaParte));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado split(List, N, List1, List2) que divide la lista List en dos partes.
% La longitud de la primera parte está dada por el segundo argumento N.

% Caso base: cuando N es 0, la primera lista está vacía y la segunda es la lista original.
split(L, 0, [], L).

% Caso recursivo: divide la lista moviendo el primer elemento a la primera lista y decrece N.
split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- split([a, b, c, d, e, f, g, h], 3, L1, L2).
% L1 = [a, b, c],
% L2 = [d, e, f, g, h].
% ----------------------------------------------
