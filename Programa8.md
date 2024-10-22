```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que elimina 
%              duplicados consecutivos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar duplicados consecutivos de una lista en C#.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         
%         List<T> result = new List<T>();
%         T previous = default(T);
%         bool hasPrevious = false;

%         foreach (var item in list)
%         {
%             if (!hasPrevious || !EqualityComparer<T>.Default.Equals(item, previous))
%             {
%                 result.Add(item); // Agrega el elemento si es diferente al anterior.
%                 previous = item;
%                 hasPrevious = true;
%             }
%         }

%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'd' };
%         var listaSinDuplicados = Compress(lista);
% 
%         Console.WriteLine("La lista sin duplicados consecutivos es: " + string.Join(", ", listaSinDuplicados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado compress(List, Result) que elimina
% duplicados consecutivos de la lista List y
% devuelve el resultado en Result.

% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).

% Ejemplo de uso:
% ?- compress([a, a, b, c, c, c, d], R).
% R = [a, b, c, d].
% ----------------------------------------------
```
