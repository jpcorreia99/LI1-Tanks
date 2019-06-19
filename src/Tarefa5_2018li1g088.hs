-- | Este módulo define funções comuns da Tarefa 5 do trabalho prático.
--
--  __IMPORTANTE:__ Para que a documentaçâo seja gerada corretamente deve ser usado o comando __haddock -h -o doc/html Tarefa5_2018li1g088__
module Main where

import LI11819
import Tarefa0_2018li1g088
import Tarefa1_2018li1g088
import Tarefa2_2018li1g088
import Tarefa4_2018li1g088
import Tarefa6_2018li1g088
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Bitmap
import Graphics.Gloss.Juicy

-- * Introdução 
-- | Nesta tarefa devemos criar uma interface gráfica para o jogo com o objetivo de ser esteticamente agradável e ao mesmo tempo fornecer uma experiência de jogo fluída.
--
-- Foi utilizado o gloss, uma biblioteca gráfica do haskell que facilita a criação de gráficos 2D.
--
-- Para além do jogo em si, decidimos implementar mais funcionalidades, que serão explicitadas na parte referente aos objetivos, neste relatório.
 
introduçãoT5 :: String
introduçãoT5 = "String que será comentada para que a introdução apareça no relatório" 

-- * Objetivos 
-- | Foi decidido implementar algumas funcionalidades extra no trabalho:  
-- 
-- __1.__ Possibilidade de jogar contra players ou contra bots
--
-- __2.__ Escolha do número de jogadores ou número de bots, em menus separados
--
-- __3.__ Escolha da dificuldade dos bots, caso tenha sido escolhida essa opção
--
-- __4.__ Menu de escolha de diferentes mapas
--
-- __5.__ Display da informação do jogador 
--
-- __6.__ Reabastecimento das munições de laser e de choque a cada 10 segundos (aos primeiros 10 recebe-se uma de laser, nos 10 segundos depois uma de choque e repete-se o ciclo). __Nota:__ Cada jogador só poderá ter até um limite de 5 lasers e choques.
--
-- __7.__ Menu de fim do jogo, onde se indica o vencedor (no caso dse um jogo contra players), ou se venceu os bots e é dada a possibilidade de reiniciar o jogo.

eInicial = (Estado mapa1 lJogadores1 []) 

-- ** Declaraçṍes úteis 

-- | Frame Rate do Jogo
fr :: Int
fr = 3

-- | Largura da janela de jogo
width :: Int
width = 1280

-- | Altura da Janela de Jogo
heigth :: Int
heigth = 720

-- | Especificação da janela de jogo
dm :: Display
dm = InWindow "T A N K S" (width, heigth) (0,0)

-- | Mapa1, um mapa 15x15 com paredes centrais
--
-- <<mapa1.png>>
mapa1 = constroi [Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Move B,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move B,Move B,Move B,Move C,Desenha,Move B,Move B,Move B,Move B,Move B,Desenha,Move C,Roda,Move C,Move D,Move D,Desenha,Move E,Move E,Move E,Move E,Move E,Desenha]
-- | Mapa2, um mapa 20x20 com um conjunto de Blocos Indestrutiveis no centro e blocos Destrutiveis nas partes periféricas do mapa
--
-- <<mapa2.png>>
mapa2 = constroi [Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Move B,Move D,Move D,Move D,Roda,Move C,Move C,Move B,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move B,Roda,Move D,Move D,Move D,Move D,Move C,Move C,Desenha,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Roda,Move B,Move D,Move D,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Roda,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move E,Desenha,Move C,Move C,Move C,Move C,Move C,Move D,Move D,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaParede,Move E,Move E,Move E,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Desenha,Move B,Move B,Move D,Move D,Move D,Move B,Move D,Move B,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Desenha,Move B,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move B,Move B,Move B,Move B,Move B,Move B,Move D,Desenha,Move C,Move C,Move C,Move C,Move E,Move E,Move C,Roda,Move C,Move C,Move E,MudaTetromino,Move E,Move B,Move E,Move B,MudaTetromino,Move C,Move C,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,Move B,Move D,MudaParede,Move C,Desenha,Move B,Move B,Move B,Move B,Move E,Move E,Move C,Move C,Desenha,Move C,Move C,Move C,Move C,Desenha,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,Desenha,Move E,Move B,Move B,Move E,Move B,Move E,MudaParede,Move E,Move E,Move E,Move C,Move B,Move D,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move E,Move C,Move C,Move C,Desenha,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move E,Move E,Move E,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move B,Move D,Move B,Move B,Desenha,Move D,Move B,Move B,Move B,Move D,Move D,Move C,Move C,Move C,Move E,Move E,Move E]
-- | Mapa3, um mapa 25x25 com uma estrutura central em forma de "floco de neve" constituída tanto por Blocos Destrutiveis como Indestrutíveis
--
-- <<mapa3.png>> 
mapa3 = constroi [Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move B,Move D,Move B,Move D,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaParede,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move E,Desenha,Move C,Move C,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Desenha,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Desenha,Move E,Move E,Desenha,Move B,Move B,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move C,Move C,Desenha,Move E,Move E,Desenha,Move C,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move D,Move D,Move D,MudaTetromino,MudaTetromino,MudaParede,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,Move C,Move B,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Desenha,Roda,Roda,Move C,Move C,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move B,Move E,Move E,Move E,MudaTetromino,MudaTetromino,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move B,Move B,Move B,Desenha,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Desenha,Move E,Move B,Move B,Move B,Roda,Move B,Move B,Move E,Move E,Move E,Move E,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,MudaTetromino,MudaTetromino,MudaTetromino,Move D,Move D,Move D,Move D,Move D,Move D,Move B,Desenha,Move C,Move C,Move C,Move C,Move C,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Desenha,Move E,Move E,Move E,Move E,Move E,Desenha,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move B,Move B,Move B,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move D,Desenha,Move C,Move C,Move C,Move C,Move C,Move C,Move D,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaParede,Move E,Move E,Move C,Move C,Move B,Move B,Move B,Move B,Move B,Move E,Move E,Desenha,Roda,Move E,Move E,Move E,Move E,Roda,Move D,Roda,Roda,MudaTetromino,MudaTetromino,Move C,MudaTetromino,MudaTetromino,MudaTetromino,Move D,Move B,Move D,Desenha,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move C,Move D,Move D,Move D,Move D,Move D,Move C,Move C,Desenha,Roda,Move E,Move E,Move E,Move B,Move E,Roda,Roda,Roda,MudaTetromino,MudaTetromino,Move D,Move D,Move C,Move D,Desenha,Move E,Move B,Move E,Move B,Move E,Move B,Move E,Move E,Move B,Move B,Roda,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move B,Move B,Move D,Move B,Move D,Desenha,Move B,Move B,Move E,Move E,Roda,Roda,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Move C,Move C,Move C,Move E,Move E,Roda,Roda,Move E,Move E,Move E,Move E,Move B,Move B,Move B,Desenha,Move D,Move D,Move D,Move D,Move B,Move B,Move B,Move B,Move B,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,MudaTetromino,Move C,Move C,Move D,Move D,Move E,Move B,Move E,Move B,Move D,Move D,Move C,Move C,Desenha,Move D,Move D,Move D,Move D,Move D,Desenha,Move C,Move C,Move C,Move C,Move C,Desenha,Move E,Move E,Move E,Move E,Move E,Desenha,Move E,Move C,Desenha,Move D,Move D,Move D,Move D,Move D,Move D,Move D,Desenha,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move B,Move C,Desenha,Move E,Move E,Move E,Move E,Move E,Move E,Move E,Desenha,Move E,Move E,Move D,Move D,Move E,Move E,Move E,Move B,Move B,MudaTetromino,Move B,MudaTetromino,Move C,Move E,Move C,MudaTetromino,MudaTetromino,Move B,MudaTetromino,MudaTetromino,MudaTetromino,Move D,Move B,MudaParede]
-- | Lista do jogadores com as posições iniciais no Mapa1                                                                     
lJogadores1 = [Jogador (1,1) D 5 3 3, Jogador (1,12) E 5 3 3, Jogador (12,1) D 5 3 3 , Jogador (12,12) E 5 3 3]
-- | Lista do jogadores com as posições iniciais no Mapa2   
lJogadores2 = [Jogador (1,1) D 5 3 3, Jogador (1,17) B 5 3 3, Jogador (17,1) C 5 3 3 , Jogador (17,17) E 5 3 3]
-- | Lista do jogadores com as posições iniciais no Mapa3   
lJogadores3 = [Jogador (1,1) D 5 3 3, Jogador (1,22) E 5 3 3, Jogador (22,1) D 5 3 3 , Jogador (22,22) E 5 3 3] 

-- | Lista dos mapas
lMapas = [mapa1,mapa2,mapa3]
-- | Lista das listas de jogadores
lLJogadores = [lJogadores1,lJogadores2,lJogadores3]

-- | Tipo de dados criado para transportar toda a informação acerca do jogo
data Jogo = Jogo 
   { menuPrincipal    :: Bool -- ^ Booleano que indica se estamos no menu principal
   , tipoJogo         :: Int -- ^ Inteiro que indica se é um jogo pvp ou contra bots (1-PVP 2-PVBots)
   , menuJogadores    :: Bool -- ^ Boleano que indica se estamos no menu de escolha do número de jogadores
   , numeroJogadores  :: Int -- ^ Inteiro que indica o número de jogadores
   , menuDificuldade  :: Bool
   , numeroDificuldade :: Int
   , menuMapas        :: Bool -- ^ Boleano que indica se estamos no menu de escolha d mapa
   , escolhaMapa      :: Int -- ^ Inteiro que indica qual o mapa escolhido      
   , estado           :: Estado -- ^ Estado do jogo
   , imagens          :: [[Picture]] -- ^ Lista de listas de imagens, cada lista contém imagens referentes a uma parte do jogo
   , contador         :: Int -- ^ Inteiro que conta os ticks, para que seja possível reabastecer as munições passsadas x segundos, usando a função 'processaContador'
   , acabou           :: Bool -- ^ Boleano que indica se o jogo acabou
   }
   deriving Show

-- ** Funções  de criação  

-- | Função principal da Tarefa 5.
--
-- __Explicação passo-a-passo da função__
--
--  __1.__ Carregam-se as imagens do utilizando a biblioteca Juicy
--
--  __2.__ Redimensiona-se as imagens para o tamanho adequado (ficou estabelecido que uma peca deveria ser 20x20 pixeis)
--
--  __3.__ Agrupa-se as imagens em listas, sendo que cada lista é relativa a uma parte do jogo diferente (__ex__: há uma lista para oscada tipo de disparos, uma lista com as imagens de cada menu, etc)  
--
--  __4.__ Chama-se a função 'jogoInicial' para criar a primeira estrutura do tipo 'Jogo' com as imagens que lhe fornecemos
--
--  __5.__ A função 'desenhaJogo' fica encarregue de desenhar o jogo, quer se esteja num menu, quer se esteja já no próprio jogo
--
--  __6.__ A função 'reageEvento' tratará dos inputs do jogador (como a movimentação do cursor durante os menus ou as próprias jogadas)
--
--  __7.__ A função 'reageTempo' processará a passagem do tempo no jogo, quer seja o processamento de jogadas, usando a função 'tick', quer seja para verificar se o jogo já acabou, ou ainda para reabastecer as munições

main :: IO ()
main = do 
          Just num0 <- loadJuicy "img/0.png"
          Just num1 <- loadJuicy "img/1.png"
          Just num2 <- loadJuicy "img/2.png"
          Just num3 <- loadJuicy "img/3.png"
          Just num4 <- loadJuicy "img/4.png"
          Just num5 <- loadJuicy "img/5.png"
          Just num6 <- loadJuicy "img/6.png"
          Just num7 <- loadJuicy "img/7.png"
          Just num8 <- loadJuicy "img/8.png"
          Just num9 <- loadJuicy "img/9.png"
          Just menuPrincipal1 <- loadJuicy "img/imagem_menu_inicial1.png"
          Just menuPrincipal2 <- loadJuicy "img/imagem_menu_inicial2.png"
          Just menuPVP1 <- loadJuicy "img/imagem_menu_vsplayer1.png"
          Just menuPVP2 <- loadJuicy "img/imagem_menu_vsplayer2.png"
          Just menuPVP3 <- loadJuicy "img/imagem_menu_vsplayer3.png"
          Just menuPVP4 <- loadJuicy "img/imagem_menu_vsplayervoltar.png"
          Just menuPvsBot1 <- loadJuicy "img/imagem_menu_vsbot1.png"
          Just menuPvsBot2 <- loadJuicy "img/imagem_menu_vsbot2.png"
          Just menuPvsBot3 <- loadJuicy "img/imagem_menu_vsbot3.png"
          Just menuPvsBot4 <- loadJuicy "img/imagem_menu_vsbotvoltar.png"
          Just menuDif1 <- loadJuicy "img/escolhe_dificuldade_bot_facil.png"
          Just menuDif2 <- loadJuicy "img/escolhe_dificuldade_bot_media.png"
          Just menuDif3 <- loadJuicy "img/escolhe_dificuldade_bot_dificil.png"
          Just menuDif4 <- loadJuicy "img/escolhe_dificuldade_bot_voltar.png"
          Just menuMapas1 <- loadJuicy "img/escolhe_mapa_1.png"
          Just menuMapas2 <- loadJuicy "img/escolhe_mapa_2.png"
          Just menuMapas3 <- loadJuicy "img/escolhe_mapa_3.png"
          Just menuMapas4 <- loadJuicy "img/escolhe_mapa_voltar.png"
          Just tanque0 <- loadJuicy "img/tanque0.png"
          Just tanque1 <- loadJuicy "img/tanque1.png"
          Just tanque2 <- loadJuicy "img/tanque2.png"
          Just tanque3 <- loadJuicy "img/tanque3.png"
          Just v <- loadJuicy "img/vazia.png"
          Just bI <- loadJuicy "img/bIndestrutivel.png"
          Just bD <- loadJuicy "img/bDestrutivel.png"
          Just background <- loadJuicy "img/background1_3.jpg"
          Just disparoCanhao0 <- loadJuicy "img/shot4.png"
          Just disparoCanhao1 <- loadJuicy "img/shot5.png"
          Just disparoCanhao2 <- loadJuicy "img/shot6.png"
          Just disparoCanhao3 <- loadJuicy "img/shot7.png"
          Just disparoLaser0 <- loadJuicy "img/laser0.png"
          Just disparoLaser1 <- loadJuicy "img/laser1.png"
          Just disparoLaser2 <- loadJuicy "img/laser2.png"
          Just disparoLaser3 <- loadJuicy "img/laser3.png"
          Just disparoChoque0 <- loadJuicy "img/shock0.png"
          Just disparoChoque1 <- loadJuicy "img/shock1.png"
          Just disparoChoque2 <- loadJuicy "img/shock2.png"
          Just disparoChoque3 <- loadJuicy "img/shock3.png"
          Just infoJogador1 <- loadJuicy "img/jogador_info_0_final.png"
          Just infoJogador2PVP <- loadJuicy "img/jogador_info_1_final.png"
          Just infoJogador3PVP <- loadJuicy "img/jogador_info_2.png"
          Just infoJogador4PVP <- loadJuicy "img/jogador_info_3.png"
          Just infoBot1 <- loadJuicy "img/bot_info_1.png"
          Just infoBot2 <- loadJuicy "img/bot_info_2.png"
          Just infoBot3 <- loadJuicy "img/bot_info_3.png"
          Just regras <- loadJuicy "img/regrasJogo.png"
          Just imgFinalPVP <- loadJuicy "img/imagem_final_vsplayer.png"
          Just imgWinBots <-loadJuicy "img/imagem_final_win_vsbot.png"
          Just imgLossBots <-loadJuicy "img/imagem_final_loss_vsbot.png"
          let
           imgNum = [scale (0.6) (0.6) num0,scale (0.6) (0.6) num1,scale (0.6) (0.6) num2,scale (0.6) (0.6) num3,scale (0.6) (0.6) num4,scale (0.6) (0.6) num5, scale (0.6) (0.6) num6,scale (0.6) (0.6) num7,scale (0.6) (0.6) num8,scale (0.6) (0.6) num9]
           imgMenuP = [menuPrincipal1, menuPrincipal2]
           imgMenuJvsJ = [menuPVP1, menuPVP2, menuPVP3, menuPVP4]
           imgMenuJvsBot = [menuPvsBot1, menuPvsBot2, menuPvsBot3, menuPvsBot4]
           imgMenuDif = [menuDif1,menuDif2,menuDif3,menuDif4]
           imgMenuM = [menuMapas1, menuMapas2, menuMapas3, menuMapas4]
           imgPecas = [scale (20/224) (20/224) v ,scale (20/64) (20/64) bI, scale (18 / 64) (18 / 64) bD]
           imgTanques = [scale (40/186) (40/186)  tanque0, scale (40/175) (40/175) tanque1, scale (40/200) (40/212) tanque2, scale (40/730) (40/730) tanque3] 
           imgCanhao = [scale (40/256) (40/256) disparoCanhao0,scale (40/256) (40/256) disparoCanhao1,scale (40/256) (40/256) disparoCanhao2, scale (40/256) (40/256) disparoCanhao3]
           imgLaser = [scale (40/128) (40/128) disparoLaser0, scale (40/128) (40/128) disparoLaser1, scale (40/128) (40/128) disparoLaser2, scale (40/128) (40/128) disparoLaser3]
           imgChoque = [scale (120/400) (120/400) disparoChoque0, scale (120/400) (120/400) disparoChoque1, scale (120/400) (120/400) disparoChoque2, scale (120/400) (120/400) disparoChoque3]
           imgInfoPVP = [scale 0.6 0.6 infoJogador1, scale 0.6 0.6 infoJogador2PVP, scale 0.6 0.6 infoJogador3PVP, scale 0.6 0.6 infoJogador4PVP]
           imgInfoBots = [scale 0.6 0.6 infoJogador1, scale 0.6 0.6 infoBot1, scale 0.6 0.6 infoBot2, scale 0.6 0.6 infoBot3]
           imgRegras= [scale (0.65) (0.8) regras]
           imgEcraFinal = [imgFinalPVP,imgWinBots,imgLossBots]
           imgBackground = [background]
          play dm              -- janela onde irá correr o jogo
               (greyN 0.75)     -- côr do fundo da janela
               fr              -- frame rate
               (jogoInicial ([imgNum,imgMenuP,imgMenuJvsJ, imgMenuJvsBot,imgMenuDif, imgMenuM,imgPecas, imgTanques , imgCanhao , imgLaser , imgChoque , imgInfoPVP, imgInfoBots, imgRegras, imgEcraFinal , imgBackground]))  -- estado inicial
               desenhaJogo  -- desenha o estado do jogo
               reageEvento    -- reage a um evento
               reageTempo    -- reage ao passar do tempo


-- | Função responsável por iniciar as variáveis do jogo.
--
-- O valor da variável 'menuPrincipal' é iniciada como True pois esse deve ser o primeiro menu que o jogador vê
jogoInicial :: [[Picture]] -> Jogo
jogoInicial i = (Jogo True 1 False 1 False 1 False 1 eInicial i 0 False)

-- | Quando já todos os menus foram percorridos, ou seja, o tipo de jogo já foi escolhido, assim como o número de jogadores e o mapa, cria um estado com todas as caracteristícas que foram selecionadas.
criaEstado :: Jogo -> Estado
criaEstado (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou) = (Estado ((!!) lMapas (escolhaM-1)) (take (numeroJ+1) ((!!) lLJogadores (escolhaM-1))) [])

-- ** Funções de reação a eventos

-- | Consoante a parte do jogo onde estivermos (Menus, jogo pvp ou jogo pvb) os comandos serão diferentes, esta funçção encaminhará os comandos para o processamento certo
--
-- __Nota:__ Em vez de se ter apenas uma função para reagir aos eventos, decidimos ter 3 para que o código ficasse mais claro, quando se está num menu chama-se a função 'reageEventoMenu', quando se está contra player a função 'reageEventoPVP' e contra bots a função 'reageEventoPVBot'
reageEvento :: Event -> Jogo -> Jogo
reageEvento e (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM estado i contador acabou) | menu || menuJ || menuD ||menuM || acabou = reageEventoMenu e (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM estado i contador acabou)
                                                                                                    | tJogo == 1 = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (reageEventoPVP e estado) i contador acabou)
                                                                                                    | tJogo == 2 =  (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (reageEventoPVBot e estado) i contador acabou)


-- | Função responsável por reagir aos comandos do jogador, enquanto este se encontra dentro dos vários menus
--
-- A função irá navegando entre menus e opções ao manipular os boleanos e os inteiros do tipo de dados 'Jogo'
--
-- __Nota:__O Jogador tanto pode navegar no menu usando as estas como os números indicados.

reageEventoMenu :: Event -> Jogo -> Jogo
reageEventoMenu (EventKey (Char '1')    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)  | menu  = (Jogo menu 1 menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                    | menuJ = (Jogo menu tJogo menuJ 1 menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                    | menuD = (Jogo menu tJogo menuJ numeroJ menuD 1 menuM escolhaM e i contador acabou)
                                                                                                                                    | menuM = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM 1 e i contador acabou)

reageEventoMenu (EventKey (Char '2')    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)  | menu  = (Jogo menu 2 menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                    | menuJ = (Jogo menu tJogo menuJ 2 menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                    | menuD = (Jogo menu tJogo menuJ numeroJ menuD 2 menuM escolhaM e i contador acabou)
                                                                                                                                    | menuM = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM 2 e i contador acabou)

reageEventoMenu (EventKey (Char '3')    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD  menuM escolhaM e i contador acabou)  | menu  = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                     | menuJ = (Jogo menu tJogo menuJ 3 menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                     | menuD = (Jogo menu tJogo menuJ numeroJ menuD 3 menuM escolhaM e i contador acabou) 
                                                                                                                                     | menuM = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM 3 e i contador acabou)  

reageEventoMenu (EventKey (Char '4')    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD  menuM escolhaM e i contador acabou)  | menu =  (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                     | menuJ = (Jogo menu tJogo menuJ 4 menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                     | menuD = (Jogo menu tJogo menuJ numeroJ menuD 4 menuM escolhaM e i contador acabou) 
                                                                                                                                     | menuM = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM 4 e i contador acabou) 

reageEventoMenu (EventKey (SpecialKey KeyRight)    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)  | menuJ && elem numeroJ [1,2,3] = (Jogo menu tJogo menuJ (numeroJ+1) menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuJ = (Jogo menu tJogo menuJ 1 menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD && elem numeroD [1,2,3] = (Jogo menu tJogo menuJ numeroJ menuD (numeroD+1) menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD = (Jogo menu tJogo menuJ numeroJ menuD 1 menuM escolhaM e i contador acabou)
                                                                                                                                               | menuM && elem escolhaM[1,2,3] = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM (escolhaM+1) e i contador acabou)
                                                                                                                                               | menuM  = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM 1 e i contador acabou)
                                                                                                                                               | otherwise = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)


reageEventoMenu (EventKey (SpecialKey KeyLeft)    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)  | menuJ && elem numeroJ [2,3,4] = (Jogo menu tJogo menuJ (numeroJ-1) menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuJ = (Jogo menu tJogo menuJ 4 menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD && elem numeroD [2,3,4] = (Jogo menu tJogo menuJ numeroJ menuD (numeroD-1) menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD = (Jogo menu tJogo menuJ numeroJ menuD 4 menuM escolhaM e i contador acabou)
                                                                                                                                               | menuM && elem escolhaM[2,3,4] = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM (escolhaM-1) e i contador acabou)
                                                                                                                                               | menuM  = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM 4 e i contador acabou)
                                                                                                                                               | otherwise = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou) 

reageEventoMenu (EventKey (SpecialKey KeyDown)    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)   | menu && tJogo == 1 = (Jogo menu 2 menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menu && tJogo == 2 = (Jogo menu 1 menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)    
                                                                                                                                               | menuJ && (numeroJ == 1 || numeroJ == 2) = (Jogo menu tJogo menuJ (numeroJ + 2) menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuJ = (Jogo menu tJogo menuJ (numeroJ - 2) menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD && (numeroD == 1 || numeroD == 2) = (Jogo menu tJogo menuJ numeroJ menuD (numeroD+2) menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD = (Jogo menu tJogo menuJ numeroJ menuD (numeroD-2) menuM escolhaM e i contador acabou)
                                                                                                                                               | menuM && (escolhaM == 1 || escolhaM == 2) = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM (escolhaM +2) e i contador acabou)
                                                                                                                                               | menuM  = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM (escolhaM - 2) e i contador acabou)
                                                                                                                                               | otherwise = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)

reageEventoMenu (EventKey (SpecialKey KeyUp)    Down _ _) (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)     | menu && tJogo == 2 = (Jogo menu 1 menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menu && tJogo == 1 = (Jogo menu 2 menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)    
                                                                                                                                               | menuJ && (numeroJ == 1 || numeroJ == 2) = (Jogo menu tJogo menuJ (numeroJ + 2) menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuJ = (Jogo menu tJogo menuJ (numeroJ - 2) menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD && (numeroD == 1 || numeroD == 2) = (Jogo menu tJogo menuJ numeroJ menuD (numeroD+2) menuM escolhaM e i contador acabou)
                                                                                                                                               | menuD = (Jogo menu tJogo menuJ numeroJ menuD (numeroD-2) menuM escolhaM e i contador acabou)
                                                                                                                                               | menuM && (escolhaM == 1 || escolhaM == 2) = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM (escolhaM +2) e i contador acabou)
                                                                                                                                               | menuM  = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM (escolhaM - 2) e i contador acabou)
                                                                                                                                               | otherwise = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                      
reageEventoMenu (EventKey (SpecialKey KeyEnter)    Down _ _) jogo@(Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)  | menu =  (Jogo False tJogo True numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                                    | menuJ && numeroJ == 4 = (Jogo True tJogo False numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                                                                                    | menuJ && tJogo == 1 = (Jogo menu tJogo False numeroJ menuD numeroD True escolhaM e i contador acabou)
                                                                                                                                                    | menuJ = (Jogo menu tJogo False numeroJ True numeroD menuM escolhaM e i contador acabou)
                                                                                                                                                    | menuD && numeroD == 4 = (Jogo menu tJogo True numeroJ False numeroD menuM escolhaM e i contador acabou)
                                                                                                                                                    | menuD = (Jogo menu tJogo menuJ numeroJ False numeroD True escolhaM e i contador acabou)
                                                                                                                                                    | menuM && escolhaM == 4 && tJogo == 1 = (Jogo menu tJogo True numeroJ menuD numeroD False escolhaM e i contador acabou)
                                                                                                                                                    | menuM && escolhaM == 4 = (Jogo menu tJogo menuJ numeroJ True numeroD False escolhaM e i contador acabou)
                                                                                                                                                    | menuM = (Jogo menu tJogo menuJ numeroJ menuD numeroD False escolhaM (criaEstado jogo) i contador acabou)
                                                                                                                                                    | acabou = (jogoInicial i)

reageEventoMenu _ j = j

-- | Função responsável por reagir aos inputs do jogador quando ele está a jogar contra bots
--
--  Como só há um jogador que não é bot, a função só reage aos inputs do jogador 1
--
-- __Nota:__ Assim como a função 'reageEventoPVP', vai usar a função 'jogada' definida na Tarefa 2

reageEventoPVBot :: Event -> Estado -> Estado
reageEventoPVBot (EventKey (Char 'w')    Down _ _) estado  = jogada 0 (Movimenta C) estado
reageEventoPVBot (EventKey (Char 's')    Down _ _) estado  = jogada 0 (Movimenta B) estado
reageEventoPVBot (EventKey (Char 'a')    Down _ _) estado  = jogada 0 (Movimenta E) estado
reageEventoPVBot (EventKey (Char 'd')    Down _ _) estado  = jogada 0 (Movimenta D) estado
reageEventoPVBot (EventKey (Char '1')    Down _ _) estado  = jogada 0 (Dispara Canhao) estado
reageEventoPVBot (EventKey (Char '2')    Down _ _) estado  = jogada 0 (Dispara Laser) estado
reageEventoPVBot (EventKey (Char '3')    Down _ _) estado  = jogada 0 (Dispara Choque) estado
reageEventoPVBot _ s = s


-- | Função responsável por reagir aos inputs dos vários jogadores
--
-- __Nota:__ Os comandos que não correspondam à teclas dos jogadores em jogo serão ignorados, isto foi alcançado alteranjo ligeiramente a função 'jogada' na tarefa2 para que esta ignore quando é chamado o indíce de um jogador que não existe. 

reageEventoPVP :: Event -> Estado -> Estado
reageEventoPVP (EventKey (Char 'w')    Down _ _) estado  = jogada 0 (Movimenta C) estado
reageEventoPVP (EventKey (Char 's')    Down _ _) estado  = jogada 0 (Movimenta B) estado
reageEventoPVP (EventKey (Char 'a')    Down _ _) estado  = jogada 0 (Movimenta E) estado
reageEventoPVP (EventKey (Char 'd')    Down _ _) estado  = jogada 0 (Movimenta D) estado
reageEventoPVP (EventKey (Char '1')    Down _ _) estado  = jogada 0 (Dispara Canhao) estado
reageEventoPVP (EventKey (Char '2')    Down _ _) estado  = jogada 0 (Dispara Laser) estado
reageEventoPVP (EventKey (Char '3')    Down _ _) estado  = jogada 0 (Dispara Choque) estado

reageEventoPVP (EventKey (Char 't')    Down _ _) estado  = jogada 1 (Movimenta C) estado
reageEventoPVP (EventKey (Char 'g')    Down _ _) estado  = jogada 1 (Movimenta B) estado
reageEventoPVP (EventKey (Char 'f')    Down _ _) estado  = jogada 1 (Movimenta E) estado
reageEventoPVP (EventKey (Char 'h')    Down _ _) estado  = jogada 1 (Movimenta D) estado
reageEventoPVP (EventKey (Char '4')    Down _ _) estado  = jogada 1 (Dispara Canhao) estado
reageEventoPVP (EventKey (Char '5')    Down _ _) estado  = jogada 1 (Dispara Laser) estado
reageEventoPVP (EventKey (Char '6')    Down _ _) estado  = jogada 1 (Dispara Choque) estado

reageEventoPVP (EventKey (Char 'i')    Down _ _) estado  = jogada 2 (Movimenta C) estado
reageEventoPVP (EventKey (Char 'k')    Down _ _) estado  = jogada 2 (Movimenta B) estado
reageEventoPVP (EventKey (Char 'j')    Down _ _) estado  = jogada 2 (Movimenta E) estado
reageEventoPVP (EventKey (Char 'l')    Down _ _) estado  = jogada 2 (Movimenta D) estado
reageEventoPVP (EventKey (Char '7')    Down _ _) estado  = jogada 2 (Dispara Canhao) estado
reageEventoPVP (EventKey (Char '8')    Down _ _) estado  = jogada 2 (Dispara Laser) estado
reageEventoPVP (EventKey (Char '9')    Down _ _) estado  = jogada 2 (Dispara Choque) estado

reageEventoPVP (EventKey (SpecialKey KeyUp)    Down _ _) estado  = jogada 3 (Movimenta C) estado
reageEventoPVP (EventKey (SpecialKey KeyDown)    Down _ _) estado  = jogada 3 (Movimenta B) estado
reageEventoPVP (EventKey (SpecialKey KeyLeft)    Down _ _) estado  = jogada 3 (Movimenta E) estado
reageEventoPVP (EventKey (SpecialKey KeyRight)    Down _ _) estado  = jogada 3 (Movimenta D) estado
reageEventoPVP (EventKey (Char ',')    Down _ _) estado  = jogada 3 (Dispara Canhao) estado
reageEventoPVP (EventKey (Char '.')    Down _ _) estado  = jogada 3 (Dispara Laser) estado
reageEventoPVP (EventKey (Char '-')    Down _ _) estado  = jogada 3 (Dispara Choque) estado

reageEventoPVP _ s = s


-- ** Funções de desenho 
-- | Função que, quando lhe dada um tipo de dados 'Jogo', irá mostrar no ecrã imagens respetivas a essa parte do jogo
--
-- __ A função pode mostrar__:
--
--   * O menu principal
--
--  <<screenshotMenuPrincipal.png>>
--
--   * O menu de escolha do número de jogadores
--
--  <<screenshotMenuPVP.png>> 
--
--   * O menu de escolha do número de bots
--
--  <<screenshotMenuPVBots.png>>
--
--   * O menu de escolha da dificuldade dos bots
--
--   <<screenshotMenuDificuldade.png>>
-- 
--   * O menu de escolha de mapa
--
--   <<screenshotMenuMapa.png>>
--
--   * O jogo em si, usando as funções 'desenhaEstado', 'desenhaInfo' e ainda mostrando a imagem que foi escolhida para servir de backgronud (este será a clausula otherwise, pois só quando todos os boleanos se encontram com o valor Falso é que o jogo começa)
--
--  <<screenshotJogo.png>>
--
--   * O menu de fim de jogo
--
--  <<screenshot_imagem_final_vsplayer.png>>
--  <<screenshot_imagem_final_win_vsbot.png>>
--  <<screenshot_imagem_final_loss_vsbot.png>>
desenhaJogo :: Jogo -> Picture
desenhaJogo (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e [imgNum,mP,mJvsJ,mJvsB,mD,mM,mapa,t,dca,dl,dch,infoJogadores,infoBots, [imgRegras],imgEcraFinal,[b]] contador acabou) | menu = ((!!) mP (tJogo-1))
                                                                                                                                                                                                 | menuJ && (tJogo == 1) = ((!!) mJvsJ (numeroJ-1))
                                                                                                                                                                                                 | menuJ && (tJogo == 2) = ((!!) mJvsB (numeroJ-1))
                                                                                                                                                                                                 | menuD = ((!!) mD (numeroD-1))
                                                                                                                                                                                                 | menuM = ((!!) mM (escolhaM-1))
                                                                                                                                                                                                 | acabou && tJogo == 1 = Pictures  [((!!) imgEcraFinal 0), Scale (2.3) (2.3) (Translate (230.0) (13.0) ((!!) imgNum (encontraVencedor (jogadoresEstado e) 1)))]
                                                                                                                                                                                                 | acabou && (encontraVencedor (jogadoresEstado e) 1) == 1 = ((!!) imgEcraFinal 1)
                                                                                                                                                                                                 | acabou = ((!!) imgEcraFinal 2)
                                                                                                                                                                                                 | tJogo == 1 =  Pictures [b, desenhaInfo e infoJogadores imgNum ,desenhaEstado e [mapa,t,dca,dl,dch],(Translate (450.0) (0.0) imgRegras)]
                                                                                                                                                                                                 | otherwise =  Pictures [b, desenhaInfo e infoBots imgNum ,desenhaEstado e [mapa,t,dca,dl,dch],(Translate (450.0) (0.0) imgRegras)]



-- | Função que mostra ao utilizador informação revelante acerca dos tanques (número de vidas, assim como munições de laser e choque)
desenhaInfo ::  Estado -- ^ Estado que contém as informações acerca dos jogadores
            -> [Picture] -- ^ Lista que contém as imagens da tabela de informações
            -> [Picture] -- ^ Lista que contém imagens de números de 0 a 9
            -> Picture -- ^ Imagem representativa das informações dos jogadores
desenhaInfo (Estado m lJogadores lDisparos) lImagens lNums = Pictures (aux lJogadores lImagens lNums (-500) 190)  
                                                             where
                                                              aux [] _ _ _ _ = []
                                                              aux ((Jogador (l,c) dir vid las cho):t) (h:tImagens) nums x y = [Translate x y h, Translate (x-50) y ((!!) nums vid), Translate (x+40) y ((!!) nums las), Translate (x+40) (y-35) ((!!) nums cho)] ++ (aux t tImagens nums x (y-130))


-- | Função responsável por trazer a 'Picture' que representa o 'Estado', ou seja, o mapa, os jogadores e os disparos, para o centro do ecrã, assim como ampliar/reduzir a imagem.
-- 
-- Para fazer isso trará o ponto de origem do mapa para o 2º quadrante, sendo por isso que as abcissas estão negativas e as ordenadas positivas. Além disso multiplica esses valores por 10 em vez dos habituais 20 )dimensão das imagens) para que apenas um quarto do mapa fique em cada quadrante 
--
-- __Nota__: A função irá comparar as dimensões do mapa para saber qual dos mapas é e aplicar o redimensionamento certo.

transfereEstadoCentro :: Mapa  -- ^ 'Mapa' do jogo. Será através das suas dimensões que a imagem é centrada 
                      -> Picture -- ^ Imagem representativa do 'Estado', antes de ser centrada
                      -> Picture -- ^ Imagem do 'Estado' já centrada
transfereEstadoCentro m x   | dimensaoMatriz m == (15,15) = Scale (1.4) (1.4) (Translate (fromIntegral (-c)*10) (fromIntegral l*10) x)
                            | dimensaoMatriz m == (20,20) = Scale (1.2) (1.2) (Translate (fromIntegral (-c)*10) (fromIntegral l*10) x)
                            | dimensaoMatriz m == (25,25) = Scale (0.98) (0.98) (Translate (fromIntegral (-c)*10) (fromIntegral l*10) x)
                              where  (l,c) = dimensaoMatriz m

-- | Função que cria uma Picture onde todo o "Jogo Principal" está desenhado
--
-- __Nota:__ Chamará todas estas funções para desenhar cada componente do 'Estado'
--
--         * 'desenhaMapa' - Função que desenhará o mapa
--
--         * 'desenhaTanques' - Função que representará cada um dos jogadores/bots
--
--         * 'desenhaCanhoes' - Função que desenha todos os 'DisparoCanhao'  
--
--         * 'desenhaLasers' - Função que desenha todos os 'DisparoLaser'  
--
--         * 'desenhaChoques' - Função que desenha todos os 'DisparoChoque'  
--  
desenhaEstado :: Estado -- ^ 'Estado' a ser desenhado
              -> [[Picture]] -- ^ Lista contendo todas as imagens que serão necessárias para desenhar o 'Estado' 
              -> Picture -- ^ Imagem representativa do 'Estado'
desenhaEstado estado@(Estado mapa lJogadores lDisparos) lImagens = transfereEstadoCentro mapa (Pictures ((desenhaMapa mapa ((!!) lImagens 0) (0,0)) ++ (desenhaTanques lJogadores ((!!) lImagens 1 )) ++ (desenhaCanhoes lDisparos ((!!) lImagens 2)) ++ (desenhaLasers mapa lDisparos ((!!) lImagens 3)) ++ (desenhaChoques estado ((!!) lImagens 4))))


-- | Função que desenha o mapa, processando uma linha do mapa de cada vez.
--
-- __Nota:__ Chama a função 'desenhaLinha', à qual é fornecida uma linha do mapa
desenhaMapa :: Mapa -- ^ Mapa a ser desenhado
            -> [Picture] -- ^ Lista de imagens que contém os sprites das várias peças
            -> Posicao  -- ^ Posição da linha do mapa que está a ser processada de momento, será útil para a função 'desenhaLinha'
            -> [Picture] -- ^ Lista de imagens que, em conjunto, representam o mapa
desenhaMapa [] _ _ = []
desenhaMapa (h:t) x (l,c) = (desenhaLinha h x (l,c)) ++ (desenhaMapa t x (l+1,0))

-- | Função que desenha uma linha do mapa, é auxiliar da função 'desenhaMapa'
--
-- __Nota__; Como cada peça tem como dimensões 20x20 píxeis, é preciso separar as coordenadas também por 20, por isso é que tanto as abcissas como as ordenadas surgem a multiplicar por 20
desenhaLinha :: [Peca] -- ^ Linha do mapa a ser desenhada
             -> [Picture] -- ^ Lista de imagens contendo os sprites das várias peças que podem constituir uma linha
             -> Posicao -- ^ Posição da peça a ser processada, útil para o construtor 'Translate'
             -> [Picture] -- ^ Lista de imagens representativa da linha
desenhaLinha [] _ _ = []
desenhaLinha ((Vazia):t) [v,bi,bd] (l,c) = [Translate (fromIntegral (c)*20) (fromIntegral (-l*20)) v] ++ (desenhaLinha t [v,bi,bd] (l,c+1))
desenhaLinha (Bloco Indestrutivel:t) [v,bi,bd] (l,c)= [Translate (fromIntegral c*20) (fromIntegral (-l)*20) bi] ++ (desenhaLinha t [v,bi,bd] (l,c+1))
desenhaLinha (Bloco Destrutivel:t) [v,bi,bd] (l,c)= [Translate (fromIntegral c*20) ((fromIntegral (-l)*20) - 1) bd] ++ (desenhaLinha t [v,bi,bd] (l,c+1))

-- | Desenha cada um dos tanques
--
-- O construtor Translate irá usar como coordenadas as coordenadas do tanque 
--
-- __Nota__: Como as coordenadas usadas no mapa e para os jogadores são diferentes, é preciso aplicar um fator de correção de meio bloco, ou seja, de 10 píxeis.
desenhaTanques :: [Jogador] -- ^ Lista de jogadores a desenhar
               -> [Picture] -- ^ Lista que contém os sprites dos tanques
               -> [Picture] -- ^ Lista de imagens que representam os tanques nas suas posições
desenhaTanques [] _  = []
desenhaTanques ((Jogador (l,c) dir vid las cho ):t) (h:tImagens)  | vid >0 = [Translate ((fromIntegral c*20)+10) ((fromIntegral (-l)*20)-10)  (rodaImagem h dir) ] ++ (desenhaTanques t tImagens) 
                                                                  | otherwise = desenhaTanques t tImagens
-- | Desenha os 'DisparoCanhao' presentes de momento
desenhaCanhoes :: [Disparo] -- ^ Lista de Disparos existentes
               -> [Picture] -- ^ Lista que contrém os sprites dos 4 'DisparoCanhao'
               -> [Picture] -- ^ Lista de imagens que representa todos os 'DisparoCanhao' presentes de momento
desenhaCanhoes [] lImagens = []
desenhaCanhoes ((DisparoCanhao j (l,c) dir):t) lImagens = [Translate ((fromIntegral c*20)+10) ((fromIntegral (-l)*20)-10) (rodaImagem ((!!) lImagens j) dir)] ++ (desenhaCanhoes t lImagens)
desenhaCanhoes (_:t) lImagens = desenhaCanhoes t lImagens

-- | Função encarrege de desenhar cada um dos Lasers
--
-- __Nota:__ Esta função usa como auxiliar a função 'desenhaLaser'. Uma explicação mais em detalhe do funcionamento da função encontra-se na documentação dessa função.
desenhaLasers :: Mapa -- ^ Mapa que está a ser utilizado, será passado como argumento à função auxiliar
              -> [Disparo] -- ^ Lista de Disparos existentes nesse tick no jogo
              -> [Picture] -- ^ Lista que contém os sprites dos 4 Lasers
              -> [Picture] -- ^ Lista de imagens que representam os 'DisparoLaser' presentes de momento no jogo
desenhaLasers m [] _ = []
desenhaLasers m ((DisparoLaser jogador (l,c) dir):t) lImagens = (desenhaLaser m (DisparoLaser jogador (l,c) dir) (rodaImagem ((!!) lImagens jogador) dir)) ++ (desenhaLasers m t lImagens)
desenhaLasers m (_:t) lImagens = desenhaLasers m t lImagens

-- | Função auxiliar à 'desenhaLasers'
--
--  A esta função é dado um 'DisparoLaser', aí, a função vai percorrendo as sucessivas posições que o laser pode tomar, colando, nas posições válidas, a imagem do Laser
--
--  Quando encontra um Bloco Indestrutível pára o seu avanço e, aí, retorna a lista de Imagens que corresponde à trajetória do Laser
--
-- __Nota:__ Chama as funções 'posicoesAVerificarMapa' e 'encontraPosicaoMatriz' para verificar se nas duas posiões que o Laser irá ocupar há algum 'Bloco Indestrutivel'

desenhaLaser :: Mapa -- ^ Mapa que está a ser utilizado, será utilizado para verificar quando um laser atinge uma parede
             -> Disparo -- ^ 'DisparoLaser' que está a ser processado 
             -> Picture -- ^ Sprite do 'DisparoLaser'
             -> [Picture] -- ^ Lista de Imagens correspondentes a todo o percurso do 'DisparoLaser'
desenhaLaser m (DisparoLaser j (l,c) dir) imagem | encontraPosicaoMatriz (l1,c1) m == Bloco Indestrutivel ||  encontraPosicaoMatriz (l2,c2) m == Bloco Indestrutivel = []
                                                 | otherwise = [Translate ((fromIntegral c*20)+10) ((fromIntegral (-l)*20)-10) imagem] ++ (desenhaLaser m (DisparoLaser j (avancaDisparo dir (l,c)) dir) imagem)
                                                  where ((l1,c1),(l2,c2)) = posicoesAVerificarMapa (l,c) dir

-- | Função que, dada uma 'Direcao' e a posição atual de um disparo, devolve a posição que o disparo irá ocupar de seguida
avancaDisparo :: Direcao -> PosicaoGrelha -> PosicaoGrelha
avancaDisparo C (l,c) = (l-1,c)
avancaDisparo D (l,c) = (l,c+1)
avancaDisparo B (l,c) = (l+1,c)
avancaDisparo E (l,c) = (l,c-1)

-- | Função encarregue de desenhar os 'DisparoChoque'
--
-- __Nota__: Como os 'DisparoChoque' não têm as coordenadas inseridas na sua informação, é preciso ir retirá-la ao jogador que a disparou, usando  @posicaoJogador((!!) lJogadores jogador)@
desenhaChoques :: Estado -- 'Estado' do jogo, será útil para conseguir associar cada 'DisparoChoque' à posição do Jogador que a disparou
               -> [Picture] -- Lista que contém os 4 sprites de Choques 
               -> [Picture] -- Lista de imagens, onde estão representados todos os choques presentes, nesse momento, no jogo
desenhaChoques (Estado mapa lJogadores []) lImagens = []
desenhaChoques (Estado mapa lJogadores ((DisparoChoque jogador ticks):t)) lImagens = let (l,c) = posicaoJogador((!!) lJogadores jogador)
                                                                                      in [Translate ((fromIntegral c*20)+10) ((fromIntegral (-l)*20)-10) ((!!) lImagens jogador) ] ++ desenhaChoques (Estado mapa lJogadores t) lImagens
desenhaChoques (Estado mapa lJogadores (_:t)) lImagens = desenhaChoques (Estado mapa lJogadores t) lImagens

-- | Função encarregue de rodar os sprites consoante a direção que lhe é dada, sabendo que todos os sprites estão originalmente orientados para cima
rodaImagem :: Picture -> Direcao -> Picture
rodaImagem x C = x
rodaImagem x D = Rotate 90 x
rodaImagem x B = Rotate 180 x
rodaImagem x E = Rotate 270 x

-- ** Funções de reação     

-- | Função que devolve qual é o vendedor
-- 
-- Como esta função só é chamada quando já sabemos que o jogo já acabou, basta encontrar o primeiro jogador cuj número de vidas não seja 0                                                                                                           
encontraVencedor :: [Jogador] -- ^Lista de Jogadores
                 -> Int -- ^ Acumulador que vai aumentando por cada jogadores verificado
                 -> Int -- ^ Número do vencedor
encontraVencedor [] _ = 1 
encontraVencedor ((Jogador (l,c) dir vid las cho):t) i | vid /= 0 = i
                                                       | otherwise = encontraVencedor t (i+1)


-- | Função responsável por processar a passagem do tempo, irá reagir de maneira diferente consoante as circunstâncias
--
-- __Diferentes processamentos__:
-- 
--  * __Está num menu__: A função não alterará o jogo, pois os menus não dependem do tempo
--
--  * __Está num jogo PVP__: A função irá chamar a função 'tick' definida na tarefa4, assim como também a função 'processaContador' para verificar se já está na altura de reabastecer as munições
--
--  * __Está num jogo PVBots__: Será chamada a função 'processaBots' que permitirá a cada bot fazer uma jogada. Chamará também a função ticks e a função 'processaContador'
-- 
--  * __Está num jogo contra bots e o jogador morreu__: Alterará o valor de 'acabou' para True
--
--  * __Está num jogo contra players e já só há um vivo__: Para saber se o jogo pvp já acabou aplica-se a função retiraMortos com um filter à lista de jogadores, se só sobrar um jogador significa que o jogo já acabou. Caso isso se verifique, muda o valor de 'acabou' para True
reageTempo :: Float -> Jogo -> Jogo
reageTempo n (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)  | menu || menuJ|| menuD || menuM || acabou = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador acabou)
                                                                                               | length (filter retiraMortos (jogadoresEstado e )) <= 1   = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador True)
                                                                                               | tJogo == 2 && (vidasJogador ((!!) (jogadoresEstado e) 0))  == 0 = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM e i contador True)
                                                                                               | tJogo == 2 = processaContador (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (processaBots numeroD 1 numeroJ (tick e)) i contador acabou) 
                                                                                               | otherwise = processaContador (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (tick e) i contador acabou) 
                                                                                               where
                                                                                                retiraMortos (Jogador (l,c) dir vid las cho) = vid /=0
-- || acabou na primeira linha
-- | tJogo == 2 && (vidasJogador ((!!) (jogadoresEstado e) 0))  == 0 = (Jogo menu tJogo menuJ numeroJ menuM escolhaM e i contador True) - acima do tJogo==2


-- | Função que, por cada bot, aplicará ao estado a jogada que cada um dos bots irá fazer.
--
--  Chamará diferentes funções de bots consoante a dificuldade escolhida.
--
--  __Nota:__ Usa a função 'retornaJogada' para alterar o estado individualmente, ou seja, a função 'processaBots' apenas servirá para ver se já processou os bots todos, enquanto a 'retornaJogada' e a função 'bot' é que estão a criar uma jogada e a aplicá-la ao estado.
processaBots :: Int -- ^ Indicador da dificuldade dos bots 
             -> Int -- ^ Contador que indicará quantos bots já foram processados
             -> Int -- ^ Número de bots do jogo
             -> Estado -- ^ Estado antes dos bots agirem
             -> Estado -- ^ Estado após os bots agirem
processaBots dif i n e |  dif == 1 && i <= n = processaBots dif (i+1) n (retornaJogada i (botFacil i e) e)
                       |  dif == 2 && i <= n = processaBots dif (i+1) n (retornaJogada i (botMedio i e) e)
                       |  dif == 3 && i <= n = processaBots dif (i+1) n (retornaJogada i (bot i e) e)
                       | otherwise = e

-- | Aplica a jogada que o bot quer fazer ao Estado
retornaJogada :: Int -- ^ Indice do bot, para aplicar na função 'jogada'
              -> Maybe Jogada -- ^ Jogada que o bot pretende fazer
              -> Estado -- ^ Estado antes do bot agir
              -> Estado -- ^ Estado após o bot agir
retornaJogada _ Nothing e = e
retornaJogada i (Just (Movimenta dir)) e = jogada i (Movimenta dir) e
retornaJogada i (Just (Dispara arma)) e = jogada i (Dispara arma) e


-- | Funão que tratará de, a cada 10 segundos, forncer ou uma munição de laser ou uma munição de choque aos jogadores.
--
-- A cada tick o valor do contador aumentará por 1.
--
-- Para marcar 10 segundos basta verificar quando é que o contador chega ao valor da framerate multiplicado por 10. Neste caso, quando chegar aos 40 ticks, todos os jogadores recebem um 'DisparoLaser'.
--
-- Passados mais 10 segundos, ou seja fr*20 (neste caso 80), todos os jogadores recebem um 'DisparoChoque' e o contador é reiniciado a 0.
processaContador :: Jogo -> Jogo 
processaContador (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (Estado mapa lJogadores lDisparos) i contador acabou) | contador  == fr*10 = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (Estado mapa (map atualizaLasers lJogadores) lDisparos) i (contador+1) acabou)
                                                                                                                                   | contador  == fr*20 = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (Estado mapa (map atualizaChoques lJogadores) lDisparos) i 0 acabou)
                                                                                                                                   | otherwise  = (Jogo menu tJogo menuJ numeroJ menuD numeroD menuM escolhaM (Estado mapa lJogadores lDisparos) i (contador+1) acabou)
                                                                                                                                   where 
                                                                                                                                    atualizaLasers (Jogador (l,c) dir vid 5 cho) = (Jogador (l,c) dir vid 5cho)
                                                                                                                                    atualizaLasers (Jogador (l,c) dir vid las cho) = (Jogador (l,c) dir vid (las+1) cho)
                                                                                                                                    atualizaChoques (Jogador (l,c) dir vid las 5) = (Jogador (l,c) dir vid las 5)
                                                                                                                                    atualizaChoques (Jogador (l,c) dir vid las cho) = (Jogador (l,c) dir vid las (cho+1))                                                                                                                     

-- * Discussão e Conclusão
-- | A liberdade que foi dada aos alunos nesta Tarefa para desenvolverem os gráficos do jogo a seu gosto, serviu como uma grande fonte de motivação.
--
--  Embora, à primeira vista de alguém que nunca o tenha usado, o gloss pareça uma ferramente confusa para quem nunca trabalhou com ela, rapidamente se revela muito útil e de fácil utilização.
--
--  Encontramo-nos bastante satisfeitos com o trabalho realizado nesta tarefa, tanto por ter sido desenvolvida uma interface com apelo estetico como por conter gameplay que, embora longe de perfeito, cative um pouco o utilizador.

conclusaoT5 :: String
conclusaoT5 = "Variável que existe para que os comentários da conclusão sejam visíveis"


                                                                     

