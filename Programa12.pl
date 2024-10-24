
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que decodifica 
%              una lista codificada mediante Run-Length.
%              Expande cada par (N, X) en una lista con 
%              N elementos X.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para decodificar una lista codificada mediante Run-Length en C#.
%     static List<T> Decode<T>(List<(int count, T item)> encodedList)
%     {
%         if (encodedList == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");

%         var result = new List<T>();

%         foreach (var (count, item) in encodedList)
%         {
%             for (int i = 0; i < count; i++)
%             {
%                 result.Add(item); // Expande el elemento X N veces.
%             }
%         }

%         return result;
%     }

%     static void Main()
%     {
%         List<(int, char)> listaCodificada = new List<(int, char)>
%         {
%             (2, 'a'), (1, 'b'), (2, 'c'), (3, 'd')
%         };

%         var listaDecodificada = Decode(listaCodificada);
%         Console.WriteLine("Lista decodificada: " + string.Join(", ", listaDecodificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado decode(List, Decoded) que decodifica una lista 
% codificada mediante Run-Length.

% Caso base: lista vacía.
decode([], []).

% Caso recursivo: expande cada par (N, X) y decodifica el resto de la lista.
decode([[N,X]|T], R) :-
    decode(T, R1),
    expand(X, N, E),
    append(E, R1, R).

% Predicado expand(X, N, Expanded) que expande un elemento X 
% en una lista de longitud N.

% Caso base: si N es 0, la lista está vacía.
expand(_, 0, []).

% Caso recursivo: agrega el elemento X y reduce el contador.
expand(X, N, [X|T]) :-
    N > 0,
    N1 is N - 1,
    expand(X, N1, T).

% Ejemplo de uso:
% ?- decode([[2, a], [1, b], [2, c], [3, d]], R).
% R = [a, a, b, c, c, d, d, d].
% ----------------------------------------------


