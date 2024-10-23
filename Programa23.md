```c#
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que extrae un número 
%              dado de elementos aleatorios de una lista.
%              Utiliza un generador de números aleatorios 
%              y elimina los elementos seleccionados.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función para extraer N elementos aleatorios de una lista en C#.
%     static List<T> RandomSelect<T>(List<T> list, int n)
%     {
%         Random random = new Random();
%         List<T> result = new List<T>();

%         for (int i = 0; i < n; i++)
%         {
%             if (list.Count == 0) break; // Si la lista está vacía, termina.
%             int index = random.Next(list.Count); // Selecciona un índice aleatorio.
%             result.Add(list[index]); // Agrega el elemento seleccionado.
%             list.RemoveAt(index); // Elimina el elemento de la lista original.
%         }
%         return result;
%     }

%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         int n = 3;
%         var seleccionados = RandomSelect(lista, n);

%         Console.WriteLine("Elementos seleccionados aleatoriamente: " + string.Join(", ", seleccionados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_select(List, N, R) que extrae N elementos 
% aleatorios de la lista List y los unifica con R.

% Caso base: si se solicitan 0 elementos, el resultado es una lista vacía.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio, lo elimina
% de la lista y continúa con la selección del resto.
rnd_select(L, N, [X|R]) :-
    length(L, Len),
    random(1, Len, I), % Genera un índice aleatorio.
    element_at(X, L, I), % Obtiene el elemento en la posición I.
    delete(L, X, L1), % Elimina el elemento de la lista.
    N1 is N - 1,
    rnd_select(L1, N1, R).

% Ejemplo de uso:
% ?- rnd_select([a, b, c, d, e], 3, R).
% R = [b, a, d]. % El resultado puede variar por ser aleatorio.
% ----------------------------------------------
```
