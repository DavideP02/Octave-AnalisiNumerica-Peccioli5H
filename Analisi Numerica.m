% https://github.com/DavideP02/Octave_AnalisiNumerica_Peccioli5H/blob/main/Analisi%20Numerica.m

f = input('Inserire la funzione, ricordandosi di includere "@(x)" prima della dichiarazione: ') % input della funzione di cui studiare gli zeri
g = @(x) 0; % asse delle x

f1 = figure %stampare il grafico per visualizzare l'intervallo contenente gli zeri
axis equal
fplot(f)
hold on
fplot(g)
hold on

% richiedere gli estremi dell'intervallo
a = input('Inserire estremo destro: ') 
scatter(a, f(a), 30, 'm', 'Filled') % disegnare i punti scelti per l'intervallo
hold on
b = input('Inserire estremo sinistro: ') 
scatter(b, f(b), 30, 'm', 'Filled')

estremodestro = a;
estremosinistro = b;

attendere = input('Schiaccia invio per iniziare') % attendere input dell'utente
close(f1)

figure % grafico dell'intervallo zoomato
axis equal
fplot(f, [a,b])
hold on
fplot(g, [a,b])
hold on
scatter(a, f(a), 30, 'm', 'Filled') % disegnare i punti scelti per l'intervallo
hold on
scatter(b, f(b), 30, 'm', 'Filled')
hold on

attendere = input('Schiaccia invio per continuare con ALGORITMO DI BISEZIONE')

i = 0;

while abs(f((a+b)/2)) > 1E-15 % il ciclo va avanti fino ad una approssimazione di 1E-15
  m = (a+b)/2;
  if f(a)*f(m) < 0
    A = [a, m];
    a = min(A);
    b = max(A);
  elseif f(b)*f(m) < 0
    B = [b, m];
    a = min(B);
    b = max(B);
  end
  scatter(a, f(a), 10, 'Filled') % stampo i nuovi estremi trovati con questo ciclo
  hold on
  scatter(b, f(b), 10, 'Filled')
  hold on
  i = i + 1;
end


scatter(m, f(m), 50, 'r','Filled') % stampo lo zero ricavato con l'algoritmo di bisezione

m % stampo il valore dello zero
i % stampo il numero di cicli necessari per trovarlo

bisezione_i = 1;
bisezione_m = m;

attendere = input('Schiaccia invio per continuare con ALGORITMO DI NEWTON')

i = 0;
a = estremodestro;
b = estremosinistro;

f3 = figure % grafico dell'intervallo zoomato
axis equal
fplot(f, [a,b])
hold on
fplot(g, [a,b])
hold on
scatter(a, f(a), 30, 'm', 'Filled') % disegnare i punti scelti per l'intervallo
hold on
scatter(b, f(b), 30, 'm', 'Filled')
hold on

epsilon = 1E-10; % ho dovuto utilizzare questa epsilon perché con un numero minore non stampava la derivata corretta
dprima = @(x) (f(x+epsilon)-f(x))/(epsilon);
epsilona = 1E-3; % ho dovuto utilizzare questa epsilon perché con un numero minore non stampava la derivata corretta
dseconda = @(x) (dprima(x+epsilona)-dprima(x))/(epsilona);

r = 0;

if f(a)*dseconda(a) > 0
  r = a;
elseif f(b)*dseconda(b) > 0
  r = b;
end

while abs(f(r)) > 1E-15
  r = r - f(r)/dprima(r);
  i = i+1;
  scatter(r, f(r), 10, 'Filled')
  hold on
end

scatter(r, f(r), 50, 'r','Filled')

r
i

newton_r = r;
newton_i = i;

attendere = input('Schiaccia invio per chiudere')

% saveas(gcf,'Bisezione.png') per salvare i grafici su png
