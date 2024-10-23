```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que crea una lista 
%              con todos los enteros dentro de un rango 
%              dado. Se incluye una versión comentada 
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para crear una lista con todos los enteros en un rango dado en C#.
%     static List<int> Range(int start, int end)
%     {
%         if (start > end)
%             return new List<int>(); // Retorna una lista vacía si el rango es inválido.

%         List<int> result = new List<int>();
%         for (int i = start; i <= end; i++)
%         {
%             result.Add(i); // Agrega el número al resultado.
%         }
%         return result;
%     }

%     static void Main()
%     {
%         int start = 1;
%         int end = 5;
%         var lista = Range(start, end);

%         Console.WriteLine("Lista de enteros en el rango: " + string.Join(", ", lista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado range(I, K, List) que crea una lista con 
% todos los enteros desde I hasta K.

% Caso base: cuando el inicio y el final son iguales, 
% devuelve una lista con el único elemento I.
range(I, I, [I]).

% Caso recursivo: agrega el inicio a la lista y continúa 
% con el siguiente número.
range(I, K, [I|R]) :-
    I < K,
    I1 is I + 1,
    range(I1, K, R).

% Ejemplo de uso:
% ?- range(1, 5, R).
% R = [1, 2, 3, 4, 5].
% ----------------------------------------------
```
