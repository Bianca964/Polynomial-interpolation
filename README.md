
# Polynomial interpolation

## PARSE_DATA
    Functia doar citeste datele dintr-un fisier.

## SPLINE_C2
        Functia 'spline_c2' construieste un sistem de ecuatii (continuu de
    clasa a doua care trece printr-un set de puncte x, y) pentru a determina
    coeficientii polinoamelor cubice care alcatuiesc spline-ul.
        Initializari:
    ~ n reprezinta numarul de intervale intre punctele x
    ~ A este matricea sistemului de ecuatii care va avea dimensiunea 4n x 4n,
    deoarece pentru fiecare dintre cele n intervale vom avea cate 4 coeficienti
    (a, b, c, d) ai polinoamelor cubice
    ~ b este vectorul termenilor liberi din sistemul de ecuatii si va avea
    dimensiunea 4n x 1
        TODO1 && TODO2: Pentru fiecare interval, spline-ul trebui sa treaca
    prin punctele date, acest lucru fiind verificat de ecuatiile : si(xi) = yi
    si s_n-1(xn) = yn
        TODO3 && TODO4 && TODO5 : realizeaza conditiile de continuitate ale
    functiei, ale primei derivate, respectiv ale celei de-a doua derivata a
    functiei.
        TODO6 && TODO7 : realizeaza conditia ca a doua derivata sa fie 0
    (s0''(x0) = 0) si conditia ca spline-ul sa fie natural (s_n-1''(x_n) = 0).
        Dupa toate acestea, se rezolva sistemul de ecuatii liniare A \ b.

## P_SPLINE
        Aceasta functie evalueaza spline-ul cubic (cu continuitate de clasa a
    doua) la punctele de interpolare x_interp utilizand coeficientii
    spline-ului calculat anterior si punctele de nod x.
        Vectorul y_interp este initializat cu 0 , are aceeasi dimensiune ca
    x_interp.
        Functia histc este folosita pentru a determina in ce interval
    x(i) <= x_interp < x(i+1) se afla fiecare punct din x_interp. Rezultatul
    este vectorul interval_indices care contine pentru fiecare x_interp
    indicele intervalului corespunzator.Pentru fiecare interval [x(i), x(i+1)),
    functia identifica punctele din x_interp care se afla in acest interval
    (idx = (interval_indices == i)).
        Daca exista puncte de interpolare in intervalul curent (any(idx)),
    functia: 
        ~ extrage coeficientii a, b, c, si d pentru spline-ul cubic din
    intervalul curent
        ~ calculeaza deplasarea dx a fiecarui punct de interpolare fata
    de nodul stang al intervalului (x(i))
        ~ evalueaza polinomul cubic folosind formula spline-ului:
    si(x) = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3 si atribuie
    rezultatul in y_interp.

## VANDERMONDE
        Functia calculeaza coeficientii polinomului de interpolare folosind
    metoda matricei Vandermonde. Matricea (V) este construita astfel incat
    fiecare coloana i sa fie vectorul x ridicat la puterea i. Apoi rezolv
    sistemul de ecuatii liniar V * coef = y pentru a afla vectorul coloana
    coef ce contine coeficientii polinomului de interpolare. 

## P_VANDERMONDE
        Aceasta functie foloseste coeficientii unui polinom obtinut anterior
    prin interpolare cu functia vandermonde pentru a calcula valorile
    polinomului la punctele date de x_interp.
        ~ V: Matricea Vandermonde pentru punctele x_interp. Aceasta are m
    randuri (un rand pentru fiecare punct de interpolare) si n + 1 coloane
    (una pentru fiecare coeficient al polinomului).
        ~ Se initializeaza matricea V cu 1 in prima coloana. Apoi, in bucla
    for, fiecare coloana ulterioara este calculata ridicand elementele
    vectorului x_interp la puteri crescatoare.
        ~ y_interp: Vectorul rezultat care contine valorile polinomului
    evaluate la punctele x_interp. Se obtine prin inmultirea matricei
    Vandermonde V cu vectorul coeficientilor coef.
