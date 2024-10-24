
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que duplica los 
%              elementos de una lista.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista en C#.
%     static List<T> Dupli<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");

%         var result = new List<T>();

%         foreach (T item in list)
%         {
%             result.Add(item); // Agrega el elemento una vez.
%             result.Add(item); // Agrega el elemento una segunda vez.
%         }

%         return result;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         var listaDuplicada = Dupli(lista);

%         Console.WriteLine("Lista duplicada: " + string.Join(", ", listaDuplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(List, Result) que duplica los 
% elementos de la lista List.

% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :-
    dupli(T, R).

% Ejemplo de uso:
% ?- dupli([a, b, c], R).
% R = [a, a, b, b, c, c].
% ----------------------------------------------
