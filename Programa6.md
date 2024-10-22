```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que verifica 
%              si una lista es un palíndromo.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para verificar si una lista es un palíndromo en C#.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Invierte la lista.
%         return list.SequenceEqual(reversedList); // Compara la lista original con la invertida.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'a' };
%         bool esPalindromo = IsPalindrome(lista);
% 
%         Console.WriteLine("¿La lista es un palíndromo? " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado palindrome(L) que verifica si la lista L
% es un palíndromo comparándola con su inversa.

palindrome(L) :- reverse_list(L, L).

% Ejemplo de uso:
% ?- palindrome([a, b, a]).
% true.
% ----------------------------------------------
```
