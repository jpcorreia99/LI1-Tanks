-- | Este módulo define funções comuns da Tarefa 1 do trabalho prático.
{-# OPTIONS_HADDOCK prune #-}
module Tarefa1_2018li1g088 where

import LI11819
import Tarefa0_2018li1g088

-- * Testes

-- | Testes unitários da Tarefa 1.
--
-- Cada teste é uma sequência de 'Instrucoes'.
testesT1 :: [Instrucoes]
testesT1 = [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10]
t1 = [Move C,Move C,Move C, Roda, Roda, MudaParede, Roda, MudaTetromino,Move D,Desenha]
t2 = [Move C,Move C,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move C,Move C,Move C,Move C,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Roda,Move B,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,Move E,Desenha,Move D,Move D,Move D,Move D,Desenha,Move D,Move D,Move D,Desenha,Move D,Move D,Move D,Move D,Desenha,Move B,Move E,Move E,Move E,Move E,Move E,Roda,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move C,Desenha,Move C,Desenha,Move E,Move C]
t3 = [Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move E,Move B,Move D,Move E,Move D,Move E,Move D,Move E,Move D,Move E,Move D,Move E,Move E,Move D,Move D,Move E,Roda,Move E,Desenha,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move D,Move D,MudaTetromino,Move D,MudaTetromino,Move E,Move E,Move E,Move D,MudaParede,Desenha,Move B,Move B,Move E,Move E,Desenha,Move D,Move B,Move B,Move D,Move D,Move E,Move C,Move E,Move C,Move E,MudaTetromino,Move E,Move C,Move E,Move C,Move C,Desenha,Move D,Move D,Move E,Move B,Move D,Move E,Move B,Move E,Move B,Move D,Move E,Move B,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move C,Move D,Move D,Move D,MudaParede,Move D,Move C,Move D,Move C,Desenha,Move E,Move B,Move E,Move B,Move E,Move B,Move E,MudaTetromino,MudaTetromino,Move D,Move D,Move D,Move D,Move B,Desenha,Move E,Move E,Move E,Move E,MudaTetromino,MudaTetromino,Move E,Move E,Move C,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Roda,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move E,Desenha,Move D,Move D,Move D,Desenha,Move D,Move D,Move D,MudaTetromino,MudaTetromino,Move D,Move B,MudaTetromino,MudaTetromino,Move D,Move B,Move E,Move B,Move B,Move E,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move C,MudaTetromino,MudaTetromino,MudaTetromino,Move B,Move B,Desenha,Move C,Move C,Desenha,Move E,Move E,Move E,Move B,Move C,MudaTetromino,MudaTetromino,MudaParede,Move B,Move B,Move D,Move B,Desenha,Move E,Move C,Move C,Move C,Move E,Desenha,Move D,Move C,Move C,Move C,Move C,Move E,Move E,Move E,MudaTetromino,Desenha,Move D,Move D,Move D,Move D,Move D,Move C,MudaTetromino,Move E,Move C,Move E,Move C,Move E,Move C,Move E,MudaTetromino,Move C,MudaTetromino,Move C,Move C,Desenha,Move B,Move B,Move B,Move D,MudaTetromino,Move B,Move D,Desenha]
t4 = [Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Roda,Move E,Desenha,Move D,Move D,Move D,Roda,Move D,Move B,Desenha,Move D,Move D,Move C,Move D,Move D,Move D,Move D,Roda,Desenha,Move E,Move B,Move E,Move B,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,MudaTetromino,Move E,Move E,Move E,Move E,Move E,Move E,MudaParede,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move B,Move B,Move C,Move B,Move C,Move B,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,MudaTetromino,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move B,Move E,Move E,Move B,Move E,Move B,Move B,Move E,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,Move E,MudaTetromino,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,MudaParede,Move D,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,MudaTetromino,Move E,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,Move E,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Desenha,MudaTetromino,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Move E,Move E,MudaParede,Move B,Move E,Move E,Move E,Move E,Move B,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Move C,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Move B,Desenha,Move D,Move D,Move D,Roda,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Desenha,MudaTetromino,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,Roda,Move D,Move C,Desenha,Roda,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move D,Roda,Roda,Roda,Roda,Desenha,Move D,Move D,Move D,Move D,Roda,Move B,Desenha,MudaParede,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move C,Desenha,Move D,Move D,Move D,Move D,Move D,Roda,Move E,Desenha,Move C,Move C,Move C,Move C,Roda,Move E,Move C,Desenha,Move D,Move D,Roda,Move C,Move C,Move C,Move C,Desenha,Move B,Move B,Move B,Move B,Move D,MudaTetromino,Move E,Move B,Move E,Move B,Move E,Move B,Move E]
t5 = [Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move E,Desenha,Move C,Roda,Move B,Move B,Roda,Roda,Move B,Move B,Move B,Move B,Roda,Roda,Roda,Roda,Desenha,Move C,Move C,Move D,Move E,Roda,Move B,Move B,Roda,Move C,Roda,Roda,Roda,Move B,Desenha,Move C,Move C,Move C,Move C,Move D,Move D,Move D,MudaParede,Move B,Move B,Move B,Move B,Desenha,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move D,Roda,MudaTetromino,Roda,Roda,Move B,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,MudaParede,Desenha,Move C,Move C]
t6 = [Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move E,Desenha,Move C,Roda,Move B,Move B,Roda,Roda,Move B,Move B,Move B,Move B,Roda,Roda,Roda,Roda,Desenha,Move C,Move C,Move D,Move E,Roda,Move B,Move B,Roda,Move C,Roda,Roda,Roda,Move B,Desenha,Move C,Move C,Move C,Move C,Move D,Move D,Move D,MudaParede,Move B,Move B,Move B,Move B,Desenha,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move D,Roda,MudaTetromino,Roda,Roda,Move B,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,MudaParede,Desenha,Move C,Move C]
t7 = [Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move D]
t8 = [Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move E,Move B,Move D,MudaTetromino,MudaTetromino,MudaTetromino,Move D,Move B,Desenha,Move D,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,MudaTetromino,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move D,Move D,Move E,Move E,MudaParede,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move C,Desenha,Move E,Move E,Move E,Move E,Move E,MudaParede,Desenha,Move E,Move E,Move E,Move E,Move E,MudaTetromino,Move B,Desenha,Move E,Move E,Move E,Move E,MudaParede,Move E,Move E,Move D,Move E,Move E,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move E,Desenha,Move D,Move D,Move D,Move D,Move E,MudaParede,Desenha,Move D,Move D,Move D,Move D,MudaTetromino,Desenha,Move D,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Move D,MudaTetromino,Move E,Desenha,Move D,Move D,Move D,Move D,MudaParede,Move D,Move D,Move E,Move E,Desenha,Move C,Move D,Move C,MudaTetromino]
t9 = [Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move D,Move B,Move B,Desenha,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Roda,Move D,Move C,Desenha,Move B,Move B,Move B,MudaParede,Desenha,Move D,Move D,Move D,Move D,Roda,Move C,Move C,Desenha,Move D,Move D,Move D,MudaParede,Desenha,Move D,Move D,Move D,Roda,Move D,Move D,Move C,Move C,Move D,Move D,Move E,Move E,Desenha,Move B,Move B,Move B,MudaParede,Desenha,Move B,Move E,Move E,Move B,Move E,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,MudaTetromino,Move C,Move E,Move C,Move E,Move C,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,MudaParede,Move B,Move B,Move E,Move E,Move B,Move E,Move E,Move E,Move D,Move B,Desenha,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Roda,Move D,Desenha,Move B,Move B,Move B,MudaParede,Move D,Move D,Move D,Move D,Move C,Move D,Move C,Move C,Move C,Move E,Move B,Desenha,Move B,Move B,Move B,Move E,Move B,Move E,Move E,Roda,Move E,Move B,Desenha,Move D,Move D,Move D,Move D,MudaParede,Move D,Desenha,Move D,Move D,Move C,Move C,Move C,Move C,Roda,Move D,Move C,Move E,Desenha,MudaParede,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move B,Desenha,MudaParede,Move D,Move D,Move D,Move D,Desenha,Move D,Move D,Move D,Move D,Move D,Move E,Roda,Desenha,MudaParede,Move B,Move B,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Move C,Move C,Roda,Move E,Move B,Desenha,Move D,Move D,Move D,MudaParede,Move D,Desenha,Move C,Roda,Move C,Move C,Move C,Move C,Move E,Desenha,Move D,Move D,Move D,MudaParede,Move D,Move D,Move D,Move D,Move E,Move E,Move C,Move C,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move B,Desenha,MudaParede,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move E,Desenha,Move B,Move B,Move B,Move E,Move E,Move B,Move E,MudaTetromino,Move E,Desenha,Move D,Move D,Move D,Move D,Roda,Roda,Roda,Roda,MudaParede,Move D,Move D,Move E,Move E,Desenha,Move C,Move C,Move C,Roda,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Move C,Move C,Move C,Move C,Move E,Move E,Move D,Desenha,MudaParede,Move C,Move C,Move C,Move C,Move D,Desenha,Move B,Move B,Roda,Move D,Move D,Move D,Move D,Move D,Move C,Move D,Move E,Move C,Desenha,Move B,Move B,Move B,MudaParede,Move B,Move B,Desenha,Move B,Move B,Move B,Move B,Move B,Roda,Move E,Move E,Move E,Move E,Move E,Move C,Move D,Desenha,MudaParede,Move D,Move D,Move D,Move D,Move B,Move B,Move E,Move B,Desenha,Move B,Move B,MudaTetromino,Move B,Move D,Move D,Move D,Move D,Move E,Move E,Move E,Move E,Move D,Desenha,Move B,Move B,Move D,Move D,Move D,Move B,MudaParede,Move D,Move E,Move D,Move D,Move D,Move D,Move E,Move E,Move E,Move C,Move D,Desenha,Move C,Move C,Roda,Move C,Move C,Desenha,MudaParede,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Desenha,Move C,Move C,Move C,Roda,Move C,Move E,Desenha,Move D,Move C,Move C,MudaParede,Move C,Move C,Move E,Desenha,Move B,Roda,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move E,Move C,Move E,Desenha,Move B,Move B,Move B,Move B,MudaParede,Move B,Move D,Desenha,Move B,Move B,Move B,Move B,MudaTetromino,Move B,Desenha,Move B,Move B,Move B,Move B,MudaParede,Move B,Move D,Desenha,Move B,Move B,Move B,Roda,Move B,Move B,Move B,Move B,Move C,Move C,Move E,Move B,Desenha,Move E,Move E,Move E,Move E,MudaParede,Move E,Move E,Move E,Desenha,Move E,Move E,Move E,Move E,Roda,Move E,Move C,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move E,Move E,MudaParede,Move E,Move E,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Roda,Move E,Desenha,MudaParede,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move D,Move D,Desenha,MudaTetromino,Move C,Move C,Move C,Move C]
t10 = []



-- * Funções principais da Tarefa 1.

-- | Aplica uma 'Instrucao' num 'Editor'.
--
--    * 'Move' - move numa dada 'Direcao'.
--
--    * 'MudaTetromino' - seleciona a 'Peca' seguinte (usar a ordem léxica na estrutura de dados),
--       sem alterar os outros parâmetros.
--
--    * 'MudaParede' - muda o tipo de 'Parede'.
--
--    * 'Desenha' - altera o 'Mapa' para incluir o 'Tetromino' atual, sem alterar os outros parâmetros.
instrucao :: Instrucao -- ^ A 'Instrucao' a aplicar.
          -> Editor    -- ^ O 'Editor' anterior.
          -> Editor    -- ^ O 'Editor' resultante após aplicar a 'Instrucao'.
instrucao (Move C) (Editor (l,c) dir tet par mapa) = (Editor (l-1,c) dir tet par mapa)
instrucao (Move B) (Editor (l,c) dir tet par mapa) = (Editor (l+1,c) dir tet par mapa)
instrucao (Move D) (Editor (l,c) dir tet par mapa) = (Editor (l,c+1) dir tet par mapa)
instrucao (Move E) (Editor (l,c) dir tet par mapa) = (Editor (l,c-1) dir tet par mapa)

instrucao Roda (Editor pos d tet par mapa) = (Editor pos (roda d) tet par mapa)

instrucao MudaTetromino (Editor pos dir t par mapa) = (Editor pos dir (mudaTetromino t) par mapa)

instrucao MudaParede (Editor pos dir tet Destrutivel mapa) = (Editor pos dir tet Indestrutivel mapa)
instrucao MudaParede (Editor pos dir tet Indestrutivel mapa) = (Editor pos dir tet Destrutivel mapa)

instrucao Desenha (Editor pos C tet par map) = (Editor pos C tet par (aux_desenha (pos) (dimensaoMatriz(tetrominoParaMatriz tet)) pos (tetrominoParaMatriz tet) par map))
instrucao Desenha (Editor pos D tet par map) = (Editor pos D tet par (aux_desenha (pos) (dimensaoMatriz(tetrominoParaMatriz tet)) pos (rodaMatriz(tetrominoParaMatriz tet)) par map))
instrucao Desenha (Editor pos B tet par map) = (Editor pos B tet par (aux_desenha (pos) (dimensaoMatriz(tetrominoParaMatriz tet)) pos (rodaMatriz(rodaMatriz(tetrominoParaMatriz tet))) par map))
instrucao Desenha (Editor pos E tet par map) = (Editor pos E tet par (aux_desenha (pos) (dimensaoMatriz(tetrominoParaMatriz tet)) pos (rodaMatriz(rodaMatriz(rodaMatriz(tetrominoParaMatriz tet)))) par map))

-- | Dado um tetromino, muda para o seguinte
mudaTetromino :: Tetromino -> Tetromino
mudaTetromino t | t == I = J 
                | t == J = L
                | t == L = O
                | t == O = S
                | t == S = T
                | t == T = Z
                | t == Z = I

-- | Dada uma direção, muda para a seguinte
roda :: Direcao -> Direcao
roda d | d == C = D
              | d == D = B
              | d == B = E
              | d == E = C     
  
{- | Função aux_desenha

Vai verificando a matriz do tetromino, se for verdadeiro na posição a desenhar, coloca lá a parede, caso não seja passa para o elemento seguinte do mapa e do tetromino. 

Quando chega ao fim de uma linha da matriz do tetromino, a nossa posição no mapa vai avançar uma linha e retornar à coluna inicial
-}
aux_desenha :: Posicao -- ^ Posição onde se vai desenhar (vai-se alterando)
            -> Dimensao -- ^ Dimensão do tetromino a desenhar
            -> Posicao --  ^ Posição onde se vai desenhar (permanece igual , serve de referência para onde retornar na seguinte linha)
            -> Matriz Bool -- ^ Matriz do tetromino
            -> Parede -- ^ Tipo de parede a desenhar
            -> Mapa -- ^ Mapa em que se vai desenhar
            -> Mapa-- ^ Mapa resultante
aux_desenha (l,c) (dim_l,dim_c) (li,ci) ((h1_tet:h2_tet):t_tet) par map
           | l <= (dim_l+li-1) && c < (dim_c+ci-1) = if h1_tet
            then aux_desenha (l,c+1) (dim_l,dim_c) (li,ci) (h2_tet:t_tet) par (atualizaPosicaoMatriz (l,c) (Bloco par) map) 
            else aux_desenha (l,c+1) (dim_l,dim_c) (li,ci) (h2_tet:t_tet) par map
           | l < (dim_l+li-1) && c == (dim_c+ci-1) = if h1_tet
            then aux_desenha (l+1,ci) (dim_l,dim_c) (li,ci) (t_tet) par (atualizaPosicaoMatriz (l,c)(Bloco par) map) 
            else aux_desenha (l+1,ci) (dim_l,dim_c) (li,ci) (t_tet) par map
           | l == (dim_l+li-1) && c == (dim_c+ci-1) = if h1_tet
            then atualizaPosicaoMatriz (l,c) (Bloco par) map
            else map  


-- | Aplica uma sequência de 'Instrucoes' num 'Editor'.
--          
-- __NB:__ Deve chamar a função 'instrucao'.
instrucoes :: Instrucoes -- ^ As 'Instrucoes' a aplicar.
           -> Editor     -- ^ O 'Editor' anterior.
           -> Editor     -- ^ O 'Editor' resultante após aplicar as 'Instrucoes'.
instrucoes [] (Editor pos dir tet par mapa) = Editor pos dir tet par mapa
instrucoes (h:t) (Editor pos dir tet par mapa)  = instrucoes t (instrucao h (Editor pos dir tet par mapa))

-- | Cria um 'Mapa' inicial com 'Parede's nas bordas e o resto vazio.
mapaInicial :: Dimensao -- ^ A 'Dimensao' do 'Mapa' a criar.
            -> Mapa     -- ^ O 'Mapa' resultante com a 'Dimensao' dada.
mapaInicial (l,c) =   aux (criaMatriz (l,c) (Bloco Indestrutivel)) (l,c) (1,1)
                    where
                     aux m (l,c) (x,y) 
                      | (x<l-1 && y<c-1) = aux (atualizaPosicaoMatriz (x,y) (Vazia) m) (l,c) (x,y+1)
                      | (x<l-1 && y==c-1) = aux m (l,c) (x+1,1)
                      | (x==l-1 && y<c-1) = m


-- | Cria um 'Editor' inicial.
--
-- __NB:__ Deve chamar as funções 'mapaInicial', 'dimensaoInicial', e 'posicaoInicial'.
editorInicial :: Instrucoes  -- ^ Uma sequência de 'Instrucoes' de forma a poder calcular a  'dimensaoInicial' e a 'posicaoInicial'.
              -> Editor      -- ^ O 'Editor' inicial, usando a 'Peca' 'I' 'Indestrutivel' voltada para 'C'.
editorInicial l = (Editor (posicaoInicial l) C I Indestrutivel (mapaInicial (dimensaoInicial l)))

-- | Constrói um 'Mapa' dada uma sequência de 'Instrucoes'.
--
-- __NB:__ Deve chamar as funções 'Instrucoes' e 'editorInicial'.
constroi :: Instrucoes -- ^ Uma sequência de 'Instrucoes' dadas a um 'Editor' para construir um 'Mapa'.
         -> Mapa       -- ^ O 'Mapa' resultante.
constroi is  = mapaEditor (instrucoes is (editorInicial is))
