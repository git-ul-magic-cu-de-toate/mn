function y = NumarAparitii(numefis, sir)
    fid = fopen(numefis, 'r');  % Deschide fișierul pentru citire
    if fid == -1
        error('Fișierul nu poate fi deschis.');
    end

    y = 0;  % Contor total apariții
    linie_nr = 1;  % Contor linii

    while ~feof(fid)
        linie = fgetl(fid);  % Citește linia curentă
        aparitii_linie = count(linie, sir);  % Numără aparițiile șirului în linie
        y = y + aparitii_linie;  % Adaugă la contorul total

        % Afișează linia cu numărul de apariții
        fprintf('%d: %s\n', aparitii_linie, linie);

        linie_nr = linie_nr + 1;
    end

    fclose(fid);  % Închide fișierul
    fprintf('Număr total de apariții: %d\n', y);
end

NumarAparitii('matrix.txt', '1')
