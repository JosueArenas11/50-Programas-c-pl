% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un árbol 
%              binario es simétrico.
% ===============================================

% Un árbol es simétrico si sus subárboles izquierdo y derecho 
% son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Ejemplo de uso:
% ?- symmetric(t(1, t(2, nil, nil), t(2, nil, nil))).
% true.
% ===============================================
% Autor: Josue Arenas Herrera
% Fecha: 24 de octubre de 2024
% Descripción: Programa en C# que comprueba si un árbol 
%              binario es simétrico.
% ===============================================

% using System;

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
%         Nodo raiz = new Nodo(1)
%         {
%             Izquierda = new Nodo(2),
%             Derecha = new Nodo(2)
%         };
%         bool esSimetrico = EsSimetrico(raiz);
%         Console.WriteLine("¿El árbol es simétrico? " + esSimetrico);
%     }

%     static bool EsSimetrico(Nodo nodo)
%     {
%         return nodo == null || EsEspejo(nodo.Izquierda, nodo.Derecha);
%     }

%     static bool EsEspejo(Nodo a, Nodo b)
%     {
%         if (a == null && b == null) return true;
%         if (a == null || b == null) return false;
%         return a.Valor == b.Valor && EsEspejo(a.Izquierda, b.Derecha) && EsEspejo(a.Derecha, b.Izquierda);
%     }
% }
