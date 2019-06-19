-- | Este módulo define funções comuns da Tarefa 4 do trabalho prático.
{-# OPTIONS_HADDOCK prune #-}
module Tarefa4_2018li1g088 where

import LI11819
import Tarefa0_2018li1g088
import Tarefa1_2018li1g088

-- * Testes
-- | Testes unitários da Tarefa 4.
--
-- Cada teste é um 'Estado'.
testesT4 :: [Estado]
testesT4 = [t4_1,t4_2,t4_3, t4_4, t4_5,t4_6,t4_7, t4_7, t4_8,t4_9,t4_10,t4_11,t4_12,t4_13,t4_14,t4_15,t4_16,t4_17,t4_18,t4_19,t4_20]
m4_1 =(atualizaPosicaoMatriz (1,2) (Bloco Destrutivel) (atualizaPosicaoMatriz (1,1) (Bloco Destrutivel) (mapaInicial (10,10))))
m4_2 = constroi [Move D,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move E,Move E,Move E,Roda,Roda,Roda,Roda,Desenha,MudaParede,Move C,Move C,Move C,Move C,Move C,Move B,MudaParede,MudaParede,Desenha]
m4_3 = constroi [Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Move B,Move D,Move D,Move D,Roda,Move C,Move C,Move B,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move B,Roda,Move D,Move D,Move D,Move D,Move C,Move C,Desenha,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Roda,Move B,Move D,Move D,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Roda,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Desenha,Move C,Move C,Move C,Move C,Move C,Move D,Move D,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaParede,Move E,Move E,Move E,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Desenha,Move B,Move B,Move D,Move D,Move D,Move B,Move D,Move B,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Desenha,Move B,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Move D,Desenha,Move C,Move C,Move C,Move C,Move E,Move E,Move C,Roda,Move C,Move C,Move E,MudaTetromino,Move E,Move B,Move E,Move B,MudaTetromino,Move C,Move C,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,Move B,Move D,MudaParede,Move C,Desenha,Move B,Move B,Move B,Move B,Move E,Move E,Move C,Move C,Desenha,Move C,Move C,Move C,Move C,Desenha,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,Desenha,Move E,Move B,Move B,Move E,Move B,Move E,MudaParede,Move E,Move E,Move E,Move C,Move B,Move D,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move C,Move C,Move C,Desenha,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move D,Move B,Move B,Desenha,Move D,Move B,Move B,Move B,Move D,Move D,Move C,Move C,Move C,Move E,Move E,Move E]
m4_4 =(atualizaPosicaoMatriz (2,2) (Bloco Destrutivel) (atualizaPosicaoMatriz (2,1) (Bloco Destrutivel) (mapaInicial (10,10))))

t4_1 =(Estado m4_1 [(Jogador (3,3) D 9 1 1), (Jogador (5,5) E 2 2 2)] [(DisparoCanhao 0 (7,7) E),(DisparoCanhao 0 (3,4) E),(DisparoCanhao 0 (1,2) C) ,(DisparoCanhao 0 (6,6) E), (DisparoCanhao 1 (7,7) D),(DisparoLaser 0  (2,2) D)])
t4_2 = (Estado m4_2 [(Jogador (3,3) D 9 2 1)] [DisparoCanhao 0 (5,5) B, DisparoChoque 0 3, DisparoCanhao 0 (5,4) B ,DisparoLaser 0 (1,4) E]) 
t4_3 = (Estado m4_2 [(Jogador (3,3) D 9 2 1)] [DisparoCanhao 0 (5,5) B, DisparoChoque 0 3, DisparoCanhao 0 (5,4) B ,DisparoLaser 0 (1,4) E, DisparoLaser 0 (3,5) B]) 
t4_4 =Estado m4_2 [(Jogador (7,7) B 1 2 3)] [(DisparoCanhao 0 (3,3) D), (DisparoLaser 0 (5,5) B), (DisparoChoque 0 4), (DisparoCanhao 0 (5,5) E) , (DisparoLaser 0 (3,3) C)]
t4_5 = Estado (mapaInicial(10,10)) [Jogador (6,6) C 1 2 3] [DisparoCanhao 0 (3,3) B, DisparoCanhao 0 (4,4) E]
t4_6 = Estado m4_2 [Jogador (1,7) D 2 3 4] [DisparoCanhao 0 (7,2) D, DisparoLaser 0 (7,3) E]
t4_7 = Estado m4_2 [Jogador (1,7) D 2 3 4] [DisparoCanhao 0 (5,2) D, DisparoLaser 0 (7,3) E]
t4_8 = Estado m4_1 [Jogador (4,4) B 6 6 6] [DisparoLaser 0 (1,3) E]
t4_9 = Estado m4_2 [Jogador (8,5) E 2 3 4] [DisparoCanhao 0 (8,3) E]
t4_10 = Estado (mapaInicial (10,10)) [Jogador (1,1) C 1 1 1, Jogador (1,4) C 2 2 2] [DisparoCanhao 0 (0,1) C, DisparoLaser 0 (0,4) C]
t4_11 = Estado (mapaInicial (8,8)) [Jogador (1,1) C 1 1 1] [DisparoCanhao 0 (3,2) E,DisparoCanhao 0 (3,3) D]
t4_12 = Estado m4_2 [Jogador (6,6) B 1 2 3] [DisparoCanhao 0 (6,2) D, DisparoCanhao 0 (6,3) E]
t4_13 = Estado (mapaInicial (10,10)) [Jogador (1,1) B 1 1 1 ] [DisparoCanhao 0 (3,3) C, DisparoCanhao 0 (4,4) D, DisparoCanhao 0 (5,5) B, DisparoCanhao 0 (6,6) E] 
t4_14 = Estado m4_2 [Jogador (6,6) B 0 2 3] [DisparoCanhao 0 (6,5) D]
t4_15 = Estado m4_2 [Jogador (6,6) B 0 2 3] [DisparoChoque 0 0, DisparoLaser 0 (3,3) D]
t4_16 = Estado (mapaInicial (9,9)) [Jogador (3,3) E 3 2 1] [DisparoCanhao 0 (5,5) E, DisparoCanhao 0 (6,5) C ]
t4_17 = Estado {mapaEstado = [[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Vazia,Bloco Indestrutivel],[Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel,Bloco Indestrutivel]], jogadoresEstado = [Jogador {posicaoJogador = (1,1), direcaoJogador = D, vidasJogador = 5, lasersJogador = 0, choquesJogador = 1},Jogador {posicaoJogador = (2,64), direcaoJogador = E, vidasJogador = 5, lasersJogador = 0, choquesJogador = 0}], disparosEstado = [DisparoChoque {jogadorDisparo = 0, tempoDisparo = 2},DisparoChoque {jogadorDisparo = 1, tempoDisparo = 4},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,2), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,3), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,4), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,5), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,6), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,7), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,8), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,9), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,10), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,11), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,12), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,13), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,14), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,15), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,16), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,17), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,18), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,19), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,20), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,21), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,22), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,23), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,24), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,25), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,26), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,27), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,28), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,29), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,30), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,31), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,32), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,33), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,34), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,35), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,36), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,37), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,38), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,39), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,40), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,41), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,42), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,43), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,44), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,45), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,46), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,47), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,48), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,49), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,50), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,51), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,52), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,53), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,54), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,55), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,56), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,57), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,58), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,59), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,60), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,61), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,62), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 0, posicaoDisparo = (1,63), direcaoDisparo = D},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,2), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,3), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,4), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,5), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,6), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,7), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,8), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,9), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,10), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,11), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,12), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,13), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,14), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,15), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,16), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,17), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,18), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,19), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,20), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,21), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,22), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,23), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,24), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,25), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,26), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,27), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,28), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,29), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,30), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,31), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,32), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,33), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,34), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,35), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,36), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,37), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,38), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,39), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,40), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,41), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,42), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,43), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,44), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,45), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,46), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,47), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,48), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,49), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,50), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,51), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,52), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,53), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,54), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,55), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,56), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,57), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,58), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,59), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,60), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,61), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,62), direcaoDisparo = E},DisparoCanhao {jogadorDisparo = 1, posicaoDisparo = (2,63), direcaoDisparo = E}]}
t4_18 = Estado m4_3 [Jogador (1,1) C 4 5 5] [DisparoCanhao 0 (14,2) B]
t4_19 = Estado (mapaInicial (10,10)) [Jogador (1,1) C 5 5 5, Jogador (4,4) B 0 6 6] [DisparoLaser 0 (4,1) D]
t4_20 = Estado  m4_4 [Jogador (6,6) C 5 5 5, Jogador (4,4) B 0 6 6] [DisparoLaser 0 (1,3) E]
-- * Funções principais da Tarefa 4.

-- | Avança o 'Estado' do jogo um 'Tick' de tempo.
--
-- __NB:__ Apenas os 'Disparo's afetam o 'Estado' do jogo com o passar do tempo.
--
-- __NB:__ Deve chamar as funções 'tickChoques', 'tickCanhoes' e 'tickLasers' pela ordem definida.
tick :: Estado -- ^ O 'Estado' anterior.
     -> Estado -- ^ O 'Estado' após um 'Tick'.

tick = tickChoques . tickCanhoes . tickLasers
-- ** Funções de processamento dos Lasers
-- | Avança o 'Estado' do jogo um 'Tick' de tempo, considerando apenas os efeitos dos tiros de 'Laser' disparados.
-- 
-- __NB:__ Chama várias funções: 
--
--        * 'livreLasers' - Verifica se já não existem mais 'DisparoLaser', o que indica que o processamento dos Lasers terminou
--
--        * 'removePecaMapaLaser' - Elimina os 'Bloco Destrutivel' atingidos por 'DisparoLaser's
--
--        * 'removeVidaJogadoresLaser' - Reduz a vida dos 'Jogador'es atingidos por 'DisparoLaser'  
--
--        * 'avancaLasers' - Avança os lasers para a próxima posição que devem ocupar
--
--        * 'removeDisparoLaserDisparos' - Remove os 'DisparoCanhao' atingidos por 'DisparoLaser's
--
--        * 'filtraLaserAcabados' - Remove os lasers que já atingiram um 'Bloco Indestruivel'

tickLasers :: Estado -> Estado
tickLasers (Estado mapa lJogadores lDisparos) | livreLasers lDisparos = (Estado mapa lJogadores lDisparos)
                                              | otherwise = tickLasers (Estado (removePecaMapaLaser mapa lDisparos) ((map (removeVidaJogadoresLaser lDisparos)) lJogadores) (avancaLasers (removeDisparoLaserDisparos (filtraLaserAcabados lDisparos mapa))))
-- *** Funções de verificação do processamento
-- | Verifica se na lista de disparos já não existe nenhum disparoLaser, indicando que o processamento dos lasers acabou  
livreLasers :: [Disparo] -> Bool
livreLasers [] = True
livreLasers ((DisparoLaser j (l,c) d):t) = False
livreLasers (_:t) = livreLasers t

--- *** Funções de alteração do mapa
-- |Dado um mapa, retira todas os blocos destrutíveis atingidos por lasers num determinado tick
removePecaMapaLaser :: Mapa -> [Disparo] -> Mapa
removePecaMapaLaser m [] = m
removePecaMapaLaser m ((DisparoLaser jogador (l,c) direcao):t) | encontraPosicaoMatriz (l1,c1) m == Bloco Destrutivel  &&  encontraPosicaoMatriz (l2,c2) m == Bloco Destrutivel = removePecaMapaLaser (atualizaPosicaoMatriz (l1,c1) Vazia ( atualizaPosicaoMatriz (l2,c2) Vazia m)) t
                                                               | encontraPosicaoMatriz (l1,c1) m == Bloco Destrutivel = removePecaMapaLaser (atualizaPosicaoMatriz (l1,c1) Vazia m) t
                                                               | encontraPosicaoMatriz (l2,c2) m == Bloco Destrutivel = removePecaMapaLaser (atualizaPosicaoMatriz (l2,c2) Vazia m) t
                                                               | otherwise = removePecaMapaLaser m t
                                                             where ((l1,c1),(l2,c2)) = posicoesAVerificarMapa (l,c) direcao
removePecaMapaLaser m (_:t) = removePecaMapaLaser m t 

-- *** Funções de processamento da lista de disparos
-- | Retira da lista todos os lasers que já atingiram uma parede indestrutível 
filtraLaserAcabados :: [Disparo] -> Mapa -> [Disparo]
filtraLaserAcabados [] m = []
filtraLaserAcabados ((DisparoLaser j (l,c) d):t) m | (verificaCaminhoLaser (DisparoLaser j (l,c) d) m) =  (DisparoLaser j (l,c) d) : filtraLaserAcabados t m
                                                   | otherwise = filtraLaserAcabados t m 
filtraLaserAcabados (h:t) m = h: filtraLaserAcabados t m 


-- | Dada uma lista de Lasers, avança-os para a posição que é suposto tomarem de seguida
avancaLasers :: [Disparo] -> [Disparo]
avancaLasers [] = []
avancaLasers ((DisparoLaser jogador (l,c) C):t) = (DisparoLaser jogador (l-1,c) C) : (avancaLasers t)
avancaLasers ((DisparoLaser jogador (l,c) D):t) = (DisparoLaser jogador (l,c+1) D) : (avancaLasers t)
avancaLasers ((DisparoLaser jogador (l,c) B):t) = (DisparoLaser jogador (l+1,c) B) : (avancaLasers t)
avancaLasers ((DisparoLaser jogador (l,c) E):t) = (DisparoLaser jogador (l,c-1) E) : (avancaLasers t)
avancaLasers (h:t) = (h) : avancaLasers t

-- | Verifica se um certo laser tem à sua frente uma parede indestrutível, ou se pode continuar a seguir o sue caminho 
verificaCaminhoLaser :: Disparo -> Mapa -> Bool
verificaCaminhoLaser (DisparoLaser j (l,c) d) m  | encontraPosicaoMatriz (l1,c1) m  == Bloco Indestrutivel || encontraPosicaoMatriz(l2,c2) m == Bloco Indestrutivel = False
                                                 | otherwise = True
                                              where ((l1,c1),(l2,c2)) = posicoesAVerificarMapa (l,c) d



-- | Dada uma lista de disparos, retira todos os 'DisparoCanhao' que estão a ser atingidos por 'DisparoLaser'
removeDisparoLaserDisparos :: [Disparo] -> [Disparo]
removeDisparoLaserDisparos [] = []
removeDisparoLaserDisparos l = filter (filtroLaser l) l

-- | Função auxiliar da 'removeDisparoLaserDisparos', que verifica, para um determinado 'DisparoCanhao', se este é atingido por algum 'DisparoLaser'
filtroLaser :: [Disparo] -> Disparo -> Bool
filtroLaser [] _ = True
filtroLaser ((DisparoLaser jogador (l,c) direcao):t) (DisparoCanhao j (l1,c1) d) = if ((l,c) == (l1,c1)) then False else filtroLaser t (DisparoCanhao j (l1,c1) d) 
filtroLaser ((DisparoLaser jogador (l,c) direcao):t) _ = True
filtroLaser (h:t) x = filtroLaser t x

-- *** Funções de alteração de jogadores
-- | Dada uma lista de disparos, sempre que encontra um laser, se as coordenadas que esse laser afeta atingirem o jogador, reduz-lhe o número de vidas
removeVidaJogadoresLaser :: [Disparo] -> Jogador -> Jogador
removeVidaJogadoresLaser [] (Jogador (l,c) d v las cho) = (Jogador (l,c) d v las cho)
removeVidaJogadoresLaser ((DisparoLaser n (l,c) dir):t) (Jogador (lj,cj) d v las cho)
                     | (lj,cj) == (l1,c1) 
                        || (lj,cj) == (l2,c2) 
                        || (lj,cj) == (l3,c3) 
                        = if v > 0 then removeVidaJogadoresLaser t (Jogador (lj,cj) d (v-1) las cho) 
                                   else removeVidaJogadoresLaser t (Jogador (lj,cj) d v las cho)
                     where ((l1,c1),(l2,c2),(l3,c3)) = posicoesAVerificarJogadores (l,c) dir
removeVidaJogadoresLaser (_:t) (Jogador (l,c) d v las cho) = removeVidaJogadoresLaser t (Jogador (l,c) d v las cho)


-- ** Funções de processamento de Canhoes
-- | Avança o 'Estado' do jogo um 'Tick' de tempo, considerando apenas os efeitos das balas de 'Canhao' disparadas. 
-- 
-- __NB:__ Chama várias funções: 
--
--          * 'processaColisaoDisparoDisparo' - retira os disparos de canhão que colidem uns com os outros
--
--          * 'removeDisparoCanhaoMapa' - retira os disparos de canhão que colidem com paredes
--
--          * 'removeDisparoCanhaoJogador' - retira os disparos de canhão que dolidem com jogadores
--
--          * 'avancaCanhao' - avança os disparos de canhão que sobram
--         
--          * 'removePecaMapaCanhao' - remove os blocos Destrutiveis atingidos por disparos de canhao
--        
--          * 'processaColisaoDisparoJogadores' - reduz a vida dos jogadores atingidos 
tickCanhoes :: Estado -> Estado
tickCanhoes (Estado mapa lJogadores lDisparos) = let l1 = processaColisaoDisparoDisparo lDisparos
                                                     l2 = removeDisparoCanhaoMapa mapa l1
                                                     l3 = removeDisparoCanhaoJogador l2 lJogadores
                                                     l4 = avancaCanhao l3
                                                 in (Estado (removePecaMapaCanhao mapa lDisparos)  (processaColisaoDisparoJogadores lDisparos lJogadores)  l4)

-- tickCanhoes (Estado mT [(Jogador (3,3) D 9 1 1)] [(DisparoCanhao 0 (7,7) E),(DisparoCanhao 1 (3,4) E),(DisparoCanhao 0 (1,2) C) ,(DisparoCanhao 0 (8,8) E), (DisparoCanhao 2 (7,7) D)])


-- *** Funções de alteração de jogadores
-- | Dada uma lista de disparos e uma lista de jogadores, retorna uma lista de jogadores com as vidas atualizadas depois de serem atingidas por disparos
processaColisaoDisparoJogadores:: [Disparo] -> [Jogador] -> [Jogador]
processaColisaoDisparoJogadores [] lJogadores = lJogadores
processaColisaoDisparoJogadores ((DisparoCanhao n (l,c) dir):t) lJogadores = let novalJogadores = removeVidaJogadoresCanhao (DisparoCanhao n (l,c) dir) lJogadores
                                                                              in processaColisaoDisparoJogadores t novalJogadores     
processaColisaoDisparoJogadores (_:t) lJogadores = processaColisaoDisparoJogadores t lJogadores

-- | Função auxiliar à 'processaColisaoDisparoJogadores' que, dado um disparo e uma lista de jogadores, retorna uma lista de jogadores depois de afetada por esse disparo
removeVidaJogadoresCanhao :: Disparo -> [Jogador] -> [Jogador]
removeVidaJogadoresCanhao x [] = []
removeVidaJogadoresCanhao (DisparoCanhao n (l,c) dir) ((Jogador (lj,cj) d v las cho):t)
                     | (lj,cj) == (l1,c1) 
                        || (lj,cj) == (l2,c2) 
                        || (lj,cj) == (l3,c3) 
                        = if v > 0 then (Jogador (lj,cj) d (v-1) las cho) : (removeVidaJogadoresCanhao (DisparoCanhao n (l,c) dir) t ) 
                                             else (Jogador (lj,cj) d v las cho) : (removeVidaJogadoresCanhao (DisparoCanhao n (l,c) dir) t)
                     | otherwise = (Jogador (lj,cj) d v las cho) : (removeVidaJogadoresCanhao (DisparoCanhao n (l,c) dir) t)
                     where ((l1,c1),(l2,c2),(l3,c3)) = posicoesAVerificarJogadores (l,c) dir

-- | Retorna as três posições a verificar quando se quer ver se um jogador é atingido pelo disparo
posicoesAVerificarJogadores :: PosicaoGrelha -- ^ Posição do   Disparo
                            -> Direcao -- ^ Direção do disparo
                            -> (PosicaoGrelha,PosicaoGrelha,PosicaoGrelha) -- ^ Posições que o disparo vai afetar
posicoesAVerificarJogadores (l,c) C = ((l-1,c-1),(l-1,c),(l-1,c+1))
posicoesAVerificarJogadores (l,c) D = ((l-1,c+1),(l,c+1),(l+1,c+1))
posicoesAVerificarJogadores (l,c) B = ((l+1,c-1),(l+1,c),(l+1,c+1))
posicoesAVerificarJogadores (l,c) E = ((l-1,c-1),(l,c-1),(l+1,c-1))

-- *** Funções de alteração do mapa

-- | Dado um mapa e uma lista de disparos, devolve o mapa depois de seremr retirados os blocos Destrutiveis atingidos
removePecaMapaCanhao :: Mapa -> [Disparo] -> Mapa
removePecaMapaCanhao m [] = m
removePecaMapaCanhao m ((DisparoCanhao jogador (l,c) direcao):t) | encontraPosicaoMatriz (l1,c1) m == Bloco Destrutivel  &&  encontraPosicaoMatriz (l2,c2) m == Bloco Destrutivel = removePecaMapaCanhao (atualizaPosicaoMatriz (l1,c1) Vazia ( atualizaPosicaoMatriz (l2,c2) Vazia m)) t
                                                                 | encontraPosicaoMatriz (l1,c1) m == Bloco Destrutivel = removePecaMapaCanhao (atualizaPosicaoMatriz (l1,c1) Vazia m) t
                                                                 | encontraPosicaoMatriz (l2,c2) m == Bloco Destrutivel = removePecaMapaCanhao( atualizaPosicaoMatriz (l2,c2) Vazia m) t
                                                                 | otherwise = removePecaMapaCanhao m t
                                                             where ((l1,c1),(l2,c2)) = posicoesAVerificarMapa (l,c) direcao
removePecaMapaCanhao m (_:t) = removePecaMapaCanhao m t 

-- | Devolve que posições do mapa de deve verificar ao ver se há bloco destrutiveis
posicoesAVerificarMapa :: PosicaoGrelha -- ^ Posição do Disparo
                       -> Direcao -- ^ Direção do disparo
                       -> (Posicao,Posicao) -- ^ Posições do mapa afetadas pelo disparo
posicoesAVerificarMapa (l,c) C = ((l,c), (l,c+1))
posicoesAVerificarMapa (l,c) D = ((l,c+1), (l+1,c+1))
posicoesAVerificarMapa (l,c) B = ((l+1,c), (l+1,c+1))
posicoesAVerificarMapa (l,c) E = ((l,c), (l+1,c)) 


-- *** Funções de processamento da lista de disparos
-- | Dada uma lista de disparos e um mapa, devolve 
removeDisparoCanhaoMapa :: Mapa -> [Disparo] -> [Disparo]
removeDisparoCanhaoMapa m [] = []
removeDisparoCanhaoMapa m ((DisparoCanhao j (l,c) dir):t) | encontraPosicaoMatriz (l1,c1) m == Bloco Destrutivel
                                                            || encontraPosicaoMatriz (l1,c1) m == Bloco Indestrutivel
                                                            || encontraPosicaoMatriz (l2,c2) m == Bloco Destrutivel
                                                            || encontraPosicaoMatriz (l2,c2) m == Bloco Indestrutivel = removeDisparoCanhaoMapa m t
                                                           | otherwise = (DisparoCanhao j (l,c) dir): removeDisparoCanhaoMapa m t
                                                        where ((l1,c1),(l2,c2)) = posicoesAVerificarMapa (l,c) dir
removeDisparoCanhaoMapa m (x:t) = x : removeDisparoCanhaoMapa m t

-- | Remove disparos de Canhao quando colidem com outros disparos de canhão
processaColisaoDisparoDisparo :: [Disparo] -> [Disparo]
processaColisaoDisparoDisparo [] = []
processaColisaoDisparoDisparo [x] = [x]
processaColisaoDisparoDisparo ((DisparoCanhao j (l,c) d):t) | i >=  2 = processaColisaoDisparoDisparo novalDisparos
                                                            | otherwise = (DisparoCanhao j (l,c) d) : processaColisaoDisparoDisparo novalDisparos
                                                            where (novalDisparos, i) = removeDisparoCanhaoDisparo (DisparoCanhao j (l,c) d) ((DisparoCanhao j (l,c) d):t)
processaColisaoDisparoDisparo (h:t) = h : processaColisaoDisparoDisparo t                                                             
-- | Função auxiliar à 'processaColisaoDisparoDisparo', verifica se um disparo Canhao atinge algum disparo canhao na lista, sem ser ele prório e elimina-o, se for o caso.
removeDisparoCanhaoDisparo :: Disparo -> [Disparo]-> ([Disparo],Int)
removeDisparoCanhaoDisparo x [] = ([],0)
removeDisparoCanhaoDisparo (DisparoCanhao j (l,c) d) lDisparos = aux (DisparoCanhao j (l,c) d) lDisparos [] 0
                                 where 
                                  aux _ [] lD i = (lD, i)
                                  aux (DisparoCanhao jogador (l,c) direcao) ((DisparoCanhao jogador1 (l1,c1) direcao1):t) lD i 
                                   | ((l,c) == (l1,c1)) || ((l1,c1) == (l2,c2) && direcao /= direcao1) = aux (DisparoCanhao jogador (l,c) direcao) t lD (i+1)
                                   | otherwise = aux (DisparoCanhao jogador (l,c) direcao) t (lD ++ [(DisparoCanhao jogador1 (l1,c1) direcao1)]) i
                                  aux (DisparoCanhao jogador (l,c) direcao) (x:t) lD i = aux (DisparoCanhao jogador (l,c) direcao) t (lD ++ [x]) i
                                  aux _ l _  _ = (l,0)
                                  (l2,c2) = posicaoAtras (l,c) d
-- | Indica qual a coordenada das "costas" de um disparo
posicaoAtras :: PosicaoGrelha -> Direcao -> PosicaoGrelha
posicaoAtras (l,c) C = (l+1,c)
posicaoAtras (l,c) D = (l,c-1)
posicaoAtras (l,c) B = (l-1,c)
posicaoAtras (l,c) E = (l,c+1)

-- | Avança os disparos de canhão para as posições que devem tomar
avancaCanhao :: [Disparo] -> [Disparo]
avancaCanhao [] = []
avancaCanhao ((DisparoCanhao jogador (l,c) C):t) = (DisparoCanhao jogador (l-1,c) C) : (avancaCanhao t)
avancaCanhao ((DisparoCanhao jogador (l,c) D):t) = (DisparoCanhao jogador (l,c+1) D) : (avancaCanhao t)
avancaCanhao ((DisparoCanhao jogador (l,c) B):t) = (DisparoCanhao jogador (l+1,c) B) : (avancaCanhao t)
avancaCanhao ((DisparoCanhao jogador (l,c) E):t) = (DisparoCanhao jogador (l,c-1) E) : (avancaCanhao t)
avancaCanhao ((DisparoChoque jogador ticks):t) = (DisparoChoque jogador ticks) : (avancaCanhao t)

-- | Verifica se algum elemento de uma lista de disparos que seja canhão colide com algum jogador e, se for o caso, retira ele disparo da lista
removeDisparoCanhaoJogador :: [Disparo] -> [Jogador] -> [Disparo] 
removeDisparoCanhaoJogador lDisparos lJogadores = filter (verificaColisaoDisparoJogador lJogadores) lDisparos

-- | Função auxiliar à 'removeDisparoCanhaoJogador', verifica se numa lista de jogadores, algum é atingido por um canhão
verificaColisaoDisparoJogador :: [Jogador] -> Disparo  -> Bool 
verificaColisaoDisparoJogador [] _ = True
verificaColisaoDisparoJogador ((Jogador (lj,cj) d v las cho):t) (DisparoCanhao j (l,c) dir)  | ((l1,c1) == (lj,cj) || (l2,c2) == (lj,cj) || (l3,c3) == (lj,cj)) && v>0 = False
                                                                                             | otherwise = verificaColisaoDisparoJogador t (DisparoCanhao j (l,c) dir) 
                                                                                             where ((l1,c1),(l2,c2),(l3,c3)) = posicoesAVerificarJogadores (l,c) dir                                                                           
verificaColisaoDisparoJogador ((Jogador (lj,cj) d v las cho):t) _ = True


-- ** Funções de processamento de Choques
-- | Avança o 'Estado' do jogo um 'Tick' de tempo, considerando apenas os efeitos dos campos de 'Choque' disparados.
tickChoques :: Estado -> Estado
tickChoques (Estado mapa lJogadores lDisparos) = Estado mapa lJogadores (filter retiraChoques (map reduzTickChoques lDisparos))
                                            where reduzTickChoques (DisparoChoque jogador 0) = DisparoChoque jogador 0
                                                  reduzTickChoques (DisparoChoque jogador ticks) = DisparoChoque jogador (ticks-1)
                                                  reduzTickChoques (DisparoCanhao jogador (l,c) direcao) = (DisparoCanhao jogador (l,c) direcao)
                                                  retiraChoques (DisparoChoque jogador 0) = False
                                                  retiraChoques _ = True

-- (Estado (mapaInicial (10,10)) [(Jogador (1,1) D 1 1 1), (Jogador (6,6) C 1 1 1)] [(DisparoChoque 1 5),(DisparoCanhao 0 (3,3) D), (DisparoChoque 0 2)]) 


