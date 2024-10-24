% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera un árbol 
%              de Huffman dado un conjunto de frecuencias.
% ===============================================

% El algoritmo de Huffman se utiliza para la compresión de datos,
% construyendo un árbol binario óptimo para la codificación.
huffman(Fs, Hs) :- 
    length(Fs, Len), 
    Len > 1, 
    sort(2, @=<, Fs, Sorted), 
    huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).

% Ejemplo de uso:
% ?- huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], Hs).
% Hs = ... (resultado del árbol de Huffman).
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que genera un árbol 
%              de Huffman dado un conjunto de frecuencias.
% ===============================================

% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Nodo
% {
%     public char Caracter { get; set; }
%     public int Frecuencia { get; set; }
%     public Nodo Izquierda { get; set; }
%     public Nodo Derecha { get; set; }

%     public Nodo(char caracter, int frecuencia)
%     {
%         Caracter = caracter;
%         Frecuencia = frecuencia;
%         Izquierda = null;
%         Derecha = null;
%     }
% }

% class Program
% {
%     static void Main()
%     {
%         var frecuencias = new Dictionary<char, int>
%         {
%             { 'a', 5 },
%             { 'b', 9 },
%             { 'c', 12 },
%             { 'd', 13 },
%             { 'e', 16 },
%             { 'f', 45 }
%         };

%         Nodo raiz = ConstruirArbolHuffman(frecuencias);
%         // Aquí puedes implementar la lógica para imprimir el árbol o codificar los caracteres.
%     }

%     static Nodo ConstruirArbolHuffman(Dictionary<char, int> frecuencias)
%     {
%         var nodos = frecuencias.Select(f => new Nodo(f.Key, f.Value)).ToList();

%         while (nodos.Count > 1)
%         {
%             // Ordenar los nodos por frecuencia
%             nodos = nodos.OrderBy(n => n.Frecuencia).ToList();

%             // Tomar los dos nodos de menor frecuencia
%             var izquierdo = nodos[0];
%             var derecho = nodos[1];

%             // Crear un nuevo nodo padre
%             var nuevoNodo = new Nodo('\0', izquierdo.Frecuencia + derecho.Frecuencia)
%             {
%                 Izquierda = izquierdo,
%                 Derecha = derecho
%             };

%             // Reemplazar los nodos originales con el nuevo nodo
%             nodos.RemoveRange(0, 2);
%             nodos.Add(nuevoNodo);
%         }

%         return nodos.First(); // Retornar la raíz del árbol de Huffman
%     }
% }
