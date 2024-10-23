```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que genera una 
%              permutación aleatoria de los elementos 
%              de una lista. Utiliza la selección aleatoria 
%              para construir la permutación.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función para generar una permutación aleatoria de los elementos de una lista en C#.
%     static List<T> RandomPermutation<T>(List<T> list)
%     {
%         Random random = new Random();
%         List<T> result = new List<T>(list); // Crea una copia de la lista original.

%         for (int i = result.Count - 1; i > 0; i--)
%         {
%             int j = random.Next(i + 1); // Selecciona un índice aleatorio.
%             // Intercambia elementos en las posiciones i y j.
%             T temp = result[i];
%             result[i] = result[j];
%             result[j] = temp;
%         }
%         return result; // Devuelve la permutación aleatoria.
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         var permutacion = RandomPermutation(lista);

%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_permu(L, P) que genera una permutación 
% aleatoria de los elementos de la lista L y los unifica con P.

rnd_permu(L, P) :-
    length(L, Len), % Calcula la longitud de la lista original.
    rnd_select(L, Len, P). % Selecciona aleatoriamente todos los elementos para crear la permutación.

% Ejemplo de uso:
% ?- rnd_permu([a, b, c, d, e], P).
% P = [c, e, a, b, d]. % El resultado puede variar por ser aleatorio.
% ----------------------------------------------
```
