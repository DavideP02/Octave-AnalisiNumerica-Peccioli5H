% https://github.com/DavideP02/Octave_AnalisiNumerica_Peccioli5H/blob/main/Analisi%20Numerica.m

f = input('Inserire la funzione, ricordandosi di includere "@(x)" prima della dichiarazione: ')
g = @(x) 0

start = -20; % inizio della funzione stampata
fine = 20; % fine della funzione stampata
Fx = [0 0]; % insieme dei punti da stampare
[r,c] = size(Fx); % inizializzo le variabili r e c

f1 = figure %stampare il grafico per visualizzare l'intervallo contenente gli zeri
axis equal

while start < fine % provo tutti i punti da start a fine

  if mod(angle(f(start)), pi) == 0 % se la funzione nel punto considerato è reale, aggiungo il punto a quelli da stampare
    Fx = cat(1, Fx, [start f(start)]);
  elseif mod(angle(f(start)), pi) != 0 % se la funzione nel punto considerato non è reale
    if mod(angle(f(start-(1/1000))), pi) == 0 % ma nel punto subito precedente sì (ovvero mi trovo alla fine di un intervallo in cui la funzione esiste)
      [r,c] = size(Fx);
      Fx = Fx(2:r, :);
      plot(Fx(:, 1), Fx(:, 2), 'b') % stampo il grafico di tutti i punti della funzione nell'intervallo precedente, ad eccezione del primo (0,0), inserito in automatico
      hold on
    endif
    Fx = [0 0]; % resetto l'insieme di punti da stampare
  endif

  start = start + (1/1000) % passo al punto successivo
end
if mod(angle(f(start), pi) == 0 % se l'ultimo intervallo in cui la funzione è reale va avanti fino a fine, lo stampo.
  [r,c] = size(Fx);
  Fx = Fx(2:r, :);
  plot(Fx(:, 1), Fx(:, 2), 'b')
  hold on
endif

fplot(g)
hold on

attendere = input('attendere')
