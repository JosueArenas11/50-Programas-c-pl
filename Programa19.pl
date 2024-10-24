
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que rota una lista 
%              N lugares a la izquierda. Utiliza la 
%              longitud de la lista para manejar rotaciones 
%              mayores que la longitud.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para rotar una lista N lugares a la izquierda en C#.
%     static List<T> Rotate<T>(List<T> list, int n)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         int len = list.Count;
%         if (len == 0)
%             return new List<T>();

%         n = n % len; // Maneja rotaciones mayores que la longitud de la lista.
%         if (n < 0)
%             n += len; // Ajusta n para valores negativos.

%         List<T> firstPart = list.GetRange(0, n);
%         List<T> secondPart = list.GetRange(n, len - n);
%         secondPart.AddRange(firstPart);

%         return secondPart;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int n = 2;
%         var listaRotada = Rotate(lista, n);

%         Console.WriteLine("Lista rotada: " + string.Join(", ", listaRotada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rotate(List, N, RotatedList) que rota la lista 
% List N lugares a la izquierda.

% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :-
    length(L, Len),
    N1 is N mod Len,           % Ajusta N para manejar rotaciones mayores que la longitud.
    split(L, N1, L1, L2),      % Divide la lista en dos partes.
    append(L2, L1, R).         % Une las partes en orden inverso para obtener la lista rotada.

% Ejemplo de uso:
% ?- rotate([a, b, c, d, e, f], 2, R).
% R = [c, d, e, f, a, b].
% ----------------------------------------------

