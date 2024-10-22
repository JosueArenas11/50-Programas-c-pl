```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que aplana 
%              una lista anidada en una lista simple.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para aplanar una lista anidada en C#.
%     static List<T> Flatten<T>(List<object> list)
%     {
%         List<T> flatList = new List<T>();
%         
%         foreach (var item in list)
%         {
%             if (item is List<object> nestedList)
%             {
%                 // Llamada recursiva para aplanar la lista anidada.
%                 flatList.AddRange(Flatten<T>(nestedList));
%             }
%             else
%             {
%                 flatList.Add((T)item); // Agrega el elemento a la lista plana.
%             }
%         }
%         
%         return flatList;
%     }
% 
%     static void Main()
%     {
%         var listaAnidada = new List<object> { 'a', new List<object> { 'b', 'c' }, 'd' };
%         var listaPlana = Flatten<char>(listaAnidada);
% 
%         Console.WriteLine("La lista plana es: " + string.Join(", ", listaPlana));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_flatten(NestedList, FlatList) que aplana
% la lista anidada NestedList en una lista simple FlatList.

% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :-
    my_flatten(H, FH),
    my_flatten(T, FT),
    append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- X \= [], \+ is_list(X).

% Ejemplo de uso:
% ?- my_flatten([a, [b, c], d], Flat).
% Flat = [a, b, c, d].
% ----------------------------------------------
```
