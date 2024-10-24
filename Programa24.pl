
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que extrae N números 
%              aleatorios de un rango dado M. Utiliza 
%              la función range para generar la lista 
%              de números y luego selecciona aleatoriamente.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función para generar una lista de números en un rango y seleccionar aleatoriamente N de ellos.
%     static List<int> Lotto(int n, int m)
%     {
%         List<int> numbers = new List<int>();
%         for (int i = 1; i <= m; i++)
%         {
%             numbers.Add(i); // Genera la lista de números del 1 al M.
%         }
%         Random random = new Random();
%         List<int> result = new List<int>();

%         for (int i = 0; i < n; i++)
%         {
%             if (numbers.Count == 0) break; // Si la lista está vacía, termina.
%             int index = random.Next(numbers.Count); // Selecciona un índice aleatorio.
%             result.Add(numbers[index]); // Agrega el número seleccionado.
%             numbers.RemoveAt(index); // Elimina el número de la lista original.
%         }
%         return result;
%     }

%     static void Main()
%     {
%         int n = 3;
%         int m = 49;
%         var seleccionados = Lotto(n, m);

%         Console.WriteLine("Números seleccionados aleatoriamente: " + string.Join(", ", seleccionados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lotto(N, M, L) que extrae N números aleatorios 
% del rango 1 a M y los unifica con L.

lotto(N, M, L) :-
    range(1, M, R), % Genera la lista de números del 1 al M.
    rnd_select(R, N, L). % Selecciona N números aleatorios de la lista generada.

% Ejemplo de uso:
% ?- lotto(5, 49, L).
% L = [3, 17, 25, 8, 12]. % El resultado puede variar por ser aleatorio.
% ----------------------------------------------

