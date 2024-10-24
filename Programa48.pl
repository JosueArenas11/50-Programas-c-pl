% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol 
%              binario de búsqueda a partir de una lista de enteros.
% ===============================================

% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo,
% todos los elementos en el subárbol izquierdo son menores y en el 
% subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).

% Ejemplo de uso:
% ?- construct([5, 3, 7, 2, 4, 6, 8], T).
% T = t(5, t(3, t(2, nil, nil), t(4, nil, nil)), t(7, t(6, nil, nil), t(8, nil, nil))).
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que construye un árbol 
%              binario de búsqueda a partir de una lista de enteros.
% ===============================================

% using System;
% using System.Collections.Generic;

% class Nodo
% {
%     public int Valor { get; set; }
%     public Nodo Izquierda { get; set; }
%     public Nodo Derecha { get; set; }

%     public Nodo(int valor)
%     {
%         Valor = valor;
%         Izquierda = null;
%         Derecha = null;
%     }
% }

% class Program
% {
%     static void Main()
%     {
%         List<int> lista = new List<int> { 5, 3, 7, 2, 4, 6, 8 };
%         Nodo raiz = Construct(lista);
%         // Aquí podrías implementar un recorrido del árbol para mostrarlo.
%     }

%     static Nodo Construct(List<int> lista)
%     {
%         Nodo raiz = null;
%         foreach (var valor in lista)
%         {
%             raiz = Add(valor, raiz);
%         }
%         return raiz;
%     }

%     static Nodo Add(int valor, Nodo nodo)
%     {
%         if (nodo == null)
%         {
%             return new Nodo(valor);
%         }
%         if (valor < nodo.Valor)
%         {
%             nodo.Izquierda = Add(valor, nodo.Izquierda);
%         }
%         else
%         {
%             nodo.Derecha = Add(valor, nodo.Derecha);
%         }
%         return nodo;
%     }
% }
