
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que elimina cada 
%              n-ésimo elemento de una lista.
%              Utiliza un contador para determinar cuándo eliminar un elemento.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar cada n-ésimo elemento de una lista en C#.
%     static List<T> Drop<T>(List<T> list, int n)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         if (n <= 0)
%             throw new ArgumentException("El valor de n debe ser mayor que cero.");

%         var result = new List<T>();
%         int count = 1; // Contador para rastrear el índice de los elementos.

%         foreach (T item in list)
%         {
%             if (count % n != 0)
%             {
%                 result.Add(item); // Agrega el elemento si no es el n-ésimo.
%             }
%             count++;
%         }

%         return result;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i' };
%         int n = 3;
%         var listaModificada = Drop(lista, n);

%         Console.WriteLine("Lista modificada: " + string.Join(", ", listaModificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado drop(List, N, Result) que elimina cada 
% n-ésimo elemento de la lista List.

% Predicado auxiliar drop(List, Counter, N, Result) que utiliza un contador para rastrear el índice.

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :-
    drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :-
    K > 1,
    K1 is K - 1,
    drop(T, K1, N, R).

% Ejemplo de uso:
% ?- drop([a, b, c, d, e, f, g, h, i], 3, R).
% R = [a, b, d, e, g, h].
% ----------------------------------------------

