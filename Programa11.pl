
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que modifica la
%              codificación Run-Length de una lista.
%              Si un elemento no tiene duplicados,
%              se mantiene sin empaquetar.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para modificar la codificación Run-Length de una lista en C#.
%     static List<object> EncodeModified<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");

%         var encodedList = Encode(list); // Llama a la función de codificación Run-Length.
%         var result = new List<object>();

%         foreach (var (count, item) in encodedList)
%         {
%             if (count == 1)
%             {
%                 result.Add(item); // Si no hay duplicados, agrega el elemento sin empaquetar.
%             }
%             else
%             {
%                 result.Add((count, item)); // Mantén el formato (N, X) si hay duplicados.
%             }
%         }

%         return result;
%     }

%     // Función auxiliar para la codificación Run-Length.
%     static List<(int, T)> Encode<T>(List<T> list)
%     {
%         var result = new List<(int, T)>();
%         if (list.Count == 0) return result;

%         int count = 1;
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 count++;
%             }
%             else
%             {
%                 result.Add((count, list[i - 1]));
%                 count = 1;
%             }
%         }

%         result.Add((count, list[^1]));
%         return result;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'd', 'e' };
%         var listaModificada = EncodeModified(lista);

%         foreach (var item in listaModificada)
%         {
%             Console.WriteLine(item);
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_modified(List, Result) que modifica la
% codificación Run-Length de la lista List.

% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).

% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).

% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a, a, b, c, c, d, e], R).
% R = [[2, a], b, [2, c], d, e].
% ----------------------------------------------
