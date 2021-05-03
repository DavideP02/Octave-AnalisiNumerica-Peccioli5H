% https://github.com/DavideP02/Scuola_Liceo_5_Informatica_Octave-AnalisiNumerica-Peccioli5H/blob/main/analisi.m

f = input('Inserire la funzione, ricordandosi di includere "@(x)" prima della dichiarazione: ')
g = @(x) 0

f1 = figure; %stampare il grafico per visualizzare l'intervallo contenente gli zeri
axis equal

start = -20; % inizio della funzione stampata
stop = 20; % fine della funzione stampata
Fx = [0 0]; % insieme dei punti da stampare

while start < stop % provo tutti i punti da start a stop

  if mod(angle(f(start)), pi) == 0 % se la funzione nel punto considerato è reale, aggiungo il punto a quelli da stampare
    if abs(f(start)) > 100 % evito di stampare grafici deformati
      Fx = cat(1, Fx, [start Inf]);
    else
      Fx = cat(1, Fx, [start f(start)]);
    endif
  elseif mod(angle(f(start)), pi) != 0 % se la funzione nel punto considerato non è reale
    if mod(angle(f(start-(1/1000))), pi) == 0 % ma nel punto subito precedente sì (ovvero mi trovo alla fine di un intervallo in cui la funzione esiste)
      [r, c] = size(Fx);
      Fx = Fx(2:r, :);
      plot(Fx(:, 1), Fx(:, 2), 'b') % stampo il grafico di tutti i punti della funzione nell'intervallo precedente, ad eccezione del primo (0,0), inserito in automatico
      hold on
    endif
    Fx = [0 0]; % resetto l'insieme di punti da stampare
  endif

  start = start + (1/1000); % passo al punto successivo
end
if mod(angle(f(start-(1/1000))), pi) == 0
  [r, c] = size(Fx);
  Fx = Fx(2:r, :);
  plot(Fx(:, 1), Fx(:, 2), 'b')
  hold on
endif
Fx = [0 0]; % resetto l'insieme di punti da stampare

fplot(g)
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = input('Inserire estremo destro: ')
scatter(a, f(a), 30, 'm', 'Filled') % disegnare i punti scelti per l'intervallo
hold on
b = input('Inserire estremo sinistro: ')
scatter(b, f(b), 30, 'm', 'Filled')

estremodestro = a;
estremosinistro = b;

attendere = input('Schiaccia invio per iniziare')
close(f1)

f2 = figure; % grafico dell'intervallo zoomato
axis equal

while a < b % provo tutti i punti da a a b

  if mod(angle(f(a)), pi) == 0 % se la funzione nel punto considerato è reale, aggiungo il punto a quelli da stampare
    if abs(f(a)) > 100 % evito di stampare grafici deformati
      Fx = cat(1, Fx, [a Inf]);
    else
      Fx = cat(1, Fx, [a f(a)]);
    endif
  elseif mod(angle(f(a)), pi) != 0 % se la funzione nel punto considerato non è reale
    if mod(angle(f(a-(1/1000))), pi) == 0 % ma nel punto subito precedente sì (ovvero mi trovo alla fine di un intervallo in cui la funzione esiste)
      [r, c] = size(Fx);
      Fx = Fx(2:r, :);
      plot(Fx(:, 1), Fx(:, 2), 'b') % stampo il grafico di tutti i punti della funzione nell'intervallo precedente, ad eccezione del primo (0,0), inserito in automatico
      hold on
    endif
    Fx = [0 0]; % resetto l'insieme di punti da stampare
  endif

  a = a + (1/1000); % passo al punto successivo
end
if mod(angle(f(a-(1/1000))), pi) == 0
  [r, c] = size(Fx);
  Fx = Fx(2:r, :);
  plot(Fx(:, 1), Fx(:, 2), 'b')
  hold on
endif
Fx = [0 0]; % resetto l'insieme di punti da stampare
a = estremodestro

hold on
fplot(g, [a,b])
hold on
scatter(a, f(a), 30, 'm', 'Filled') % disegnare i punti scelti per l'intervallo
hold on
scatter(b, f(b), 30, 'm', 'Filled')
hold on

attendere = input('Schiaccia invio per continuare con ALGORITMO DI BISEZIONE')

i = 0;

while abs(f((a+b)/2)) > 1E-15
  m = (a+b)/2;
  if f(a)*f(m) < 0
    b = m;
  elseif f(b)*f(m) < 0
    a = m;
  end
  scatter(a, f(a), 10, 'Filled')
  hold on
  scatter(b, f(b), 10, 'Filled')
  hold on
  i = i + 1;
end


scatter(m, f(m), 50, 'r','Filled')

cicli_bisezione = i
zero_bisezione = m

% saveas(f2,'Bisezione.png') % per salvare i grafici come png

attendere = input('Schiaccia invio per continuare con ALGORITMO DI NEWTON')

f3 = figure % grafico dell'intervallo zoomato
axis equal

while a < b % provo tutti i punti da a a b

  if mod(angle(f(a)), pi) == 0 % se la funzione nel punto considerato è reale, aggiungo il punto a quelli da stampare
    if abs(f(a)) > 100 % evito di stampare grafici deformati
      Fx = cat(1, Fx, [a Inf]);
    else
      Fx = cat(1, Fx, [a f(a)]);
    endif
  elseif mod(angle(f(a)), pi) != 0 % se la funzione nel punto considerato non è reale
    if mod(angle(f(a-(1/1000))), pi) == 0 % ma nel punto subito precedente sì (ovvero mi trovo alla fine di un intervallo in cui la funzione esiste)
      [r, c] = size(Fx);
      Fx = Fx(2:r, :);
      plot(Fx(:, 1), Fx(:, 2), 'b') % stampo il grafico di tutti i punti della funzione nell'intervallo precedente, ad eccezione del primo (0,0), inserito in automatico
      hold on
    endif
    Fx = [0 0]; % resetto l'insieme di punti da stampare
  endif

  a = a + (1/1000); % passo al punto successivo
end
if mod(angle(f(a-(1/1000))), pi) == 0
  [r, c] = size(Fx);
  Fx = Fx(2:r, :);
  plot(Fx(:, 1), Fx(:, 2), 'b')
  hold on
endif
Fx = [0 0]; % resetto l'insieme di punti da stampare
a = estremodestro

hold on
fplot(g, [a,b])
hold on
scatter(a, f(a), 30, 'm', 'Filled') % disegnare i punti scelti per l'intervallo
hold on
scatter(b, f(b), 30, 'm', 'Filled')
hold on

i = 0;
a = estremodestro;
b = estremosinistro;

epsilon = 1E-10; % ho dovuto utilizzare questa epsilon perché con un numero minore non stampava la derivata corretta
dprima = @(x) (f(x+epsilon)-f(x))/(epsilon);
epsilona = 1E-3; % ho dovuto utilizzare questa epsilon perché con un numero minore non stampava la derivata corretta
dseconda = @(x) (dprima(x+epsilona)-dprima(x))/(epsilona);

m = 0;

if f(a)*dseconda(a) > 0
  m = a;
elseif f(b)*dseconda(b) > 0
  m = b;
end

while abs(f(m)) > 1E-15
  m = m - f(m)/dprima(m);
  i = i+1;
  scatter(m, f(m), 10, 'Filled')
  hold on
end

scatter(m, f(m), 50, 'r','Filled')

cicli_newton = i
zero_newton = m

attendere = input('Schiaccia invio per chiudere')

% saveas(f3,'Newton.png') % per salvare i grafici su png
